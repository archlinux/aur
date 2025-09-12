# Maintainer:  yjun <jerrysteve1101 at gmail dot com>

# based on the PKGBUILD of dsview
# Origin Contributor: Anatol Pomozov
# Origin Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Origin Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pxview-git
pkgver=1.4.8.r13.69e4e45
pkgrel=1
epoch=1
pkgdesc='GUI program for supporting various instruments from PXLogic, including logic analyzers, oscilloscopes, etc.'
arch=(i686 x86_64)
url='https://github.com/PXLogic/PXView'
license=(GPL-3.0-or-later)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(hicolor-icon-theme glib2 python fftw
        libusb zlib qt5-base qt5-svg boost-libs saribbon)
makedepends=(boost cmake git librsvg)
source=("${pkgname}::git+https://github.com/PXLogic/PXView"
        "0001-make-glibc-happy.patch"
        "0002-simplify-qt-version-detection.patch")
sha1sums=('SKIP'
          '8ad9e29163c60579a668c424f47a82c0c0275182'
          'e41decc1160dd42d86ee26c81a458fd93b8aa6a8')

pkgver() {
  cd "${srcdir}/${pkgname}"
  px_version="$(grep -oP 'PX_VERSION_MAJOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'PX_VERSION_MINOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'PX_VERSION_MICRO \K[0-9]+' CMakeLists.txt)"
  
  printf "%s.r%s.%s" "${px_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  sed -i 's#MODE="0666"#TAG+="uaccess"#' PXView/px.rules

  # temporary fix icon display
  rsvg-convert -w 256 -h 256 -f png -o PXView/icons/logo.png PXView/icons/logo.svg
  
  # https://github.com/PXLogic/PXView/pull/1
  # fix archlinux gcc 14 build failure issue
  git cherry-pick --no-commit ba80efab017d71647b1f4027a8b1fa

  # patch
  git apply ${srcdir}/0001-make-glibc-happy.patch
  git apply ${srcdir}/0002-simplify-qt-version-detection.patch
}
 
build() {
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -B build
  cmake --build build
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}"/${pkgname}/

  DESTDIR="${pkgdir}" cmake --install build

  # temporary fix icon display
  rm -rf ${pkgdir}/usr/share/pixmaps/pxview.svg \
        ${pkgdir}/usr/share/icons/
  install -Dm644 PXView/icons/logo.png ${pkgdir}/usr/share/pixmaps/pxview.png
}

# vim: set sw=2 ts=2 et:
