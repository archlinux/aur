# Maintainer: ctag <bigbero@gmail.com>

# https://github.com/archlinux/svntogit-community/blob/packages/avr-libc/trunk/PKGBUILD
# https://www.avrfreaks.net/comment/2526416#comment-2526416
# https://github.com/Optiboot/optiboot/pull/297

pkgname=avr-libc-atmega328pb
pkgver=1.5.362
pkgrel=2
epoch=0
_avrlibcver=2.0.0
pkgdesc="The C runtime library for the AVR family of microcontrollers with Atmega328pb support"
arch=('any')
url="http://packs.download.atmel.com"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('avr-libc')
conflicts=('avr-libc')
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("Atmel.ATmega_DFP.${pkgver}.zip::http://packs.download.atmel.com/Atmel.ATmega_DFP.${pkgver}.atpack"
		"io.h.patch"
		https://download.savannah.gnu.org/releases/avr-libc/avr-libc-$_avrlibcver.tar.bz2{,.sig})
noextract=()
md5sums=('31f644ae9287a6ce9abd5e724f3d4661'
         '55c28e5b0f5f55babd1a7a78afb571ab'
         '2360981cd5d94e1d7a70dfc6983bdf15'
         'SKIP')
validpgpkeys=('5E84F980C3CAFD4BB5841070F48CA81B69A85873') # Joerg Wunsch

prepare() {
	cd "${srcdir}/avr-libc-${_avrlibcver}/include/avr"
	patch -i "${srcdir}/io.h.patch"
}

build() {
  cd avr-libc-$_avrlibcver
  ./bootstrap
  ./configure --build=$(./config.guess) --host=avr --prefix=/usr
  make
}

package() {
	install -D "${srcdir}/include/avr/iom328pb.h" -t "${pkgdir}/usr/avr/include/avr/"
	install -D "${srcdir}/gcc/dev/atmega328pb/avr5/crtatmega328pb.o" -t "${pkgdir}/usr/avr/lib/avr5/"
	install -D "${srcdir}/gcc/dev/atmega328pb/avr5/libatmega328pb.a" -t "${pkgdir}/usr/avr/lib/avr5/"

	cd avr-libc-$_avrlibcver
	make DESTDIR="$pkgdir" install

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/avr-libc/LICENSE"
}
