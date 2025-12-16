# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter-mint-theme
_pkgname=slick-greeter
pkgver=2.2.5
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
    'mint-themes'
    'pixman'
    'python-gobject'
    'xapp'
    'xorg-server'
)
optdepends=(
    'cinnamon-styles-artwork: enable full artwork theme in Cinnamon'
    'lightdm-settings: allow configuration of slick-greeter'
    'mint-l-theme: enable additional Mint themes'
    'numlockx: enable numerical keypad on supported keyboard'
)
makedepends=(
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
    '693f5e2f09cc2e0835d461deebeefb666e9862e3664f9d71318e58634ce1b9d2'
    '6ce9dda9e5f343e142926e7ed7aa127137214b823362653745cfe1f9d56c4492'
)

build() {
    arch-meson "${_pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --no-rebuild --destdir "$pkgdir"

    # adjust launcher name
    mv "${pkgdir}/usr/share/xgreeters/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/xgreeters/lightdm-slick-greeter.desktop"

    # Install default conf
    install -Dm644 "${srcdir}/${_pkgname}.conf" -t "${pkgdir}/etc/lightdm/"

    # Download latest Bing wallpaper from internet
    # Credits to https://forum.linuxconfig.org/t/how-to-download-bing-wallpaper-with-bash-shell-one-liner/3457
    cd "${srcdir}"
    wget -O slick-greeter.png "http://www.bing.com/$(wget -q -O- https://binged.it/2ZButYc | sed -e 's/<[^>]*>//g' | cut -d / -f2 | cut -d \& -f1)"

    # Installing downloaded Bing wallpaper as slick-greeter wallpaper
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/${_pkgname}/"
}

