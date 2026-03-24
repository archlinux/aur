# Maintainer: Wal33D <aquataze@yahoo.com>
pkgname=itchio-downloader
pkgver=1.1.0
pkgrel=1
pkgdesc="Download free games from itch.io programmatically — no API key, no Puppeteer, no GUI"
arch=('any')
url="https://github.com/Wal33D/itchio-downloader"
license=('ISC')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('5a29c295fc7ec739af19682829f216c4304f3e2acb44322a602d1524293cdd6a')
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
