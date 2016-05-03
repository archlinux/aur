#Contributor <Themaister> <maister@archlinux.us>
#Contributor <lifning> <definelightning@gmail.com>

pkgname=retroarch
_pkgname=RetroArch
pkgver=1.3.4
pkgrel=1
pkgdesc="Simple frontend for the Libretro API. Stable version."

url="http://www.libretro.com/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')

license=('GPL')
depends=('ffmpeg' 'libgl' 'libusb' 'libxinerama' 'libxkbcommon' 'libxv' 'mesa'
         'openal' 'python' 'sdl2' 'perl-net-dbus' 'perl-x11-protocol')
depends_i686=('nvidia-cg-toolkit')
depends_x86_64=('nvidia-cg-toolkit')
optdepends=('jack2')
install=retroarch.install

conflicts=('retroarch-git')
provides=('retroarch-git')

source=("https://github.com/libretro/${_pkgname}/archive/v${pkgver}.tar.gz"
        "retroarch.desktop"
        "retroarch-32x32.png"
        "retroarch-64x64.png")
md5sums=('f892231e1b4d5724749ce7435b589cb8'
         '8da1d1725bcc4dce7c778c2c37f14996'
         '356fe1a16aff78d62325e319ca95b8e9'
         'e38c12b3c1c2acd08fe5ea7483f62572')

backup=('etc/retroarch.cfg')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr && make || return 1
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install DESTDIR=${pkgdir} || return 1

    mkdir -p "${pkgdir}/usr/share/applications"
    install -m 644 ../../retroarch.desktop "${pkgdir}/usr/share/applications/"

    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,scalable}/apps
    mv "${pkgdir}/usr/share/pixmaps/retroarch.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    rmdir "${pkgdir}/usr/share/pixmaps"
    install -m 644 ../../retroarch-32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/retroarch.png"
    install -m 644 ../../retroarch-64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/retroarch.png"
}
