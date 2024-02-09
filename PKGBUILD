# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xorg-util-macros
pkgver=1.20.0
pkgrel=2
pkgdesc="X.Org Autotools macros (mingw-w64)"
arch=(any)
license=('MIT')
url="http://xorg.freedesktop.org/"
makedepends=('mingw-w64-configure')
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.gz{,.sig})
sha512sums=('0724cf57cbf00fe115596457bf2031cdad5845bebdcc1ee4ff90b4f77b4ebc862b0f7d250272ef58c2929aedead3d18d11f23f067e50fcac22863a1fcd4f3d66'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A'
              '4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd util-macros-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
  
}

package() {
 for _arch in ${_architectures}; do
    cd "${srcdir}/util-macros-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m755 -d "${pkgdir}/usr/${_arch}/lib"
    mv "${pkgdir}/usr/${_arch}/share/pkgconfig" "${pkgdir}/usr/${_arch}/lib/"
  done
  install -D -m644 "$srcdir/util-macros-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
} 
