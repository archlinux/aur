# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.6.2
pkgrel=1
pkgdesc="a tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs') # pkgconf covered by base-devel
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('97c0b36e40a3fb05479dc9b7553b090353d7d866a6b2808e305c42094bd8bf3af63b4a14acd28fceb978fbcb7e78555e6d06b208a54cc190026ffb351f59b2f0')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features --target-dir=target
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

    if [ ! -d "$pkgdir/usr/share/man/man${section}" ]; then
      install -d "$pkgdir/usr/share/man/man${section}"
    fi

    pandoc --standalone --to man \
      -o "$pkgdir/usr/share/man/man${section}/${title}.${section}" \
      "$filename"
  done
  IFS="$OLDIFS"
  unset OLDIFS
}
