# Maintainer: Ainola <opp310@alh.rqh> (ROT13 this.)
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=csound
pkgver=6.05
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
source=("http://downloads.sourceforge.net/project/csound/csound${pkgver:0:1}/Csound${pkgver:0:4}/Csound${pkgver}.tar.gz" 
        "csound.sh")
sha256sums=('0d0ab4c1804265f4947e07c5e41ee72bc1a122b873bd77b9e7179f4c4db43a28'
            '23db5bda78f13d5f16eceea085bba660d7b7012a89518e477d12dfef82dbadeb')

prepare() {
  cd "Csound${pkgver}"

  # install modules to proper paths
  sed -i '/^set.*MODULE_INSTALL_DIR/d' CMakeLists.txt
  sed -i '/execute_process\ (/,+4 d' CMakeLists.txt
  sed -i '/pdname/{n;s/LIBRARY/PD_MODULE/2}' frontends/CMakeLists.txt
}

build() {
  cd "Csound${pkgver}"
  mkdir -p bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DPYTHON_MODULE_INSTALL_DIR=/usr/lib/python2.7/site-packages \
           -DJAVA_MODULE_INSTALL_DIR=/usr/lib/csound/java \
           -DLUA_MODULE_INSTALL_DIR=/usr/lib/lua/5.1 \
           -DPD_MODULE_INSTALL_DIR=/usr/lib/pd/extra
  make
}

package() {
  cd "Csound${pkgver}/bld"
  make DESTDIR="$pkgdir/" install

  # export vars in profile.d
  install -Dm755 "$srcdir/csound.sh" "$pkgdir/etc/profile.d/csound.sh"
}

# vim:set ts=2 sw=2 et:
