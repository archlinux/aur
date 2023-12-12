# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: fkxxyz <fkxxyz@163.com>
pkgname=youdao-dict
pkgver=6.0.0
pkgrel=6
pkgdesc="YouDao Dictionary"
arch=('x86_64')
license=('GPL3')
conflicts=("${pkgname}")
url="http://cidian.youdao.com/"
depends=(
	'sqlite'
	'python-lxml'
	'python-webob'
	'python-opengl'
	'python-gobject'
	'hicolor-icon-theme'
	'python-xlib'
	'python-pillow'
    'python>=3'
	'python-requests'
	'gstreamer'
	'python-pyquery'
	'python-pyqt5-webkit'
	'gobject-introspection-runtime'
	'python-cssselect'
	'gstreamer0.10'
	'python-pyxdg'
	'qt5-webkit'
	'qt5-quickcontrols'
	'qt5-graphicaleffects'
)
source=(
	"${pkgname}-${pkgver}.deb::http://codown.youdao.com/cidian/linux/${pkgname}_${pkgver}-ubuntu-amd64.deb"
	"${pkgname}.sh"
)
sha256sums=('e56f248c3caf7d0bff9f4f18780d9b258612b490c1c0f332335b8d15471e0dd2'
            '58d0c47ec3f5262e1a9d88478e90a66c10d573f6296ba9f179fc45e77df67f25')
build() {
	sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@runappname@|main.py|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -i '290s|self.setX(x)|self.setX(int(x))|g;291s|self.setY(y)|self.setY(int(y))|g' "${srcdir}/usr/share/${pkgname}/app/plugins/youdao/window.py"
    sed -i '644s|self.move(x, y)|self.move(int(x), int(y))|g' "${srcdir}/usr/share/${pkgname}/dae/window.py"
    sed 's|getargspec|getfullargspec|g' -i "${srcdir}/usr/share/${pkgname}/app/plugins/${pkgname%-dict}/pyquery/pyquery.py"
    sed 's|usr/share|opt|g' -i "${srcdir}/usr/share/dbus-1/services/com.youdao.backend.service"
	sed "s|%f||g" -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
}
package(){
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/etc/xdg/autostart/${pkgname}-autostart.desktop" -t "${pkgdir}/etc/xdg/autostart"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/dbus-1/services/com.youdao.backend.service" -t "${pkgdir}/usr/share/dbus-1/services"
    for _icons in 16x16 24x24 48x48 64x64 96x96 scalable;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}".* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}