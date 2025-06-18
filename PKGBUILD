# Maintainer: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.2.9
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
sha256sums=('44b819d029ad9136899bf8ef979000d5d2e65ad6eb273764ca29dcb23ca6ece5')

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
