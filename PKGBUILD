# Maintainer: Zoë Sparks <zoe@milky.flowers>

# This package is closely based on the community/csound package
# by David Runge <dave@sleepmap.de> and contributors Ainola,
# speps, and Bernardo Barros.

pkgname=csound-git
pkgver=6.12.2.r81.g4b83486dd
pkgrel=1
pkgdesc="A programming language for sound rendering and signal processing."
arch=('x86_64')
url="http://csound.com"
license=('LGPL')
makedepends=('boost' 'cmake' 'dssi' 'eigen' 'faust' 'fltk' 'fluidsynth' 'git'
'hdf5' 'java-environment' 'ladspa' 'libwebsockets' 'llvm' 'luajit' 'pd'
'portmidi' 'portsmf' 'stk' 'swig')
conflicts=('csound')
provides=('csound')
source=("${pkgname}::git+https://github.com/csound/csound"
        "csound.sh")
md5sums=('SKIP'
         '5eca376940bfebc21095b51c1e0911ca')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  # requires out-of-tree build
  mkdir bld
}

build() {
  cd "${pkgname}/bld"
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_CXX_FLAGS="-Wno-error -Wno-missing-field-initializers" \
           -DCMAKE_C_FLAGS="-Wno-error -Wno-missing-field-initializers" \
           -DJAVA_AWT_LIBRARY=/usr/lib/jvm/java-8-openjdk/jre/lib/amd64/libawt.so \
           -DJAVA_JVM_LIBRARY=/usr/lib/jvm/java-8-openjdk/jre/lib/amd64 \
           -DBUILD_FAUST_OPCODES=1 \
           -DFAUST_LIBRARY=/usr/lib/libfaust.a \
           -DLUAJIT_LIBRARY=/usr/lib/libluajit-5.1.so \
           -DLUA_H_PATH=/usr/include/luajit-2.0/ \
           -DLUA_MODULE_INSTALL_DIR=/usr/lib/lua/5.1/ \
           -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
           -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
           -DPYTHON_MODULE_INSTALL_DIR=/usr/lib/python2.7/site-packages
  make
}

package() {
  depends=('fltk' 'fluidsynth' 'git' 'hdf5' 'liblo' 'libwebsockets' 'luajit'
  'portmidi' 'portsmf' 'stk' 'tk')
  optdepends=('csound-doc: The canonical Csound Reference Manual'
              'csoundqt: Qt frontend'
              'faust: Embed faust'
              'java-environment: Use csound with Java'
              'vim-csound: Use csound with vim')
  cd "${pkgname}/bld"
  make DESTDIR="${pkgdir}/" install

  # export vars in profile.d
  install -vDm 755 "${srcdir}/csound.sh" -t "${pkgdir}/etc/profile.d/"
}

# vim:set ts=2 sw=2 et:
