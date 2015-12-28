# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.06.0
pkgrel=1
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
source=("http://sourceforge.net/projects/csound/files/csound6/Csound6.06/Csound6.06.tar.gz/download"
        "Custom.cmake"
        "boost-1.60-name-clash.patch"
        "csound.sh")
sha256sums=('03e6542d60eaffc9b4c5e81f36243e8872dedbe94c036adaa8e07c27938feb11'
            '81c9473ad3142c658afe2e509f3ae597b5349bba07f95d4ba03f420188786e57'
            '65a205a8d617b6243a892cea9d2c6ed8ab0ace42a9992615c6274d0adb9187bd'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  # Temporarily using SourceForge's copy until Github's version is released.
  #   Moving the folder is easier than editing the PKGBUILD back and forth to rename.
  mv Csound6.06 "csound-$pkgver"

  cp "$srcdir"/Custom.cmake "csound-${pkgver}"

  # Fixes https://github.com/csound/csound/issues/570 until they release officially.
  patch -d "$srcdir/csound-$pkgver" -p1 < boost-1.60-name-clash.patch
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
