# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=('llvm33')
pkgver=3.3
pkgrel=2
arch=('i686' 'x86_64')
url="http://llvm.org/"
pkgdesc="LLVM 3.3 (installed in /opt/llvm33/)"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('libffi' 'python2' 'ocaml' 'python-sphinx')
source=("http://llvm.org/releases/3.3/llvm-3.3.src.tar.gz"{,.sig}
"http://llvm.org/releases/3.3/cfe-3.3.src.tar.gz"{,.sig}
"http://llvm.org/releases/3.3/clang-tools-extra-3.3.src.tar.gz"{,.sig}
clang-max_align_t.patch)
validpgpkeys=('C13549BB82A17681BF7143C2B4468DF4E95C63DC') # Bill Wendling
sha256sums=('68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578'
            'SKIP'
            'b1b55de4ab3a57d3e0331a83e0284610191c77d924e3446498d9113d08dfb996'
            'SKIP'
            '728210c389dd03b8dd4d7a81c41a973c971d52c25b2f9b8996eb701ee8daf998'
            'SKIP'
            '92cd67fa1b86c525fa2079feb5a9da626b75103f6bb3926520a179991ed2664b')

prepare() {
  cd "${srcdir}/cfe-3.3.src"
  cat "${srcdir}/clang-max_align_t.patch" | patch -p2 -F3
  mv "${srcdir}/llvm-3.3.src" "${srcdir}/llvm"
  mv "${srcdir}/cfe-3.3.src" "${srcdir}/llvm/tools/clang"
  mv "${srcdir}/clang-tools-extra-3.3.src" "${srcdir}/llvm/tools/clang/tools/extra"

  cd "$srcdir/llvm"
  ./configure --with-python=/usr/bin/python2 --enable-optimized --disable-assertions --enable-targets=x86 
}

build() {
  cd llvm
  REQUIRES_RTTI=1 make -j $(nproc)
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/llvm/Release" "${pkgdir}/opt/llvm33"
  mv "${srcdir}/llvm/include" "${pkgdir}/opt/llvm33"
}


# vim:set ts=2 sw=2 et:
