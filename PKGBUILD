# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=lmms-beta
_basever=1.2.0
_rc=rc7
pkgver=${_basever}_${_rc}
pkgrel=1
pkgdesc='Beta version of the Linux MultiMedia Studio.'
arch=('x86_64')
url='https://lmms.io/'
license=('GPL')
depends=('sdl' 'glib2' 'fluidsynth' 'libpng' 'libvorbis' 'libxft' 'libxinerama' 'qt5-base' 'qt5-x11extras' 'sdl_sound'
         'libsamplerate' 'shared-mime-info' 'fltk')
optdepends=('wine: VST support (experimental)'
            'fftw: SpectrumAnalyzer plugin'
            'stk: STK instruments plugins'
            'pulseaudio: PulseAudio output'
            'libgig: needed for decoding .gig files')
makedepends=('git' 'cmake' 'ladspa' 'libxft' 'freetype2' 'fftw' 'stk' 'wine')
makedepends_x86_64=('gcc-multilib')
provides=('lmms' 'lmms-extras')
conflicts=('lmms' 'lmms-extras')
options=('!makeflags')
source=()

prepare() {
  git clone --recurse-submodules -b v${_basever}-${_rc} https://github.com/lmms/lmms
  
  cd "${srcdir}/lmms"
  
  sed -i 's|lib64|lib|g' cmake/modules/DetectMachine.cmake
}

build() {
  cd "${srcdir}/lmms"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWANT_QT5=ON -DWANT_VST=ON -USE=vst
  make -j4
}

package() {
  cd "$srcdir/lmms"
  make DESTDIR="${pkgdir}" install
  
  # Move lib64 files to lib
  cd "${pkgdir}/usr"
  mv lib64/* lib/
  rm -r lib64/
}
