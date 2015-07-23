# Maintainer: julienCXX <archlinux@chmodplusx.eu>

# Contributor: Moritz Maxeiner <moritz@ucworks.org>

pkgname=mingw-w64-seafile-shared
pkgver=4.2.3
pkgrel=2
pkgdesc="Shared components of seafile: seafile-daemon, libseafile, libseafile python bindings (mingw-w64)."
arch=(any)
url="https://github.com/haiwen/seafile/"
license=('GPL')
makedepends=('mingw-w64-configure' 'vala' 'intltool' 'python2>=2.6')
depends=('mingw-w64-crt' 'mingw-w64-ccnet>=3.0' 'mingw-w64-curl')
options=('!strip' '!buildflags' 'staticlibs')
source=("seafile-${pkgver}.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}.tar.gz"
	"seafile-pull-1265.patch::https://patch-diff.githubusercontent.com/raw/haiwen/seafile/pull/1265.patch")
sha256sums=('9f4ffd912312e7154cecb8451612674e32400b345bb50345cb257c3da8218f44'
            '50ef89aa3d4382af7ba45c9c95530ce8b3a9c355dd1c425c35a26651c62692bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/seafile-${pkgver}"
  # Fix for 64-bit compilation
  patch -p1 -i "$srcdir"/seafile-pull-1265.patch
  # Case fixes on includes
  sed -i 's/<Rpc.h>/<rpc.h>/g' lib/utils.c
  sed -i 's/-lRpcrt4/-lrpcrt4/g' configure.ac
}

build()
{
  cd "$srcdir/seafile-${pkgver}"

  # Required for the build process to find searpc-codegen.py
  export PATH=/usr/i686-w64-mingw32/bin/:"$PATH"

  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    cp -r ../lib lib
    ${_arch}-configure PYTHON=python2
    make
    popd 
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "${srcdir}/seafile-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir"/usr/"$_arch"/lib/python2.7/site-packages/
    mv "$pkgdir"/Lib/site-packages/* "$pkgdir"/usr/"$_arch"/lib/python2.7/site-packages/
    rm -rf "$pkgdir"/Lib
    rm -rf "$pkgdir"/usr/"$_arch"/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.{dll,exe}
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
