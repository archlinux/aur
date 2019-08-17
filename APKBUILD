# Maintainer: navigaid <navigaid@gmail.com>

pkgname=apk-tools-static-bin
pkgver=2.10.4
pkgrel=2
pkgdesc="Alpine Package Keeper - package manager for alpine"
license='Apache'
url="https://github.com/navigaid/apk-tools"
arch='x86_64'
source="https://github.com/navigaid/apk-tools/releases/download/v$pkgver/apk.static"

package() {
    install -Dm 755 "$srcdir/apk.static" "$pkgdir/usr/bin/apk.static"
}
sha512sums="8316234ae66de3389181cb8e19bc9864c662a2d1e8bb78aaacfc9c05f0b0251b3bd936aa83d621a33ee8b8ed690044004a25094efc06e7704f3af47653e55b4f  apk.static"
