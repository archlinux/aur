# Contributor: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>

pkgname=msp430-libc
pkgver=20120224
pkgrel=1
pkgdesc="C runtime library for the MSP430 family of microcontrollers"
arch=('i686' 'x86_64')
url="http://mspgcc4.sourceforge.net/"
license=('custom')
depends=('gcc-msp430')
options=(!strip)

_mspgcc_ver=20120406
_sf_base="http://sourceforge.net/projects/mspgcc/files"
_patches_base="${_sf_base}/Patches/LTS/${_mspgcc_ver}"
_patches=("${pkgname}-${pkgver}-sf3522752.patch")

source=("https://sourceforge.net/projects/mspgcc/files/msp430-libc/msp430-libc-${pkgver}.tar.bz2"
        "${_patches[0]}::${_patches_base}/${_patches[0]}/download")
sha1sums=('d01cf0db41bff1a0ab50644cbb11bc5a1d5be172'
          '2ca4aea9b8dcd6a199303373a8a97c7a2dd4eef6')

_builddir=build

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  (cd "${srcdir}/${pkgname}-${pkgver}" &&
    for patch in ${_patches[@]} ; do
      msg "Applying ${patch}"
      patch -p1 < "${srcdir}/${patch}"
    done)

  rm -frv ${_builddir}
  mkdir -p ${_builddir} && cd ${_builddir}

}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  mkdir -p ${pkgdir}/usr/msp430/lib
  make -j1 install PREFIX=${pkgdir}/usr

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sts=2 ts=2 sw=2 et:
