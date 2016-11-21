# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=panda-qemu-git
pkgver=r1715.f758bee
pkgrel=2
pkgdesc="An open-source Platform for Architecture-Neutral Dynamic Analysis"
url="https://github.com/moyix/panda"
arch=('x86_64')
license=('GPLv2')

makedepends=('git')
depends=('libdwarf' 'nasm' 'openssl' 'libpcap' 'wget' 'protobuf-c' 'python2-pycparser' 'libelf' 'wireshark-cli' 'distorm' 'llvm33')
source=("git+git://github.com/moyix/panda.git#branch=master")
validpgpkeys=('C13549BB82A17681BF7143C2B4468DF4E95C63DC') # Bill Wendling
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/panda"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/panda/qemu"

  # specify python2 explicitly
  sed -i 's,#!/usr/bin/python,#!/usr/bin/python2,g' $(find "${srcdir}/panda" -name "*.py")
  
  # prog_point.h can not be included inside extern "C"
  sed -i 's,#include "../common/prog_point.h",}\n#include "../common/prog_point.h"\nextern "C" {,g' "${srcdir}/panda/qemu/panda_plugins/bufmon/bufmon.cpp"
  sed -i 's,#include "../common/prog_point.h",}\n#include "../common/prog_point.h"\nextern "C" {,g' "${srcdir}/panda/qemu/panda_plugins/printstack/printstack.cpp"
  
  # asidstory.cpp needs vector and cmath
  sed -i 's,#include <iomanip>,#include <iomanip>\n#include <vector>\n#include <cmath>,g' "${srcdir}/panda/qemu/panda_plugins/asidstory/asidstory.cpp"

  # pri_taint.cpp needs vector
  sed -i 's,#include <algorithm>,#include <algorithm>\n#include <vector>,g' "${srcdir}/panda/qemu/panda_plugins/pri_taint/pri_taint.cpp"
  #include <string.h>

  # fix some perl syntax
  sed -i 's,\$column =~ s\/\^\\@strong{(\.\*)}\$\/\$1\/;,$column =~ s/^\\@strong\\{(.*)}$/$1/;,g' "${srcdir}/panda/qemu/scripts/texi2pod.pl"

  python2 ../scripts/apigen.py
  sh ./pp.sh
  ./configure \
    --enable-llvm \
    --with-llvm="/opt/llvm33" \
    --python=python2 \
    --target-list=x86_64-softmmu,i386-softmmu,arm-softmmu \
    --prefix="${pkgdir}/opt/${pkgname}" \
    --disable-pie \
    --disable-xen \
    --disable-libiscsi \
    --extra-cflags="-O2 -I${srcdir}/usr/include -I/usr/local/include -I/usr/include/libdwarf" \
    --extra-cxxflags="-O2" \
    --extra-ldflags="-L/usr/local/lib -L/usr/local/lib64 -lprotobuf-c -lprotobuf -lpthread"
}

build() {
  cd "panda/qemu"
  
  make -j ${PANDA_NPROC:-$(nproc)}
}

package() {
  cd panda/qemu
  make install

  install -m644 -D "${srcdir}/panda/qemu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -D "${srcdir}/panda/qemu/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
