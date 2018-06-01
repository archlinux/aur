# Contributor: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic
# Contributor: Difarem

# This tries to follow the official LMMS PKGBUILD.

_pkgname=lmms
pkgname=lmms-git
pkgver=1.2.0.rc6.r0.g1349d45d7
pkgrel=1
pkgdesc='The Linux MultiMedia Studio.'
arch=('i686' 'x86_64')
url='http://lmms.sourceforge.net/'
license=('GPL')
depends=('sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt4' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output')
makedepends=('git' 'cmake' 'ladspa' 'libxft' 'freetype2' 'fftw' 'stk' 'wine')
makedepends_x86_64=('gcc-multilib')
provides=('lmms' 'lmms-extras')
conflicts=('lmms' 'lmms-extras')
options=('!makeflags')
source=('git://github.com/LMMS/lmms.git')
sha512sums=('SKIP')

install="$pkgname".install

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd -- "$srcdir/$_pkgname"
  sed -i 's|lib64|lib|g' cmake/modules/DetectMachine.cmake
  git submodule init
  git submodule update
}

build() {
  cd -- "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -USE=vst
  make #-j1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
