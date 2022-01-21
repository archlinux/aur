# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=vmd-molfile-plugins
pkgver=1.9.4a55
pkgrel=1
pkgdesc="Visual Molecular Dynamics - molfile plugins"
url="https://www.ks.uiuc.edu/Research/vmd/plugins"
license=(custom)
arch=(x86_64)
depends=(tcl netcdf gcc10)
makedepends=(make patch)
sha256sums=('cc8aef24cb61d8f9973e1b8d71c6356668456c115a846c47621b2edcd080508b'
            'f66172ca4c56dcda18e053887ae41dc28f9fabd9ec2c0668ac4f09aff567fc17'
            'b85e9632f0337b6e46a4a7af5a7b757404a709a53ce20e96e9e8ea3d76e15fc1')

# You should download the source package from the VMD site and put it in the PKGBUILD folder
source=("local://vmd-${pkgver}.src.tar.gz"
        "plugins.patch"
        "LICENSE")
options=(staticlibs)

prepare() {
  cd ${srcdir}/plugins

  patch -Np1 -i "${srcdir}/plugins.patch"
}

build() {
  cd ${srcdir}/plugins

  make LINUXAMD64
}

package() {
  cd ${srcdir}/plugins

  PLUGINDIR=${srcdir}/molfile make distrib

  # install libraries
  install -d ${pkgdir}/usr/lib/${pkgname}
  install -Dm755 ${srcdir}/molfile/LINUXAMD64/molfile/*.so ${pkgdir}/usr/lib/${pkgname}
  install -Dm644 ${srcdir}/molfile/LINUXAMD64/molfile/libmolfile_plugin.a ${pkgdir}/usr/lib/${pkgname}

  # install headers
  install -d ${pkgdir}/usr/include/${pkgname}
  install -Dm644 ${srcdir}/molfile/LINUXAMD64/molfile/libmolfile_plugin.h ${pkgdir}/usr/include/${pkgname}
  install -Dm644 ${srcdir}/molfile/include/{molfile_plugin.h,vmdplugin.h} ${pkgdir}/usr/include/${pkgname}

  # install license
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
