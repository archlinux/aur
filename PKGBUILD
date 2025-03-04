# Maintainer: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.2.5
pkgrel=1
pkgdesc="Auto-generate impressive commits with AI in 1 second"
arch=("any")
url="https://github.com/di-sukharev/opencommit"
license=('MIT')
depends=('nodejs')
makedepends=("npm")
provides=("$pkgname")
conflicts=("$pkgname")
options=('!strip')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('6b0b965714340ae3425ce2621753cbe6aea96d04f3f00a067ad4abf51ea35077')

prepare() {
    tar -xzf "$pkgname-$pkgver.tgz"
}

package() {
    npm install -g --production --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/package"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    
    install -dpm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "../../../lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
