# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=input-remapper-bin
pkgver=2.2.1
pkgrel=2
_pythonver=3.14
pkgdesc="A tool to change and program the mapping of your input device buttons.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/sezanzeb/input-remapper/"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    'key-mapper'
)
depends=(
    'python-gobject'
    'python-pydbus'
    'python-evdev'
    'gtk3'
    'python-setuptools'
    'gtksourceview4'
    'python-pydantic'
    'python-cairo'
    'python-packaging'
    'python-psutil'
    'python-dbus'
)
optdepends=(
    'xorg-xmodmap: symbol names matching the keyboard layout'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('6ad397c517a05cc001d45f821122d18506fe3f4d7bf1cb966b012cac54a949d2')
prepare() {
    if [ -d "${srcdir}/usr" ];then
        rm -rf "${srcdir}/"{etc,usr}
    fi
	bsdtar -xf "${srcdir}/data."*
    find "${srcdir}" -type f -name "*.pyc" -exec rm -rf {} +
    sed -i "s/\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}.svg/${pkgname%-bin}/g" \
        {"${srcdir}/etc/xdg/autostart/${pkgname%-bin}-autoload.desktop","${srcdir}/usr/share/applications/${pkgname%-bin}-gtk.desktop"}
    rm -rf "${srcdir}/usr/local"
    install -Dm755 -d "${srcdir}/usr/lib/python${_pythonver}"
    mv "${srcdir}/usr/lib/python3/dist-packages" "${srcdir}/usr/lib/python${_pythonver}/site-packages"
    rm -rf "${srcdir}/usr/lib/python3"
}
package() {
	cp -Prf --no-preserve=ownership "${srcdir}/"{etc,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
