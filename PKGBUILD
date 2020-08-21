# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=oneshot

pkgver=1.2.0
pkgrel=1

pkgdesc='First-come-first-serve single-fire HTTP/HTTPS server'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/raphaelreyna/$pkgname"
license=('MIT')

makedepends=('go')

options=('zipman')

install="$pkgname.install"
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('44a9e43d64e5ea4e3ba43e34963b6dff55a133c61c6faf6e3c59cbdad4dc8c9b8fd3423b3651d3414c462d6d51a240f895700f6d86c7aeb36b7a9c8de815d252')


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
