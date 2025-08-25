# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: fkxxyz <fkxxyz@163.com>
pkgname=youdao-dict
pkgver=6.0.0
pkgrel=12
pkgdesc="YouDao Dictionary.(Prebuilt version)"
arch=('x86_64')
license=('LicenseRef-custom')
conflicts=("${pkgname}")
url="http://cidian.youdao.com/"
depends=(
	'sqlite'
	'python-dbus'
	'python-lxml'
	#'python-webob'
	'python-opengl'
	'python-gobject'
	'python-xlib'
	'python-requests'
	'gstreamer'
	#'python-pyquery'
	#'python-pyqt5-webkit'
	'gobject-introspection-runtime'
	#'python-cssselect'
	'python-pyxdg'
	#'qt5-webkit'
	'qt5-quickcontrols'
	'qt5-graphicaleffects'
	'tesseract'
	#'tesseract-data-chi_sim'
	#'tesseract-data-eng'
	#'tesseract-data-chi_tra'
	'tesseract-data-osd'
	'wqy-microhei'
	'python-pillow'
	'gst-plugins-base'
	'qt6-declarative'
	'qt6-multimedia'
)
source=(
	"${pkgname}-${pkgver}.deb::http://codown.youdao.com/cidian/linux/${pkgname}_${pkgver}-ubuntu-amd64.deb"
	"License.html::https://c.youdao.com/dict/law/youdaofanyi_pc_service.html"
	"${pkgname}.sh"
)
sha256sums=('e56f248c3caf7d0bff9f4f18780d9b258612b490c1c0f332335b8d15471e0dd2'
            'a373604e2f43ced0f4e37f7adbbb8719f11b2daf49aec96e1f6d9348027e882c'
            '105c5d6e590ff22fea3f3ed299431078c324b91dff71016e1c2815ba3d54d4d4')
prepare() {
	sed -i -e "
		s/@appname@/${pkgname}/g
        s/@runname@/main.py/g
    " "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i '290s/self.setX(x)/self.setX(int(x))/g;291s/self.setY(y)/self.setY(int(y))/g' "${srcdir}/usr/share/${pkgname}/app/plugins/youdao/window.py"
    sed -i '644s/self.move(x, y)/self.move(int(x), int(y))/g' "${srcdir}/usr/share/${pkgname}/dae/window.py"
    sed -i 's/getargspec/getfullargspec/g' "${srcdir}/usr/share/${pkgname}/app/plugins/${pkgname%-dict}/pyquery/pyquery.py"
	sed -i 's/import imp/import importlib/g;/imp.load_source/d' "${srcdir}/usr/share/${pkgname}/dae/plugins.py"
	sed -i -e "
		53i\        spec = importlib.util.spec_from_file_location(plugin_name, os.path.join(path, '__init__.py'))
		53i\        plugin = importlib.util.module_from_spec(spec)
		53i\        spec.loader.exec_module(plugin)
	" "${srcdir}/usr/share/${pkgname}/dae/plugins.py"
    sed -i "s/usr\/share/usr\/lib/g" "${srcdir}/usr/share/dbus-1/services/com.youdao.backend.service"
	sed -i "37s/     print/    print/" "${srcdir}/usr/share/${pkgname}/${pkgname}-backend.py"
}
package(){
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/etc/xdg/autostart/${pkgname}-autostart.desktop" -t "${pkgdir}/etc/xdg/autostart"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/dbus-1/services/com.youdao.backend.service" -t "${pkgdir}/usr/share/dbus-1/services"
	_icon_sizes=(16x16 24x24 48x48 64x64 96x96 scalable)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}".* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	install -Dm644 "${srcdir}/License.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}