# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=a7800
pkgver=188_03
pkgrel=1
pkgdesc="A7800 is a fork of the MAME Atari 7800 driver, with several enhancements added (ProSystem)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://7800.8bitdev.org/index.php/A7800_Emulator"
license=('custom:MAME License')
depends=(sdl2_ttf qt5-base lua libutf8proc pugixml portmidi portaudio)
makedepends=(nasm python glm libxinerama)
source=("http://7800.8bitdev.org/images/a/aa/${pkgname//a/A}.${pkgver//_/-}.Src.zip"
	"http://7800.8bitdev.org/resources/assets/78008bitdevlogo.png"
	"a7800-starter.sh"
	"a7800.desktop")
sha256sums=('b1d512d4096956e2bc2a645c715dbbda283b76ece23cdd8b607815a1b1b4fbc5'
	    'b89310a46a5305c41f8dfb63e915aaa1e12ea74209cd6fcf7ec3e4753067ff73'
	    '0abdcca941d241158ad009958675f6576518cbf6b85cf9fae3386dc146649d0b'
	    '06b0773ebd2795fb15c9380449f6464c03414f514c6f5e5aeb25835bed000ddb')

_srcdir=${pkgname//a/A}.0${pkgver//_/-}.src

prepare() {
  cd ${_srcdir}
  sed -e 's|\# USE_SYSTEM_LIB|USE_SYSTEM_LIB|g' -i makefile
}

build() {
  cd ${_srcdir}
  make \
    NOWERROR=1 \
    OPTIMIZE=2 \
    TOOLS=1 \
    ARCHOPTS=-flifetime-dse=1
}

package() {
  cd ${_srcdir}
  install -Dm755 ./mame64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 ../a7800-starter.sh "${pkgdir}/usr/bin/${pkgname}-starter.sh"
  install -Dm644 ../a7800.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../78008bitdevlogo.png "${pkgdir}/usr/share/pixmaps//${pkgname}.png"
  msg2 "\e[1;32mYou have to put MAME's a7800* BIOS files to your HOME/.a7800/roms directory \e[0m"
  msg2 "\e[1;32mto use this emulator. This directory is created at first run of a7800. \e[0m"
  msg2 "\e[1;32mTo play games copy .a78 files (which needs headers) to the same directory.\e[0m"
  msg2 "\e[1;32mSee http://7800.8bitdev.org/index.php/A78_Header_Specification about the\e[0m"
  msg2 "\e[1;32mheader specs and how to add them, if neccessary.\e[0m"
}
