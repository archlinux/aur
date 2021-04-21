# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.9.0
pkgrel=1
pkgdesc="a tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs')
makedepends=('cargo' 'ruby-ronn-ng')
checkdepends=('bash-bats') # if you hate yourself, add procps-ng + bubblewrap
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e72931e6d88686755a56f37167ab8be46fa8baae95374aaaafbbf630415d6c9a1f87d1ceea123398ce0e0de4babcb327b6ce399e64ff0c2c45aa02abd88978c1')

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
