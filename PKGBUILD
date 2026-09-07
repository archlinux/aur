# Maintainer: sfn
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Thanks to the meshroom-bin package for the desktop file

pkgname=meshroom
pkgver=2025.1.8
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
sha256sums=('6f60de08ab02fe1754e4c0507a637b37c64c02cfc51037312dbb669086068d53'
            'SKIP'
            '306dee9b972d38b66e1328754591d43d0a83fde4d5040ab1f6ff2f0f40f3e44e'
            '1c21a89d033b3855b1b76991dcf327ee90481eb227fda13aabf9e5134ed40b5b'
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

  # fix a Python issue
  sed 's|#!/usr/bin/python|#!/usr/bin/env -S LD_PRELOAD=/usr/lib/libjemalloc.so /usr/bin/python|' -i ${pkgdir}/usr/bin/meshroom
}
# vim:set ts=2 sw=2 et:
