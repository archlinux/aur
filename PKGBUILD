# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=mx-locale
pkgver=26.03
pkgrel=1
pkgdesc="GUI configuration tool for locales"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/mx-locale"
license=('GPL-3.0-or-later')
depends=('glibc' 'qt6-base' 'polkit')
makedepends=('cmake' 'ninja' 'qt6-tools')
options=('!debug')
source=("https://github.com/MX-Linux/mx-locale/archive/refs/tags/26.03.tar.gz")
sha256sums=('9190a083a233d7e4d6abd5dbd39535600024fc5625aa79bc8d60c38b20194bdd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DHELPER_INSTALL_DIR=/usr/lib/mx-locale \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}" \
        -DARCH_BUILD=ON

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 build/mx-locale "${pkgdir}/usr/bin/mx-locale"

    install -Dm755 build/helper "${pkgdir}/usr/lib/mx-locale/helper"
    install -Dm644 lib/locale.gen "${pkgdir}/usr/lib/mx-locale/locale.gen"
    install -Dm644 lib/locale.lib "${pkgdir}/usr/lib/mx-locale/locale.lib"

    install -dm755 "${pkgdir}/usr/share/mx-locale/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/mx-locale/locale/" 2>/dev/null || true

    install -Dm644 build/org.mxlinux.pkexec.mx-locale.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-locale.policy"

    install -Dm644 mx-locale.desktop "${pkgdir}/usr/share/applications/mx-locale.desktop"

    install -dm755 "${pkgdir}/usr/share/doc/mx-locale/help"

    install -Dm644 help/*.1 "${pkgdir}/usr/share/man/man1/" 2>/dev/null || true
    if [ -d help ]; then
        for help_file in help/*.html help/*.jpg help/*.png help/*.css; do
            [ -f "$help_file" ] && install -Dm644 "$help_file" "${pkgdir}/usr/share/doc/mx-locale/help/$(basename "$help_file")"
        done
    fi
    install -Dm644 license.html "${pkgdir}/usr/share/doc/mx-locale/license.html"
    if [ -f debian/changelog ]; then
        gzip -c debian/changelog > "${pkgdir}/usr/share/doc/mx-locale/changelog.gz"
    fi
}
