# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-slick-greeter-mint-theme
_pkgname=slick-greeter
pkgver=2.0.1
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
    'mint-l-theme: enable additional Mint themes'
    'numlockx: enable numerical keypad on supported keyboard'
)
makedepends=(
    'gnome-common'
    'intltool'
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
    '24ddfb1a01e3f49ad96618b946d15cc7ab7629f6238a93c9e8d4a1b362be2882'
    'f1a4ea92f61d90ba2d8915da582891e09baca42cf623863bfef26022544c34df'
)

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

