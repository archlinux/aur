pkgname=mingw-w64-libxml2
pkgver=2.15.1
pkgrel=1
arch=('any')
pkgdesc='XML C parser and toolkit (mingw-w64)'
url='https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home'
depends=('mingw-w64-crt' 'mingw-w64-libiconv' 'mingw-w64-zlib' 'mingw-w64-xz')
makedepends=('git' 'mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
license=(MIT)
source=("https://download.gnome.org/sources/libxml2/${pkgver::4}/libxml2-${pkgver}.tar.xz")
sha256sums=('c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd libxml2-${pkgver}

  # avoid `ld.lld: error: unknown argument '--enable-auto-image-base'` when using LLVM-based toolchain
  [[ $pkgname =~ .*-clang-.* ]] && \
    find . -name 'libtool.m4' -exec sed -i -e 's|$wl--enable-auto-image-base||g' {} \+

  # disable doc & examples
  sed -i "s| doc example | |g" Makefile.am
  autoreconf -vfi
}

build() {
  cd libxml2-${pkgver}

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --without-python
    make
    popd
  done
}

package() {
  cd libxml2-${pkgver}
  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"

  for _arch in ${_architectures}; do
    cd "${srcdir}/libxml2-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

