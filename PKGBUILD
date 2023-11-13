# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
_pkgname=EasyConnect
pkgver=7.6.7.3
pkgrel=6
_pangover=1.42.4
pkgdesc="Support access to ssl vpn. With easyconect,you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('custom')
conflicts=(
    "${pkgname}"
    "${pkgname}-rpc"
    "${pkgname}-zjjy"
    "${pkgname}-sdu"
    "${pkgname}-cas"
)
depends=(
    'dbus'
    'dbus-glib'
    'libxrender'
    'nss'
    'libxext'
    'libxcursor'
    'expat'
    'sqlite'
    'gtk2'
    'harfbuzz'
    'libxi'
    'libcups'
    'libx11'
    'cairo'
    'at-spi2-core'
    'libxcomposite'
    'fontconfig'
    'pango'
    'fribidi'
    'libxtst'
    'libxrandr'
    'libxdamage'
    'gdk-pixbuf2'
    'libxft'
    'libxcb'
    'libxfixes'
    'nspr'
    'alsa-lib'
    'libthai'
    'freetype2'
)
makedepends=(
    'gobject-introspection'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/${_pkgname}_x64_${pkgver//./_}.deb"
    "pango-${_pangover}.tar.xz::https://download.gnome.org/sources/pango/${_pangover%.4}/pango-${_pangover}.tar.xz"
    "LICENSE"
)
sha256sums=('ae623c6dc0354ff87afefbb770de5013bfd943051c9a653b93db708253b2f0d3'
            '1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d'
            'b4b0db5e577c1b565a7f065ce8f9a4f9622b673fbcffa27ccbaf68f061a67a68')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    bsdtar -xf "${srcdir}/pango-${_pangover}.tar.xz"
    sed "s|Exec=|Exec=env LD_LIBRARY_PATH=/usr/share/sangfor/${_pkgname}/oldlib/pango/usr/lib |g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
build() {
    cd "${srcdir}/pango-${_pangover}"
    ./configure --prefix=/usr
    make -j4 && make DESTDIR="${srcdir}/oldlib/pango" install
}
package() {
    install -Dm644 "${srcdir}/etc/init/EasyMonitor.conf" -t "${pkgdir}/etc/init"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/EasyMonitor.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    cp -r "${srcdir}/usr/share/sangfor" "${pkgdir}/usr/share"
    cp -r "${srcdir}/oldlib" "${pkgdir}/usr/share/sangfor/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}