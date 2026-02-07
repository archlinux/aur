# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

_pkgname=icu
_pkgmainver=77
_pkgminorver=1
pkgname="${_pkgname}${_pkgmainver}"
pkgver="${_pkgmainver}.${_pkgminorver}"
pkgrel=3
pkgdesc="International Components for Unicode library"
arch=(x86_64)
url="https://icu.unicode.org"
license=('LicenseRef-Unicode-3.0'
         'BSD-2-Clause'
         'BSD-3-Clause'
         'NAIST-2003')
depends=('gcc-libs' 'glibc' 'sh')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so=${_pkgmainver})
source=(https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz{,.asc}
        ICU-22132.patch)
# https://github.com/unicode-org/icu/releases/download/release-77.1/SHASUM512.txt
sha512sums=('a47d6d9c327d037a05ea43d1d1a06b2fd757cc02a94f7c1a238f35cfc3dfd4ab78d0612790f3a3cca0292c77412a9c2c15c8f24b718f79a857e007e66f07e7cd'
            'SKIP'
            '1178062ccfcf7ecc698c64132b3612e73f9c4b0bbfaa668ae2039f3eb4cb2722d0b08a9f45b057da10def7a308d5c8d14c0c644892e7f11092c9cc488c850ab7')
validpgpkeys=('E52F07877A5805F9AF4AB0ACD46C5610D06E7001') # ICU Release Robot <icu-robot@unicode.org>

prepare() {
  cd icu/source
  # Required fix for thunderbird 115 to show Calendar and sidebar properly
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1843007
  # https://unicode-org.atlassian.net/browse/ICU-22132
  patch -Np1 < "../../ICU-22132.patch"
}

build() {
  cd icu/source
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --disable-icu-config \
    --disable-debug \
    --enable-release \
    --enable-shared \
    --disable-static \
    --disable-auto-cleanup \
    --enable-draft \
    --enable-renaming \
    --disable-tracing \
    --enable-plugins \
    --enable-dyload \
    --enable-rpath \
    --disable-weak-threads \
    --enable-extras \
    --enable-icuio \
    --enable-layoutex \
    --enable-tools \
    --disable-fuzzer \
    --enable-tests \
    --disable-samples \
    --with-data-packaging=library

  make
}

check() {
  cd "${_pkgname}/source"
  # make check
}

package() {
  cd "${_pkgname}/source"

  make DESTDIR="${pkgdir}" install

  ## Remove files that would make this package conflict with the generic `icu` package, and other "garbage" files:
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # Install license
  install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
