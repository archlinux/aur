# Maintainer: ahmedmoselhi <ahmedmoselhi55@gmail.com> 

pkgname='grub-customizer-gtk'
_pkgname='grub-customizer'
pkgver=5.2.2
pkgrel=2
pkgdesc='A tool to choose grub2 bootscreen theme'
arch=('x86_64')
url="https://launchpad.net/grub-customizer"
license=('GPL3')
depends=('grub')
makedepends=('cmake' 'gcc' 'gtkmm3' 'gettext' 'openssl' 'libarchive')
provides=('grub-customizer')
source=("${_pkgname}_${pkgver}.tar.gz"::"http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu/pool/main/g/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz"
              "grub.cfg")
sha256sums=("39d4b3dda81c3804566f0cc9d2ab1f41e1ffa923656b651c1488220ed2046793"
                       "47c6de7e8f77d843dd79547b6ea34d5f485271cdf86fa3770f67c59359d2e78b")

prepare() {
rm -rf ${_pkgname}-${pkgver}
tar -zxf ${_pkgname}_${pkgver}.tar.gz
}

build() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p builddir && cd builddir
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_CXX_FLAGS=" -std=c++11"
  make
}

package(){
  cd "${_pkgname}-${pkgver}/builddir"
  make install DESTDIR="${pkgdir}"
  # configuration
  install -vDm 644 "${srcdir}/grub.cfg" -t "${pkgdir}/etc/${_pkgname}/"
  # additional documentation
  install -vDm 644 ../{changelog,README} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}