# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=bupstash
pkgver=0.7.0
pkgrel=1
pkgdesc="a tool for encrypted backups"
arch=('x86_64')
url="https://github.com/andrewchambers/bupstash"
license=('MIT')
depends=('libsodium' 'gcc-libs') # pkgconf covered by base-devel
makedepends=('cargo' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6f6d5183fac662113df6f7d4b568dd2ed0cbdb7c87474afee183e800269bfb14ec514952b17e43ca8b10be18e7a8a4428f1bf0caa143c5fb4b08aee2b2f48bcb')

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
