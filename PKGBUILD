# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="dragon-tea"
pkgname=${_pkgbase}
pkgver=1.0.6
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Dragon Tea. Free Messenger"
arch=('any')
license=('GPL3')
depends=('glib2' 'gtk3' 'json-c' 'curl' 'libnotify')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}"
        "dragon-tea.desktop")
sha256sums=('75c034e12ae86c8337cff60154b8b07b089be493b6b015dc1b1dd4ac020d095a'
            'd07ed3f1c38a7e36dce5d49b1f20160e28df309ae73d612e7375051a57fc084e')

build(){
   BUILD_DIR="${srcdir}/build-${pkgver}-${pkgrel}"
   cmake -S "${srcdir}/${_pkgbase}-${pkgver}" -B "${BUILD_DIR}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
   cmake --build "${srcdir}/build-${pkgver}-${pkgrel}"
   cd  "${srcdir}/${_pkgbase}-${pkgver}/client-frontend/dragon-tea/localization/"
   sh "locale-gen.sh"
   cp -r "locale" "${BUILD_DIR}" 2>/dev/null
}

package(){
    BUILD_DIR="${srcdir}/build-${pkgver}-${pkgrel}"
    LOCALE_DIR="$BUILD_DIR/locale"
    install -Dm644 "${srcdir}/dragon-tea.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${BUILD_DIR}/dragontea" -t "${pkgdir}/usr/bin"
    install -Dm644 "${BUILD_DIR}/libteauilib.so" -t "${pkgdir}/usr/lib"
    cp -rv "${LOCALE_DIR}" "${pkgdir}/usr/share"
    chmod 644 -R "${pkgdir}/usr/share"
}
