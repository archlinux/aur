# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.10.0
pkgrel=1
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
        "csound.sh")
sha256sums=('a241043521572d00ae3a926611ac52fd6a7e3fe6bafdbe707867aafe32f6d8a3'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

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
