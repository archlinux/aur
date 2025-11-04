# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=input-remapper-bin
pkgver=2.2.0
pkgrel=2
_pythonver=3.13
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
)
optdepends=(
    'xorg-xmodmap: symbol names matching the keyboard layout'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.deb")
sha256sums=('f880fe7d3593f53e6433fef39a5b36e9aca17d9efee1ba6f9ff28b27cba50df2')
prepare() {
    if [ -d "${srcdir}/usr" ];then
        rm -rf "${srcdir}/"{etc,usr}
    fi
	bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}.svg/${pkgname%-bin}/g" \
        {"${srcdir}/etc/xdg/autostart/${pkgname%-bin}-autoload.desktop","${srcdir}/usr/share/applications/${pkgname%-bin}-gtk.desktop"}
    rm -rf "${srcdir}/usr/local"
    install -Dm755 -d "${srcdir}/usr/lib/python${_pythonver}"
    mv "${srcdir}/usr/lib/python3/dist-packages" "${srcdir}/usr/lib/python${_pythonver}/site-packages"
    rm -rf "${srcdir}/usr/lib/python3"
}
package() {
    # Delete old files
    if [ -d "${pkgdir}/usr/lib/python3/dist-packages/inputremapper" -a -d "${pkgdir}/usr/lib/python3/dist-packages/input_remapper-2.2.0.egg-info" ]; then
        rm -rf \
            "${pkgdir}/usr/lib/python3/dist-packages/inputremapper" \
            "${pkgdir}/usr/lib/python3/dist-packages/input_remapper-${pkgver}.egg-info"
    fi
	cp -Pr --no-preserve=ownership "${srcdir}/"{etc,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
