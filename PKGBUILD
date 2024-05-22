# Maintainer:  dreieck
# Contributor: Ujhhgtg (https://aur.archlinux.org/account/Ujhhgtg)

## Based on `PKGBUILD` for package `icu71`, version 71.1-1, by Ujhhgtg (https://aur.archlinux.org/account/Ujhhgtg).

_pkgname=icu
_pkgmainver=74
_pkgminorver=2
pkgname="${_pkgname}${_pkgmainver}"
pkgver="${_pkgmainver}.${_pkgminorver}"
pkgrel=5
pkgdesc="International Components for Unicode library (legacy version ${_pkgmainver})."
arch=(
  'i686'
  'x86_64'
)
url="http://www.icu-project.org/"
license=('custom:icu')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'clang'
  'make'
  'patch'
  'python'
)
provides=(
  # "${_pkgname}=${pkgver}" # Do not provide `icu` itself, since the executable tools are not provided.
  "libicudata.so=${_pkgmainver}"
  "libicui18n.so=${_pkgmainver}"
  "libicuio.so=${_pkgmainver}"
  "libicutest.so=${_pkgmainver}"
  "libicutu.so=${_pkgmainver}"
  "libicuuc.so=${_pkgmainver}"
)
conflicts=(
  "${_pkgname}=${_pkgmainver}"
  "${_pkgname}=${_pkgmainver}.0"
  "${_pkgname}=${_pkgmainver}.1"
  "${_pkgname}=${_pkgmainver}.2"
  "${_pkgname}=${_pkgmainver}.3"
  "${_pkgname}=${_pkgmainver}.4"
  "${_pkgname}=${_pkgmainver}.5"
  "${_pkgname}=${_pkgmainver}.6"
  "${_pkgname}=${_pkgmainver}.7"
  "${_pkgname}=${_pkgmainver}.8"
  "${_pkgname}=${_pkgmainver}.9"
  "libicudata.so=${_pkgmainver}"
  "libicui18n.so=${_pkgmainver}"
  "libicuio.so=${_pkgmainver}"
  "libicutest.so=${_pkgmainver}"
  "libicutu.so=${_pkgmainver}"
  "libicuuc.so=${_pkgmainver}"
)
source=(
  "https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"
  #"https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz.asc"
  "https://github.com/unicode-org/icu/raw/main/LICENSE"
)
md5sums=('94c0b370f43123ea92b146ebea9c709d'
         'ce7acbc234de1fa02ab706fc47ca65df')
sha256sums=('68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c'
            '533baeb24c2ef84f58a0d08db3b63a6ed67699d272c0016719edba3f59a60222')
#validpgpkeys=(
#  '4058F67406EAA6AB'
#)

build()
{
  cd "${_pkgname}/source"

  ## `--enable-tools` is needed to build `genrb` binary, which is needed somewhere during the compilation process.
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

check()
{
  cd "${_pkgname}/source"

  make -k check
}

package()
{
  cd "${_pkgname}/source"

  make DESTDIR="${pkgdir}" install

  ## Remove files that would make this package conflict with the generic `icu` package, and other "garbage" files:
  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  ## Install license
  install -Dvm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
