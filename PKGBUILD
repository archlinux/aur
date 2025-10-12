# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=meshroom
pkgver=2025.1.0
pkgrel=3
pkgdesc="A free, open-source 3D Reconstruction Software based on the AliceVision framework"
arch=('x86_64')
url="https://alicevision.org/#meshroom"
license=('MPL2')
depends=('alice-vision' 'alembic' 'openimageio' 'python-psutil' 'popsift'
         'pyside6' 'opencv' 'python-pyseq'
         'qt6-imageformats' 'qt6-location' 'qt6-svg' 'qt6-charts' 'qt6-3d' 'qt6-quick3d' 'qt6-shadertools' 'qt6-declarative' 'qt6-5compat')
makedepends=('git' 'cmake' 'python-idna' 'python-setuptools' 'boost' 'coin-or-lemon')
optdepends=('vulkan-headers: vulkan acceleration support')
source=("${pkgname}::git+https://github.com/alicevision/meshroom.git#tag=v${pkgver}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtAliceVision.git#tag=v${pkgver}"
        "fix-qt-errors.patch"
        "meshroom.sh")
sha256sums=('9020b17317e416990f27c8a2214f2b9274ae1e2e5412f10bac76534517f48814'
            'SKIP'
            '73109e38f6383ea3749f2a863166b43cd8c9e7e6fab421193489fe562f85b843'
            '3fc0237907ace26474cfba9ff6ab7f1f2d96c1bd56ecdb1a6361812657f0b3de'
            '81665eb7a36e5b7ccd6fd4031c275c6e6aaf32a15c31d85a012e44236501c67b')

prepare() {
  cd meshroom

  # Patch qt6/pyside6 bug
  patch -p1 -i ../fix-qt-errors.patch

  cd ../QtAliceVision

  # Patch a qt6 include bug
  sed -e '/find_package(Qt6 REQUIRED COMPONENTS Gui)/a\find_package(Qt6 REQUIRED COMPONENTS GuiPrivate)' -i src/qtAliceVision/CMakeLists.txt

}

build() {
  cd "${srcdir}"/QtAliceVision
  cmake \
    -Bbuild \
    -DCMAKE_INSTALL_PREFIX="/usr/lib/qt" \
    -DCMAKE_INSTALL_RPATH="/opt/alicevision/lib" \
    -DCMAKE_BUILD_TYPE=None

  make -C build
}

package() {
  install -vDm 644 "${srcdir}"/meshroom.sh -t "${pkgdir}"/etc/profile.d/

  DESTDIR="${pkgdir}" make -C QtAliceVision/build install

  cd meshroom
  install -Dm755 meshroom/ui/__main__.py "${pkgdir}"/usr/bin/meshroom
  sed -i '1i\#\!\/usr\/bin\/python' "${pkgdir}"/usr/bin/meshroom
  install -m755 -t "${pkgdir}"/usr/bin bin/meshroom_*

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  mkdir -p "${pkgdir}"/usr/lib/python"${python_version}"
  cp -r meshroom "${pkgdir}"/usr/lib/python"${python_version}"

  install -Dm644 -t "${pkgdir}"/usr/share/aliceVision "${srcdir}"/voctree/vlfeat_K80L3.SIFT.tree
}
# vim:set ts=2 sw=2 et:
