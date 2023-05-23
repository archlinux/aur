_pkgname=kdiff3
pkgname=${_pkgname}-git
pkgver=1.10.70.r2400.7d7a73b4
pkgrel=1
pkgdesc='A KDE file comparator/merge tool'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://invent.kde.org/sdk/kdiff3'
license=('GPLv2')
depends=('kparts' 'hicolor-icon-theme')
conflicts=("${_pkgname}" "${_pkgname}-kf5-git" "${_pkgname}-qt")
makedepends=('cmake' 'extra-cmake-modules' 'git' 'kdoctools' 'boost')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir:?}/${_pkgname}"
  ver=$(grep -Po 'project\(kdiff3 VERSION \K([0-9.]+)' CMakeLists.txt)
  printf '%s.r%s.%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir:?}/build"
  cd "${srcdir}/build"
  cmake "${srcdir}/${_pkgname}"  \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
}

build() {
  cd "${srcdir}/build"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir:?}" install
}
