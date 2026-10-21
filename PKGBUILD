# Maintainer: Nitro Cao <nitro@oixcloud.com>
pkgname=flclash-oixcloud
_pkgname=FlClash
pkgver=0.8.99+2026101807
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free (oixcloud custom build)"
arch=('x86_64')
url="https://oixcloud.com"
license=('GPL-3.0-only')
options=('!strip')
depends=(
    'libayatana-appindicator'
    'ayatana-ido'
    'libdbusmenu-glib'
    'libkeybinder3'
    'libsecret'
    'quickjs-c-bridge-git'
)
source=(
    "${pkgname}.sh"
    "${pkgname}-${pkgver}.deb::https://dl.dler.io/flclash-linux-amd64.deb"
)
sha256sums=(
    '3ed0072f459608696b592dde43d7a6ea49ef89d0173501d8bb10ce0b3f775e55'
    '68e5cc4ce6b17b4b845429990bd2c076eb72a117f79a491907721bf22e675d70'
)

prepare() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf "${srcdir}/data."*
    sed -i \
        -e "s/Exec=${_pkgname}/Exec=${pkgname}/g" \
        -e "s/Icon=${_pkgname}/Icon=${pkgname}/g" \
        -e "/^Categories=/c Categories=Network;" \
        -e "/^StartupNotify=/i StartupWMClass=com.follow.clash" \
        "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/opt/${pkgname}/"

    ln -sf /usr/lib/libquickjs_c_bridge_plugin.so "${pkgdir}/opt/${pkgname}/lib/libquickjs_c_bridge_plugin.so"

    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for size in 128 256; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
}
