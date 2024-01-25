# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
_pkgname=EasyConnect
pkgver=7.6.7.3
_electronversion=2
pkgrel=9
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
    'dbus-glib'
    'gtk2'
    'lib32-gtk2'
    'at-spi2-core'
    'gdk-pixbuf2'
    'alsa-lib'
    'nss'
    'sqlite'
    'nspr'
)
makedepends=(
    'gobject-introspection'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/${_pkgname}_x64_${pkgver//./_}.deb"
    "pango-${_pangover}.tar.xz::https://download.gnome.org/sources/pango/${_pangover%.4}/pango-${_pangover}.tar.xz"
    "LICENSE"
    "${pkgname}.sh"
)
sha256sums=('ae623c6dc0354ff87afefbb770de5013bfd943051c9a653b93db708253b2f0d3'
            '1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d'
            'b4b0db5e577c1b565a7f065ce8f9a4f9622b673fbcffa27ccbaf68f061a67a68'
            'a2576d121dc6bf868b351e5c39c8e4f1ee9de154c28dc7d6f7331cbbc0684b5a')
build() {
    sed -e "s|@appname@|sangfor|g" \
        -e "s|@runpath@|${_pkgname}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.gz"
    bsdtar -xf "${srcdir}/pango-${_pangover}.tar.xz"
    cd "${srcdir}/pango-${_pangover}"
    ./configure --prefix=/usr
    make -j4 && make DESTDIR="${srcdir}/pango" install
    sed "s|/usr/share/sangfor/${_pkgname}/${_pkgname}|${pkgname}|g;s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    chmod 755 "${srcdir}/usr/share/sangfor/${_pkgname}/${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/etc/init/EasyMonitor.conf" -t "${pkgdir}/etc/init"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/EasyMonitor.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    cp -r "${srcdir}/usr/share/sangfor" "${pkgdir}/usr/share"
    cp -r "${srcdir}/pango/usr/lib" "${pkgdir}/usr/share/sangfor/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}