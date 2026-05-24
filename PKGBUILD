# Maintainer: Nathan Chere <aur@nathanchere.com.au>
#
# QB64-PE has to write into its own install dir to compile user programs, so we
# install it group-writable and share the 'qb64' group with the older 'qb64'
# AUR package. The permission model is copied from there. I couldn't think of a
# cleaner way without increasingly complicated hacky syncs and links. Suggestions
# for improvements are most welcome.
pkgname=qb64pe
pkgver=4.5.0
pkgrel=1
pkgdesc='Modern cross-platform BASIC compatible with QBasic and QuickBASIC 4.5'
arch=('x86_64')
url='https://www.qb64phoenix.com/'
license=('MIT')
depends=('gcc' 'make' 'curl' 'glu' 'libpng' 'libxcb')
optdepends=('alsa-lib: required to compile programs that use audio')
options=('!strip' 'staticlibs' '!lto' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QB64-Phoenix-Edition/QB64pe/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('73cc9b50acfa2d37ad53dd6ce7af28eecfdfc34989f9c3fc1b7e9bc50cdec6ad'
            'd1642f5b0d6f14b214d656857c2c166cba879015b167a7912d6c5ebc110125d4')

_srcdir="QB64pe-${pkgver}"

build() {
    cd "${srcdir}/${_srcdir}"
    make OS=lnx BUILD_QB64=y -j"$(nproc)"
}

package() {
    cd "${srcdir}/${_srcdir}"

    local _appdir="${pkgdir}/opt/${pkgname}"

    # Drop ~1500 stale compile artefacts from internal/temp/
    # `make clean` can't be used because it also wipes .a archives we need at runtime
    find internal/temp -mindepth 1 -maxdepth 1 ! -name temp.bin -delete

    install -dm755 "${_appdir}"
    cp -a internal source licenses docs qb64pe qb64pe.1 Makefile \
        COPYING.txt SAMPLES.txt "${_appdir}/"

    chmod -R g+w "${_appdir}/internal"
    chmod g+w "${_appdir}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/qb64pe" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 source/qb64pe.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 qb64pe.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    install -Dm644 licenses/license_qb64.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 licenses/README.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
