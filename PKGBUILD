# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Thanks to the meshroom-bin package for the desktop file

pkgname=meshroom
pkgver=2025.1.1
pkgrel=1
pkgdesc="A free, open-source 3D Reconstruction Software based on the AliceVision framework"
arch=('x86_64')
url="https://alicevision.org/#meshroom"
license=('MPL-2.0')
depends=('alice-vision' 'openimageio' 'python-psutil'
         'pyside6' 'python-pyseq' 'python'
         'shiboken6' 'qt6-base' 'qt6-positioning' 'qt6-location' 'qt6-charts' 'qt6-3d' 'qt6-declarative')
makedepends=('git' 'cmake' 'python-idna' 'python-setuptools' 'boost' 'coin-or-lemon')
optdepends=('vulkan-headers: vulkan acceleration support')
source=("${pkgname}::git+https://github.com/alicevision/meshroom.git#tag=v${pkgver}"
        "voctree::git+https://gitlab.com/alicevision/trainedVocabularyTreeData.git"
        "git+https://github.com/alicevision/QtAliceVision.git#tag=v${pkgver}"
        "fix-qt-errors.patch"
        "meshroom.sh"
        "Meshroom.desktop")
sha256sums=('8ff23c0caa024d9fa1760d928d9bd32790b19f0d947df2eddcbaa39f5da71283'
            'SKIP'
            'd0ffd1c69f8afd321c0676bf14b3d77eec417f9ff4fece73bc93590b2c735dc3'
            '3fc0237907ace26474cfba9ff6ab7f1f2d96c1bd56ecdb1a6361812657f0b3de'
            '81665eb7a36e5b7ccd6fd4031c275c6e6aaf32a15c31d85a012e44236501c67b'
            '5b5c7c579e5e578c5b696df7097670df1f2c7f7247b4009e5f5a252fc63c9fe9')

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
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
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

  install -Dm644 meshroom/ui/img/meshroom.svg ${pkgdir}/usr/share/${pkgname}/meshroom.svg
  install -Dm755 ${srcdir}/Meshroom.desktop ${pkgdir}/usr/share/applications/Meshroom.desktop
}
# vim:set ts=2 sw=2 et:
