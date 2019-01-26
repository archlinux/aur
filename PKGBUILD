# Maintainer: Aaron Paden
# Contributor: Franco Tortoriello
pkgname=lib32-munt-git
_pkgname=munt
pkgdesc="Software synthesiser emulating pre-GM MIDI devices, such as the Roland MT-32"
pkgver=1979.9bb289a
pkgrel=1
arch=(x86_64)
url="http://munt.sourceforge.net"
license=(LGPL2.1)
depends=('lib32-portaudio' 'lib32-libpulse' 'lib32-alsa-lib')
makedepends=('git' 'cmake')
options=(staticlibs)
provides=('lib32-munt')
source=(git://github.com/munt/munt.git)
md5sums=(SKIP)
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${_pkgname}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  cmake . -DCMAKE_INSTALL_PREFIX='/usr'\
	-Dmunt_WITH_MT32EMU_QT='FALSE'\
	-Dmunt_WITH_MT32EMU_SMF2WAV='FALSE'
  make
}
package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 mt32emu/libmt32emu.so.2.3.0 "$pkgdir"/usr/lib32/libmt32emu.so.2.3.0
  ln -s /usr/lib32/libmt32emu.so.2.3.0 "$pkgdir"/usr/lib32/libmt32emu.so.2
  ln -s /usr/lib32/libmt32emu.so.2 "$pkgdir"/usr/lib32/libmt32emu.so
}
