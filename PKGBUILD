# Maintainer:  yjun <jerrysteve1101 at gmail dot com>

# based on the PKGBUILD of dsview
# Origin Contributor: Anatol Pomozov
# Origin Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Origin Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pxview-git
pkgver=1.3.4.r5.fac9f01
pkgrel=1
pkgdesc='GUI program for supporting various instruments from PXLogic, including logic analyzers, oscilloscopes, etc.'
arch=(i686 x86_64)
url='https://github.com/PXLogic/PXView'
license=(GPL-3.0-or-later)
# Upstream added VCS dependency to libsigrokdecode :/
depends=(hicolor-icon-theme glib2 python fftw
        libusb zlib qt5-base boost-libs saribbon)
makedepends=(boost cmake git)
source=("${pkgname}::git+https://github.com/PXLogic/PXView"
        "0001-make-glibc-happy.patch") #branch=develop
sha1sums=('SKIP'
          'c36f3d81501bc35b207631483179ca663308926b')

pkgver() {
  cd "${srcdir}/${pkgname}"
  px_version="$(grep -oP 'PX_VERSION_MAJOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'PX_VERSION_MINOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'PX_VERSION_MICRO \K[0-9]+' CMakeLists.txt)"
  
  printf "%s.r%s.%s" "${px_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  sed -i 's#MODE="0666"#TAG+="uaccess"#' PXView/px.rules
  
  # https://github.com/PXLogic/PXView/pull/1
  # fix archlinux gcc 14 build failure issue
  git cherry-pick ba80efab017d71647b1f4027a8b1fa

  # patch
  git apply ${srcdir}/0001-make-glibc-happy.patch
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
}

# vim: set sw=2 ts=2 et:
