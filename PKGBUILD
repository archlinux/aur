# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter-mint-theme
_pkgname=slick-greeter
pkgver=2.2.0
pkgrel=1
pkgdesc="A slick-looking LightDM greeter. With additional options enabled"
arch=('x86_64')
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
depends=(
    'cairo'
    'freetype2'
    'gtk3'
    'libcanberra'
    'libxext'
    'lightdm-guest'
    'lightdm-settings'
    'mint-themes'
    'pixman'
    'python'
    'xorg-server'
)
optdepends=(
    'cinnamon-styles-artwork: enable full artwork theme in Cinnamon'
    'mint-l-theme: enable additional Mint themes'
    'numlockx: enable numerical keypad on supported keyboard'
)
makedepends=(
    'gnome-common'
    'meson'
    'vala'
)
provides=(
    'lightdm-slick-greeter'
)
conflicts=(
    'lightdm-slick-greeter'
)
backup=("etc/lightdm/${_pkgname}.conf")
install="${_pkgname}.install"
source=(
    "${_pkgname}-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz"
    "${_pkgname}.conf"
)
sha256sums=(
    'ad39c23ef07f37215ed8fb775472b5a1abadf810967ea62751ebf73b72544e84'
    '6284948fbd3e64d0a2dd7f8bb08c980c9a5944fa8a63fabb0aee4a64728324c7'
)

build() {
    cd "${_pkgname}-${pkgver}"
    arch-meson build
}

package() {
    cd "${_pkgname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"

    # Download latest Bing wallpaper from internet
    # Credits to https://forum.linuxconfig.org/t/how-to-download-bing-wallpaper-with-bash-shell-one-liner/3457
    cd "${srcdir}"
    wget -O slick-greeter.jpg "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"

    # adjust launcher name
    mv "${pkgdir}/usr/share/xgreeters/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/xgreeters/lightdm-slick-greeter.desktop"

    # Install default conf
    install -Dm644 "${srcdir}/${_pkgname}.conf" -t "${pkgdir}/etc/lightdm/"

    # Installing downloaded Bing wallpaper as slick-greeter wallpaper
    install -Dm644 "${srcdir}/${_pkgname}.jpg" -t "${pkgdir}/usr/share/${_pkgname}/"
}

