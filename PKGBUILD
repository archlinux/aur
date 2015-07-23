# Maintainer: julienCXX <archlinux@chmodplusx.eu>

# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=mingw-w64-ccnet
pkgver=4.2.3
pkgrel=4
pkgdesc="A framework for writing networked applications in C (mingw-w64)."
arch=('any')
url="https://github.com/haiwen/ccnet/"
license=('custom')
makedepends=('mingw-w64-configure' 'vala>=0.8' 'python2>=2.6')
depends=('mingw-w64-crt' 'mingw-w64-libevent>=2.0' 'mingw-w64-glib2>=2.26.0'
'mingw-w64-libsearpc' 'mingw-w64-winpthreads' 'mingw-w64-jansson>=2.2.1'
'mingw-w64-sqlite' 'mingw-w64-openssl')
options=('!strip' '!buildflags' 'staticlibs')
source=("ccnet-${pkgver}.tar.gz::https://github.com/haiwen/ccnet/archive/v${pkgver}.tar.gz"
	"libccnet.pc.patch"
	"0001-Add-autoconfiguration-for-libjansson.patch"
	"ccnet-pull-86.patch::https://patch-diff.githubusercontent.com/raw/haiwen/ccnet/pull/86.patch"
	"ccnet-pull-87.patch::https://patch-diff.githubusercontent.com/raw/haiwen/ccnet/pull/87.patch")
sha256sums=('7da578ed4b04b99673c711cf22a9dc535e31c6f323e5701348211129be48c92d'
            '66c3b02c3981db6a80819e0ae103bedadf8dfdf81405a7f75a9cba714acf973f'
            '382b1da33e2b6c0ebab8d3921d92b7417fa11d969ad822cd43aee499fd7b3d94'
            'b5c4cea9c718cf0e2e32572068ec9da4dc26cac7cfc1597eceff4aa53a4d0156'
            '1ea5f5555c6472afcbf6ad58b0ebdd86e5b58db0a848576f8b74c100083a8b7d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/ccnet-$pkgver"
  patch -p1 -i "$srcdir"/libccnet.pc.patch
  patch -p1 -i "$srcdir"/0001-Add-autoconfiguration-for-libjansson.patch
  # Fix for 64-bit compilation
  patch -p1 -i "$srcdir"/ccnet-pull-86.patch
  patch -p1 -i "$srcdir"/ccnet-pull-87.patch
  # Case fix on includes
  sed -i 's/<Rpc.h>/<rpc.h>/g' lib/libccnet_utils.c
  sed -i 's/<Rpc.h>/<rpc.h>/g' lib/utils.c
}

build() {
  cd "$srcdir/ccnet-$pkgver"

  # Required for the build process to find searpc-codegen.py
  export PATH=/usr/i686-w64-mingw32/bin/:"$PATH"

  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    cp -r ../lib/ lib
    ${_arch}-configure --enable-compile-demo=no PYTHON=python2
    make
    popd 
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ccnet-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir"/usr/"$_arch"/lib/python2.7/site-packages/
    mv "$pkgdir"/Lib/site-packages/* "$pkgdir"/usr/"$_arch"/lib/python2.7/site-packages/
    rm -rf "$pkgdir"/Lib
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.{dll,exe}
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

