# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Philip A Reimer <antreimer@gmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

pkgname=mingw-w64-xz
pkgver=5.2.1
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (mingw-w64)"
arch=('any')
url="http://tukaani.org/xz"
license=("custom" "GPL" "LGPL")
makedepends=("mingw-w64-configure")
depends=("mingw-w64-crt")
options=(staticlibs !strip !buildflags)
source=("$url/xz-${pkgver}.tar.gz")
md5sums=('3e44c766c3fb4f19e348e646fcd5778a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/xz-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/xz-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/bin/"{lz{cmp,diff,egrep,fgrep,grep,less,more},xz{cmp,diff,egrep,fgrep,grep,less,more}}
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

