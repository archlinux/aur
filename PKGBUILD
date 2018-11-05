# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=vmd-molfile-plugins
pkgver=1.9.3
pkgrel=1
pkgdesc="Visual Molecular Dynamics plugins package"
url="https://www.ks.uiuc.edu/Research/vmd/plugins"
license=('custom')
arch=('x86_64')
depends=('tcl' 'netcdf')
makedepends=('make' 'gcc')
md5sums=('5706f88b9b77cc5fafda6fef3a82d6fa'
         'b79218662efe472ad2844f3b5b9beff6'
         'f60d4d3f9c39c0e9e997a6eacacbade1')

# You should download the source package from the VMD site and put it in the PKGBUILD folder
source=("local://vmd-${pkgver}.src.tar.gz"
        "plugins.patch"
        "LICENSE")

prepare() {
  cd ${srcdir}/plugins

  patch -Np0 -i "${srcdir}/plugins.patch"
}

build() {
  cd ${srcdir}/plugins

  make LINUXAMD64
}

package() {
  cd ${srcdir}/plugins

  PLUGINDIR=${srcdir}/molfile make distrib

  install -d ${pkgdir}/usr/lib/${pkgname}
  install -Dm755 ${srcdir}/molfile/LINUXAMD64/molfile/*.so ${pkgdir}/usr/lib/${pkgname}
  install -Dm644 ${srcdir}/molfile/LINUXAMD64/molfile/libmolfile_plugin* ${pkgdir}/usr/lib/${pkgname}
  install -d ${pkgdir}/usr/include/vmd-molfile
  install -Dm644 ${srcdir}/molfile/include/*.h ${pkgdir}/usr/include/vmd-molfile
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

