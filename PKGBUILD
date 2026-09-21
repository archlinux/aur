# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-bin
_pkgname=Knot
pkgver=26.09.20
pkgrel=1
pkgdesc="An intelligent multi-scenario recording tool inspired by the minimalist concept of ancient 'knot-tying' memorization."
arch=('x86_64')
url="https://github.com/ic005k/Knot"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-5compat'
    'qt6-svg'
    'qt6-wayland'
    'qt6-serialport'
    'qt6-positioning'
    'qt6-tools'
    'icu'
    'sqlite'
    'openssl'
    'libgcrypt'
    'libgpg-error'
    'nss'
    'nspr'
    'nettle'
    'gmp'
    'keyutils'
    'krb5'
    'p11-kit'
    'libtasn1'
    'avahi'
    'e2fsprogs'
    'libproxy'
    'libinput'
)
optdepends=(
    'fcitx5-qt: Fcitx5 input method support'
    'ibus: IBus input method support'
    'cups: Print support'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2dde4702e1effe5daec7593cfee88267fbf61017ccda226bc363ac129215bdbf'
            '5076e0113e6e491d04559dd9ec0a80a35392bec88928393d47b8dd620aa96d66'
            '6f38e0cb252008b84532d5914cb851aa45518771db172e7f5a091fe16123e05e')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/icon/${pkgname%-bin}/g
        s/Application;/Utility;/g
        s/Name=${_pkgname}/Name=Android ${_pkgname}/g
    " "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    # Install main binary
    install -Dm755 "${srcdir}/squashfs-root/Knot" "${pkgdir}/usr/lib/${pkgname%-bin}/Knot"
    # Install qt.conf
    install -Dm644 "${srcdir}/squashfs-root/qt.conf" "${pkgdir}/usr/lib/${pkgname%-bin}/qt.conf"
    # Install plugins (keep only necessary ones, remove bundled Fcitx5 lib)
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/plugins"
    cp -a "${srcdir}/squashfs-root/plugins/." "${pkgdir}/usr/lib/${pkgname%-bin}/plugins/"
    # Remove bundled Fcitx5 libraries and symlinks (use system ones instead)
    rm -f "${pkgdir}/usr/lib/${pkgname%-bin}/plugins/platforminputcontexts/libFcitx5Qt6DBusAddons.so"*
    rm -f "${pkgdir}/usr/lib/${pkgname%-bin}/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so"
    # Install translations
    if [ -d "${srcdir}/squashfs-root/translations" ]; then
        cp -a "${srcdir}/squashfs-root/translations" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    fi
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}