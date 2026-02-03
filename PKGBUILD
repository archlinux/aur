# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_name="raptor"
pkgname="lib32-${_name}"
pkgver=2.0.16
pkgrel=3
pkgdesc="A C library that parses RDF/XML/N-Triples into RDF triples (32-bit)"
url="https://librdf.org/raptor/"
arch=(
  'x86_64'
)
license=(
  'Apache-2.0 OR GPL-2.0-or-later OR LGPL-2.1-or-later'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-curl>=7.12.0'
  'lib32-glibc'
  'lib32-icu'
  'lib32-libxml2>=2.6.8'
  'lib32-libxslt>=1.0.18'
)
makedepends=(
  'lib32-gcc-libs'

  'gtk-doc'
)
_pkgsrc="${_name}2-${pkgver}"
source=(
  "https://librdf.org/dist/source/${_pkgsrc}.tar.gz"
  "https://librdf.org/dist/source/${_pkgsrc}.tar.gz.asc"
  'raptor-2.0.15-libxml2-2.11.patch'
)
sha512sums=('9bd5cff36390e1e0ef15ac56e5413ecfceb4018cb531a4da8850d3623615f12a93690a78be61f9d9ae7a24e16f6446e356bc2b7f34051ddc077761d85a9b7c44'
            'SKIP'
            '6d6c6ab0be9136ccf3e5b0c1140e88a49cbf94d4c36d27e3bb672ef13c83cdc7c8048c7ef883f9302fb3924ed78db1b059a983b9e1f8bce4522d5ef33a811ba7')
b2sums=('1e5e5742ba4cdaacb98a9ba77a9352589df0da60869e7721ee140c81ed4886bf909b37b247bd925c82a4ac44b3c11a909c913f0851d49a1d9d91c9293189266d'
        'SKIP'
        '0e3462817a77917eb82066f7d9efb1a28fa27221596c18fb140dadb4c0fd074b0936ed5cbd9fc620548796f548ad75890b00a3f73300af7d754cea695dc7f993')
validpgpkeys=(
  'F879F0DEDA780198DD08DC6443EC92504F71955A' # Dave Beckett <dave@dajobe.org>
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/raptor-2.0.15-libxml2-2.11.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --sbindir='/usr/bin'
    --sysconfdir='/etc'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --disable-static
    --with-icu-config='/usr/bin/icu-config-32'
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  # run with one job as tests are otherwise flaky: https://github.com/dajobe/raptor/issues/49
  make check -j1
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
