# Maintainer: lostmason <lostmason@tutamail.com>
pkgname=holesail
pkgver=2.4.1
pkgrel=1
pkgdesc="TCP/UDP peer-to-peer proxy that lets you instantly share any application running on a specific port"
arch=('any')
url="https://github.com/holesail/holesail"
license=('AGPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('SKIP')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir from package.json files
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "s|${pkgdir}||g"

    # Remove references to $srcdir from package.json files
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "s|${srcdir}||g"

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
