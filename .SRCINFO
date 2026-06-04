# Maintainer: Dragos Gatan <gatan9dragos@gmail.com>
pkgname=kilonova-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool for kilonova.ro"
arch=('any')
url="https://github.com/dragosgatan/kilonova-cli"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed7848aa99e1eb43369e039bcc2ace6a54ea60bc15cd760471753b21af496562')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 kn "$pkgdir/usr/bin/kn"
}
