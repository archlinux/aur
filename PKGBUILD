pkgname=vboard
pkgver=1.15
pkgrel=3
pkgdesc='Virtual keyboard for Linux'
arch=('x86_64')
license=('LGPL-2.1')
url='https://github.com/mdev588/vboard'
depends=('python-uinput')

source=("https://github.com/mdev588/vboard/archive/refs/tags/v${pkgver}.tar.gz"
        "vboard.sh"
        "vboard.svg"
        "vboard.desktop"
        "0001-vboard.patch"
)
sha256sums=('40606d3bfbe6fc61b253e32bc28ce343831d9ca7d93323961f55763d8ec02505'
            '346e4f1afe0042754df39e4163ea6155176bfb13684e7f036d296540243e3f84'
            '031efefd5e05cb0bef121684a0fae465c8e54216a9bae69f1382a7c628b9865e'
            '1e046d36f704e8b783a21ed5dd00ccec9732265802454a2c59f278f618707345'
            '1c93c2ff37b5d53f97936935a03360804e0b15c1edc55d45d1c8a18609b321f6')

prepare() {
    cd "${srcdir}/vboard-${pkgver}"
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"

        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

package() {
    _srcdir="${srcdir}/vboard-${pkgver}"

    # main
    cd "${_srcdir}"
    install -dm755 "${pkgdir}/usr/share/vboard"
    install -m644 -t "${pkgdir}/usr/share/vboard" "vboard.py" "LICENSE"

    # script
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/vboard.sh" "${pkgdir}/usr/bin/vboard"

    # icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "${srcdir}/vboard.svg"

    # desktop
    install -dm755 "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/vboard.desktop" "${pkgdir}/usr/share/applications/vboard.desktop"
}
