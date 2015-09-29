# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.05.0
pkgrel=3
pkgdesc="A programming language for sound rendering and signal processing."
arch=('i686' 'x86_64')
url="http://csound.github.io"
license=('LGPL')
depends=('fltk' 'fluidsynth' 'liblo' 'portaudio' 'portmidi' 'tk' 'curl' 'stk' 'luajit' 'python2')
makedepends=('pd' 'cmake' 'gmm' 'swig' 'java-environment' 'dssi' 'boost' 'luajit' 'eigen')
optdepends=('csoundqt: Qt frontend'
            'vim-csound: Syntax Highlighting and Bindings for Vim'
            'java-environment: Java Wrapper'
            'csound-doc: The Canonical Csound Reference Manual')
source=("https://github.com/csound/csound/archive/${pkgver}.tar.gz"
        "Custom.cmake"
        "libm.patch"
        "csound.sh")
sha256sums=('2384cbc82fe37b70192c87977b52c55b336731ecbfd3be1d8d30c7223815d7b9'
            '81c9473ad3142c658afe2e509f3ae597b5349bba07f95d4ba03f420188786e57'
            'e5f4ac9885225013b6e1f08b85205cb5b32ced518be39004f398be8c9fe69ab9'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  cp "$srcdir"/Custom.cmake "csound-${pkgver}"
  patch -p0 < libm.patch
  cd "csound-${pkgver}"
}

build() {
  cd "csound-${pkgver}"
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "csound-${pkgver}/bld"
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
