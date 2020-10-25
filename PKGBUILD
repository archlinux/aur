# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.3.0
pkgrel=1

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')
depends=('man-db')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('e7a12bba13ea72b9b5b3327b119c74dd07b40696dc493868b6511fa69d4af6bc856c571aa720c5a6fb2be4e88c797bd879d6fabdb25ce8b5479cdd87ca7709d6')


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
  install -Dm755 "$pkgname"                                   -t"$pkgdir/usr/bin/"
  install -Dm644 "doc/man/$pkgname.1"                         -t"$pkgdir/usr/share/man/man1/"
  install -Dm644 {README,doc/md/*}.md "${pkgname}_banner.png" -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE                                      -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
