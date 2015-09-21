# Maintainer: Marty Plummer (The_NetZ) <ntzrmtthihu777@gmail.com>

pkgname=mingw-w64-ruby
pkgver=2.2.3
pkgrel=2
pkgdesc="An object-oriented language for quick and easy programming (mingw-w64)"
arch=(any)
url="http://www.ruby-lang.org/en"
license=("BSD, custom")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config ruby)
depends=(mingw-w64-crt mingw-w64-libyaml mingw-w64-db mingw-w64-openssl mingw-w64-gdbm mingw-w64-tk mingw-w64-pdcurses mingw-w64-libffi)
options=(staticlibs !strip !buildflags)
source=("http://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz")
#        "fix_win32_require.patch")
md5sums=('2a8bc1f46aba8938add70f742e8af1ff')
#         'acf9e08463a0a67c64037d09ca6c2781')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

#prepare() {
#  cd ${srcdir}/ruby-${pkgver}/
#  patch -Np1 -i ${srcdir}/fix_win32_require.patch
#
#}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    CPPFLAGS+="$(${_arch}-pkg-config --cflags libffi)"
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      disabled_exts="readline,sdbm"
    else
      disabled_exts="fiddle,readline,sdbm"
    fi
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/ruby-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --disable-install-doc \
      --disable-install-rdoc \
      --disable-install-capi \
      --with-out-ext=${disabled_exts} \
      --disable-ipv6 \
      --with-static-linked-ext \
      --with-tcl-dir=/usr/${_arch} \
      --with-tk-dir=/usr/${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make VERBOSE=1 DESTDIR="$pkgdir" install-nodoc 
    find  "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' -o -name '*.so' | xargs -rtl1 ${_arch}-strip -g
    find  "${pkgdir}/usr/${_arch}" -name '*.dll' -o -name '*.so' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find  "${pkgdir}/usr/${_arch}" -name '*.exe' -o -name '*.bat' | xargs -rtl1 rm
    rm -r "${pkgdir}/usr/${_arch}/share"
    rm -r "${pkgdir}/usr/${_arch}/lib/ruby"
  done
  cd "${srcdir}/ruby-${pkgver}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/${pkgname}/BSDL"
}
