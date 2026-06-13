# Maintainer:  yjun <jerrysteve1101 at gmail dot com>

# based on the PKGBUILD of dsview
# Origin Contributor: Anatol Pomozov
# Origin Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Origin Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pxview-git
pkgver=1.5.0.r16.5d91251
pkgrel=1
epoch=1
pkgdesc='GUI program for supporting various instruments from PXLogic, including logic analyzers, oscilloscopes, etc.'
arch=(i686 x86_64)
url='https://github.com/PXLogic/PXView'
license=(GPL-3.0-or-later)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(glibc libgcc libstdc++ hicolor-icon-theme
         glib2 python fftw libusb zlib
         qt6-base qt6-svg qt6-websockets
         nlohmann-json boost-libs)
makedepends=("boost" "cmake" "git" "qt6-svg")
source=("${pkgname}::git+${url}.git"
        "0001-install-libsigrokdecode-under-PXView-prefix.patch")
sha1sums=('SKIP'
          'd27bc293735e0397c13fe03929e8c3a11e2b42ca')

pkgver() {
  cd "${srcdir}/${pkgname}"
  px_version="$(grep -oP 'DS_VERSION_MAJOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'DS_VERSION_MINOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'DS_VERSION_MICRO \K[0-9]+' CMakeLists.txt)"
  
  printf "%s.r%s.%s" "${px_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  # temporary fix icon display
  rsvg-convert -w 256 -h 256 -f png -o PXView/icons/logo.png PXView/icons/logo.svg
  
  # patch
  git apply ${srcdir}/0001-install-libsigrokdecode-under-PXView-prefix.patch
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
