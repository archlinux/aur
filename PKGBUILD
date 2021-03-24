# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.8.0
pkgrel=1
pkgdesc="a tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs')
makedepends=('cargo' 'ruby-ronn-ng')
checkdepends=('bash-bats') # if you hate yourself, add procps-ng + bubblewrap
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('289af01eef818023ceb56d587e6539f3e6fcf908c5d351211d2271ef1cc031d9f9e6bb2980c409ddb2757fdb95b2e9ddca4739cec738ce8abdcc9308b804f231')

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
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

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
