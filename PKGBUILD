# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.10.1
pkgrel=1
pkgdesc="a tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs')
makedepends=('cargo' 'ruby-ronn-ng')
checkdepends=('bash-bats' 'python') # if you hate yourself, add procps-ng + bubblewrap
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8675ebb1da20a3729151a82b7eb68c762a5c8c7e6046d487b736161a2f1367a805934ae290873df015c9d3169a84e65db2ed8ec1fc1a68ec3c4146befe3f5227')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"

  # run cargo tests
  cargo test

  # create binary if not already built
  cargo build --release --locked --all-features
  # run cli tests
  # ensure recently-built binary is first in $PATH
  PATH="$(pwd)/target/release:$PATH"
  bats ./cli-tests
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"
  rm -rf "$pkgdir/usr/share/doc/$pkgname/man"

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
      install -d "$pkgdir/usr/share/man/man${section}"
    fi

    # generate man page
    ronn --roff \
      <"$filename" \
      >"$pkgdir/usr/share/man/man${section}/${title}.${section}"
  done
  IFS="$OLDIFS"
  unset OLDIFS
}
