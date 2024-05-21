# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=meshroom
pkgver=2023.3.0
pkgrel=1
pkgdesc="A free, open-source 3D Reconstruction Software based on the AliceVision framework"
arch=('x86_64')
url="https://alicevision.github.io/"
license=('MPL2')
depends=('alice-vision' 'alembic' 'openimageio' 'python-psutil' 'popsift'
         'pyside2' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-3d' 'qt5-graphicaleffects'
         'qt5-imageformats' 'qt5-location' 'qt5-svg' 'qt5-charts')
makedepends=('git' 'cmake' 'python-idna' 'python-setuptools' 'ninja' 'boost' 'coin-or-lemon')
optdepends=('alice-vision-cuda: for DepthMap nodes')
source=("${pkgname}::git+https://github.com/alicevision/meshroom.git#tag=v${pkgver}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtAliceVision.git#tag=v${pkgver}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd meshroom

  # Hardcode camera_database and voctree default value
  sed -i "s:'ALICEVISION_VOCTREE', '':'ALICEVISION_VOCTREE', '/usr/share/${pkgname}/vlfeat_K80L3.SIFT.tree':g" meshroom/nodes/aliceVision/*.py
  sed -i "s:'ALICEVISION_SENSOR_DB', '':'ALICEVISION_SENSOR_DB', '/usr/share/aliceVision/cameraSensors.db':g" meshroom/nodes/aliceVision/*.py
}

build() {
  cd "${srcdir}"/QtAliceVision
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX="/usr/lib/qt" \
    -DCMAKE_BUILD_TYPE=None
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C QtAliceVision/build install

  cd meshroom
  install -Dm755 meshroom/ui/__main__.py "${pkgdir}"/usr/bin/meshroom
  sed -i '1i\#\!\/usr\/bin\/python' "${pkgdir}"/usr/bin/meshroom
  install -m755 -t "${pkgdir}"/usr/bin bin/meshroom_*

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  mkdir -p "${pkgdir}"/usr/lib/python"${python_version}"
  cp -r meshroom "${pkgdir}"/usr/lib/python"${python_version}"

  install -Dm644 -t "${pkgdir}"/usr/share/meshroom "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
