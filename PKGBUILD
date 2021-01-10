# Maintainer  : Grey Christoforo <first name at last name dot net>

pkgname=hdfview
_pkgname=HDFView
pkgver=3.1.2
pkgrel=1
pkgdesc="a GUI browser for reading hdf files"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support/Download+HDFView"
license=('custom')
depends=(
hdf5110
java-environment-openjdk=14
)
optdepends=(hdf4)
replaces=('hdfview-beta')
conflicts=('hdfview-beta')
makedepends=(ant gendesk)
source=("${pkgname}-${pkgver}.tar.gz::https://support.hdfgroup.org/ftp/HDF5/releases/HDF-JAVA/hdfview-${pkgver}/src/hdfview-${pkgver}.tar.gz")
sha256sums=('ec0c738464475de5e9ac05505760fa5a75cc0185fa4c056838ff04e4464cdc4f')

prepare() {
  cd hdfview-${pkgver}
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name ${_pkgname}
}

check(){
  cd hdfview-${pkgver}
  export HDFLIBS=/opt/hdf4
  export HDF5LIBS=/opt/hdf5110
  export JAVA_HOME=/usr/lib/jvm/java-14-openjdk
  ant junit
}

package() {
  cd hdfview-${pkgver}
  export HDFLIBS=/opt/hdf4
  export HDF5LIBS=/opt/hdf5110
  export JAVA_HOME=/usr/lib/jvm/java-14-openjdk
  ant createJPackage

  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  cp -a build/dist/${_pkgname} "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/bin/${_pkgname} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "src/HDFView.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
