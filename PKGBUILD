# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.11.0
pkgrel=1
pkgdesc="A tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs')
makedepends=('git' 'rust' 'ruby-ronn-ng')
checkdepends=('bash-bats' 'python') # if you hate yourself, add procps-ng + bubblewrap
options=('!lto')
_commit='534c10a86af420b9edf2835c5232b085c38b79fc'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd "$pkgname"

  cargo build --release --frozen --all-features
}

check() {
  cd "$pkgname"

  # run cargo tests
  cargo test

  # run cli tests
  # ensure recently-built binary is first in $PATH
  PATH="$(pwd)/target/release:$PATH"
  bats ./cli-tests
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  cp -vr doc/* "$pkgdir/usr/share/doc/$pkgname"
  rm -vrf "$pkgdir/usr/share/doc/$pkgname/man"

  # man pages
  OLDIFS="$IFS"
  IFS="."
  cd doc/man
  for filename in *; do
    read -ra PART <<< "$filename"

    title="${PART[0]}"
    section="${PART[1]}"

    # generate man directory if required
    if [ ! -d "$pkgdir/usr/share/man/man${section}" ]; then
      install -vd "$pkgdir/usr/share/man/man${section}"
    fi

    # generate man page
    ronn --roff \
      <"$filename" \
      >"$pkgdir/usr/share/man/man${section}/${title}.${section}"
  done
  IFS="$OLDIFS"
  unset OLDIFS
}
