# Maintainer:  dreieck

_pkgname='cdtool'
pkgname="${_pkgname}"
_pkgver=2.1.8
_debianver=8
pkgver="${_pkgver}+debian${_debianver}"
pkgrel=1
pkgdesc="Control the audio functions of a CDROM drive from the command line. Contains 'cdplay', 'cdstop', 'cdeject' and many other tools."
# url="http://hinterhof.net/cdtool/" # Offers old source which does not build anymore with up to date GCC.
url="https://packages.debian.org/sid/cdtool"
arch=(
  # Architecture list enhanced by https://packages.debian.org/sid/cdtool
  'aarch64'
  'alpha'
  'amd64'
  'arm64'
  'armel'
  'armhf'
  'armv6h'
  'armv7h'
  'armv7h'
  'hppa'
  'i386'
  'i486'
  'i586'
  'i686'
  'ia64'
  'm86k'
  'mips64el'
  'pentium4'
  'ppc64'
  'ppc64el'
  'risc64'
  's390x'
  'sh4'
  'sparc64'
  'x32'
  'x86_64'
)
license=('GPL2')
depends=(
  'bash'
  'glibc'
)
optdepends=()
makepedends=()
checkdepends=()
provides=(
  "cdplay=${pkgver}"
  "cdpause=${pkgver}"
  "cdstop=${pkgver}"
  "cdclose=${pkgver}"
  "cdeject=${pkgver}"
  "cdown=${pkgver}"
  "cdadd=${pkgver}"
  "cdir=${pkgver}"
  "cdinfo=${pkgver}"
  "cdreset=${pkgver}"
  "cdshuffle=${pkgver}"
  "cdloop=${pkgver}"
  "cdctrl=${pkgver}"
  "cdvolume=${pkgver}"
)
replaces=()
conflicts=(
  "cdplay"
  "cdpause"
  "cdstop"
  "cdclose"
  "cdeject"
  "cdown"
  "cdadd"
  "cdir"
  "cdinfo"
  "cdreset"
  "cdshuffle"
  "cdloop"
  "cdctrl"
  "cdvolume"
)
source=(
  # "${_pkgname}-${_pkgver}.tar.gz::https://hinterhof.net/${_pkgname}/dist/${_pkgname}-${_pkgver}.tar.gz"
  "http://deb.debian.org/debian/pool/main/c/${_pkgname}/${_pkgname}_${_pkgver}-release.orig.tar.gz"
  "http://deb.debian.org/debian/pool/main/c/${_pkgname}/${_pkgname}_${_pkgver}-release-${_debianver}.debian.tar.xz"
)
md5sums=(
  '7b19b6f68d2c648296378b784d5f7681'
  'f64705857af14fe2373b5325605c1e41'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for _patch in "${srcdir}/debian/patches"/*.{diff,patch}; do
    msg2 "Applying debian patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  ## Silence compiler warnings
  CFLAGS+=' -Wno-unused-result -Wno-unused-but-set-variable -Wno-unused-variable'
  export CFLAGS

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --enable-scsi

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install

  for _docfile in CHANGES CREDITS INSTALL README TODO; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}

# vim:set ts=2 sw=2 et:
