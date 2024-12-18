# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Auto update bot <auto-update-bot@arch4edu.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Grey Christoforo <first name at last name dot net>
_base=HDFView
pkgname=${_base,,}
pkgver=3.3.2
pkgrel=1
pkgdesc="A visual tool for browsing and editing HDF4 and HDF5 files"
arch=(x86_64)
url="https://github.com/HDFGroup/${pkgname}"
license=('custom')
depends=(hdf5 java-runtime)
makedepends=(ant gendesk hdf5 inetutils 'java-environment>=21')
optdepends=(hdf5)
source=(${url}/releases/download/v${pkgver}/${_base}-${pkgver}.tar.gz)
sha256sums=('6e83811ae98a45b82023baeca5335b9cfafd75d9f4cada93661896618b2b47aa')

#check() {
#  cd "${srcdir}/${_base}-${pkgver}"
#
#  export HDFLIBS=/opt/hdf4
#  export HDF5LIBS=/usr
#  ant junit
#}

build() {
  cd ${srcdir}/${_base}-${pkgver}
  # export HDFLIBS=/opt/hdf4
  export HDF5LIBS=/usr
  ant createJPackage
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name ${_base}
}

package() {
  cd ${srcdir}/${_base}-${pkgver}
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin"

  cp -a ${_base} "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/bin/${_base} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "src/HDFView.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
