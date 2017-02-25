# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.08.0
pkgrel=4
pkgdesc="A programming language for sound rendering and signal processing."
arch=('i686' 'x86_64')
url="http://csound.github.io"
license=('LGPL')
depends=('fltk' 'fluidsynth' 'liblo' 'portaudio' 'portmidi' 'tk' 'curl' 'stk' 'luajit' 'python2' 'hdf5')
makedepends=('pd' 'cmake' 'gmm' 'swig' 'java-environment' 'dssi' 'boost' 'luajit' 'eigen')
optdepends=('csound-doc: The Canonical Csound Reference Manual'
            'csoundqt: Qt frontend'
            'java-environment: Java Wrapper'
            'vim-csound: Syntax Highlighting and Bindings for Vim')
source=("https://github.com/csound/csound/archive/${pkgver}.tar.gz"
        "Custom.cmake"
        "csound.sh")
sha256sums=('480bde5c07ac7fb8303b4c84c01710999815c2334501d007170adc9cdbf826a1'
            '81c9473ad3142c658afe2e509f3ae597b5349bba07f95d4ba03f420188786e57'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  cp "$srcdir"/Custom.cmake "csound-${pkgver}"
}

build() {
  cd "csound-${pkgver}"
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
           -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so
  make
}

package() {
  cd "csound-${pkgver}/bld"
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
