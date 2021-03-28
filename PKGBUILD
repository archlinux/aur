# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.4.1
pkgrel=1

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')
depends=('man-db' 'hicolor-icon-theme')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('df09d4675f5d54e9860c57b341e8360f950a2ea5df006b9721e9ad29e857df46b544c9473de21849994496a89e1c51057d056d188d95074bd705e358dbdec344')


build() {
  cd "$pkgname-$pkgver"
  go build -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver
                     -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y")
                     -s
                     -w"
  cd doc/man &&
  go run -ldflags "-X github.com/raphaelreyna/$pkgname/cmd.version=$pkgver
                   -X github.com/raphaelreyna/$pkgname/cmd.date=$(LC_TIME=C date +"%d-%B-%Y")" \
         ./main.go >"$pkgname.1"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname"           -t"$pkgdir/usr/bin/"
  install -Dm644 "doc/man/$pkgname.1" -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 "${pkgname}_banner.png" \
                 {README,doc/md/*}.md -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 icon/icon.svg        -t"$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE              -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
