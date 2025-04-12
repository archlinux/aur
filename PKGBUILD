# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libvoikko"
pkgname="lib32-${_name}"
pkgver=4.3.2
pkgrel=1
pkgdesc="A spelling and grammar checker, hyphenator and collection of related linguistic data for Finnish language (32-bit)"
arch=('x86_64')
url="https://voikko.puimula.org"
license=('MPL-1.1 OR GPL-2.0-or-later OR LGPL-2.1-or-later')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}>=${pkgver}")
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://www.puimula.org/voikko-sources/${_name}/${_pkgsrc}.tar.gz"
        "${_pkgsrc}.tar.gz.asc::https://www.puimula.org/voikko-sources/${_name}/${_pkgsrc}.tar.gz.asc")
sha256sums=('0156c2aaaa32d4b828addc7cefecfcea4591828a0b40f0cd8a80cd22f8590da2'
            'SKIP')
validpgpkeys=('AC5D65F10C8596D7E2DAE2633D309B604AE3942E') # Harri Pitkänen <hatapitk@iki.fi>

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/-Werror//g' 'configure.ac'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LANG=en_US.UTF-8
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --with-dictionary-path='/usr/share/voikko'
    --disable-buildtools
    --disable-testtools
    --disable-hfst
    --disable-vislcg3
    --disable-lttoolbox
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make all
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
