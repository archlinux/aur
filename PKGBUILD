# Maintainer: Wal33D <aquataze@yahoo.com>
pkgname=itchio-downloader
pkgver=1.2.0
pkgrel=1
pkgdesc="Download free games from itch.io programmatically - no API key, no Puppeteer, no GUI"
arch=('any')
url="https://github.com/Wal33D/itchio-downloader"
license=('ISC')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('20f20401ea903b772b4247081c1f5be1eff3c2403aec905912037840b10246cd')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir from installed files
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir from installed files
    local _tmp_package="$(cd "${srcdir}/${pkgname}-${pkgver}" 2>/dev/null && pwd)"
    if [ -n "${_tmp_package}" ]; then
        find "${pkgdir}" -name package.json -print0 | \
            xargs -0 sed -i "s|${_tmp_package}|/usr/lib/node_modules/${pkgname}|g"
    fi

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
