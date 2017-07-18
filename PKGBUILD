# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.09.1
pkgrel=2
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
# Both Libextractor and Csound install /usr/bin/extractor
conflicts=('libextractor')
source=("https://github.com/csound/csound/archive/${pkgver}.tar.gz"
        "python_install_dir.patch"
        "csound.sh")
sha256sums=('d49735b4ed50f2818b577abcface45fe7f9b7fb49ccd898db030893cbcdfc738'
            '9c13a6d416294f073e481db934c6a816170af012d3b5b8707d8699deb29bee89'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  # 6.09.1 tries to install python modules in the home dir.
  # https://github.com/csound/csound/issues/828#issuecomment-315856126
  patch -d "csound-$pkgver" -p1 < python_install_dir.patch
}

build() {
  cd "csound-${pkgver}"
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
           -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
           -DJAVA_MODULE_INSTALL_DIR=/usr/lib/csound/java \
           -DPYTHON_MODULE_INSTALL_DIR=/usr/lib/python2.7/site-packages \
           -DLUA_MODULE_INSTALL_DIR=/usr/lib/lua/5.1 \
           -DDPD_MODULE_INSTALL_DIR=/usr/lib/pd/extra
  make
}

package() {
  cd "csound-${pkgver}/bld"
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
