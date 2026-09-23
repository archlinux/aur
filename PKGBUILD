# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
_pkgname=EasyConnect
pkgver=7.6.7.3
_electronversion=1
pkgrel=14
_pangover=1.42.4
pkgdesc="Support access to ssl vpn. With easyconect,you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname}"
    "${pkgname}-rpc"
    "${pkgname}-zjjy"
    "${pkgname}-sdu"
    "${pkgname}-cas"
)
depends=(
    'gtk2'
    'alsa-lib'
    'nss'
    'sqlite'
    'nspr'
    'dbus-glib'
    'psmisc'
)
makedepends=(
    'gobject-introspection'
    'glib2-devel'
    'meson'
    'ninja'
)
install="${pkgname}.install"
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/${_pkgname}_x64_${pkgver//./_}.deb"
    "pango-${_pangover}.tar.xz::https://github.com/GNOME/pango/archive/refs/tags/${_pangover}.tar.gz"
    "LICENSE"
    "${pkgname}.sh"
)
sha256sums=('ae623c6dc0354ff87afefbb770de5013bfd943051c9a653b93db708253b2f0d3'
            'cd3819c80ab83c8d43ed2e1ba5b2c558a69c3b440fe2ef0056f7407dee941d9a'
            'b4b0db5e577c1b565a7f065ce8f9a4f9622b673fbcffa27ccbaf68f061a67a68'
            'a199da9f4f1579865094a2fbc768631e04fabcf84415882859eeba47ae1708d2')
build() {
    sed -i -e "
        s/@appname@/sangfor/g
        s/@runpath@/${_pkgname}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    cd "${srcdir}/pango-${_pangover}"
    meson setup --prefix=/usr build
    ninja -C build
    DESTDIR="${srcdir}/pango" ninja -C build install
    sed -i -e "
        s/\/usr\/share\/sangfor\/${_pkgname}\/${_pkgname}/${pkgname}/g
        s/Icon=${_pkgname}/Icon=${pkgname}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    chmod 755 "${srcdir}/usr/share/sangfor/${_pkgname}/${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/etc/init/EasyMonitor.conf" -t "${pkgdir}/etc/init"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/EasyMonitor.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    cp -a "${srcdir}/usr/share/sangfor" "${pkgdir}/usr/share"
    cp -a "${srcdir}/pango/usr/lib" "${pkgdir}/usr/share/sangfor/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}