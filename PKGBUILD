# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter-mint-theme
_pkgname=slick-greeter
pkgver=1.6.0
pkgrel=1
pkgdesc='A slick-looking LightDM greeter. With additional options enabled'
arch=('x86_64')
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
depends=('cairo'
    'freetype2'
    'gtk3'
    'libcanberra'
    'libxext'
    'lightdm-guest'
    'lightdm-settings'
    'mint-themes'
    'pixman'
    'python'
    'xorg-server')
optdepends=('numlockx: enable numerical keypad on supported keyboard'
'mint-themes-legacy: enable additional Mint themes')
makedepends=('gnome-common'
    'intltool'
    'vala')
provides=(lightdm-slick-greeter)
conflicts=(lightdm-slick-greeter)
backup=("etc/lightdm/${_pkgname}.conf")
install="${_pkgname}.install"
source=("${_pkgname}-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${_pkgname}.conf")
#        "${_pkgname}.jpg")
sha256sums=('48375ee4a3d7625f4caa9708448c97efe818f1b074764951281992eccaee4b3b'
            'd959d47f2db4630d420622958e16d3c1d79d979b76ecfdb2b5bd3f045b8a5a41')
#            '6f1c0e3a7f32aa7c20ff734fbe0376d94348b38d1200b56846cb0a146fd86def')

prepare() {
    cd "${_pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/lightdm
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

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

