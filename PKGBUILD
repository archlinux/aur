# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=panda-qemu-git
pkgver=r1715.f758bee
pkgrel=1
pkgdesc="An open-source Platform for Architecture-Neutral Dynamic Analysis"
url="https://github.com/moyix/panda"
arch=('x86_64')
license=('GPLv2')

makedepends=('git')
depends=('libdwarf' 'nasm' 'openssl' 'libpcap' 'wget' 'protobuf-c' 'python2-pycparser' 'libelf' 'wireshark-cli' 'distorm')
source=("git+git://github.com/moyix/panda.git#branch=master"
"https://archive.archlinux.org/packages/l/llvm/llvm-3.3-1-x86_64.pkg.tar.xz"{,.sig})
validpgpkeys=('86CFFCA918CF3AF47147588051E8B148A9999C34') # Evangelos Foutras
md5sums=('SKIP'
         '4031a3ad28f9ecdb2d531f8cd5d6685e'
         'SKIP')

pkgver() {
  cd "${srcdir}/panda"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "panda/qemu"

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

  #TODO: get LLVM3.3 in here

  python2 ../scripts/apigen.py
  sh ./pp.sh
  ./configure \
    --python=python2 \
    --target-list=x86_64-softmmu,i386-softmmu,arm-softmmu\
    --prefix="${pkgdir}/opt/${pkgname}" \
    --disable-pie \
    --disable-xen \
    --disable-libiscsi \
    --extra-cflags="-O2 -I/usr/local/include -I/usr/include/libdwarf" \
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
