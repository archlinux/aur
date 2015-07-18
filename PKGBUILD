# Maintainer: Ainola
# Contributor: speps
# Contributor: Bernardo Barros

pkgname=csound
pkgver=6.05.0
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
source=("https://github.com/csound/csound/archive/${pkgver}.tar.gz"
        "csound.sh")
sha256sums=('2384cbc82fe37b70192c87977b52c55b336731ecbfd3be1d8d30c7223815d7b9'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  cd "csound-${pkgver}"

  # install modules to proper paths
  sed -i '/^set.*MODULE_INSTALL_DIR/d' CMakeLists.txt
  sed -i '/execute_process\ (/,+4 d' CMakeLists.txt
  sed -i '/pdname/{n;s/LIBRARY/PD_MODULE/2}' frontends/CMakeLists.txt
}

build() {
  cd "csound-${pkgver}"
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DPYTHON_MODULE_INSTALL_DIR=/usr/lib/python2.7/site-packages \
           -DJAVA_MODULE_INSTALL_DIR=/usr/lib/csound/java \
           -DLUA_MODULE_INSTALL_DIR=/usr/lib/lua/5.1 \
           -DPD_MODULE_INSTALL_DIR=/usr/lib/pd/extra
  make
}

package() {
  cd "csound-${pkgver}/bld"
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
