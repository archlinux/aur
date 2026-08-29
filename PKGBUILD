# Maintainer: Nic Tanghe <nic.tanghe@gmail.com>

pkgname=xstudio-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Professional media playback, review, annotation, and comparison application (prebuilt binary)'
arch=('x86_64')
url='https://github.com/NicTanghe/FXiT_xStudio'
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'bash'
    'gcc-libs'
    'glibc'
    'glu'
    'hicolor-icon-theme'
    'libglvnd'
    'libpulse'
    'libx11'
    'libxext'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-webengine'
    'zlib-ng'
)
makedepends=('patchelf')
provides=("xstudio=${pkgver}")
conflicts=('xstudio')
options=('!debug' '!strip')
source=(
    "xstudio-${pkgver}-${pkgrel}-${CARCH}.tar.zst::https://github.com/NicTanghe/FXiT_xStudio/releases/download/xstudio-bin-v${pkgver}-${pkgrel}/xstudio-${pkgver}-${pkgrel}-${CARCH}.tar.zst"
    'xstudio.desktop'
)
sha256sums=(
    'a4ac07a6190c1b781daafc37bcc4a9bdad2243dc2983cd0b3d9fe9aa7652f981'
    '6fddbb74c03628d95b24db3cf14f2140ce10a6924ad2cc2cacde3310410239b8'
)

package() {
    install -d "${pkgdir}/usr/lib/xstudio"
    cp -a --no-preserve=ownership \
        "${srcdir}/xstudio-${pkgver}/." "${pkgdir}/usr/lib/xstudio/"

    install -d "${pkgdir}/usr/bin"
    ln -s '../lib/xstudio/bin/xstudio' "${pkgdir}/usr/bin/xstudio"

    patchelf --remove-rpath \
        "${pkgdir}/usr/lib/xstudio/lib/python/xstudio/core/__pybind_xstudio.cpython-311-x86_64-linux-gnu.so"
    rm -rf -- "${pkgdir}/usr/lib/xstudio/share/xstudio/docs/.doctrees"
    find "${pkgdir}/usr/lib/xstudio" -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete
    find "${pkgdir}/usr/lib/xstudio" -depth -type d -name '__pycache__' -empty -delete

    install -Dm644 "${srcdir}/xstudio.desktop" \
        "${pkgdir}/usr/share/applications/xstudio.desktop"
    install -Dm644 \
        "${srcdir}/xstudio-${pkgver}/share/xstudio/docs/_images/xstudio_logo_256_v1.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xstudio.svg"

    install -Dm644 "${srcdir}/xstudio-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/xstudio-${pkgver}/NOTICE.TXT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.TXT"
    cp -a --no-preserve=ownership \
        "${srcdir}/xstudio-${pkgver}/share/licenses/xstudio/third-party" \
        "${pkgdir}/usr/share/licenses/${pkgname}/"
}
