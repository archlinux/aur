# Maintainer: Zach Himsel <zach [at] himsel [dot] net>
# Contributor: Martchus <martchus@gmx.net>

pkgname=plasma5-applets-thermal-monitor-git
_pkgname=plasma5-applets-thermal-monitor
_gitpkgname=plasma-applet-thermal-monitor
pkgver=r85.7835369
pkgrel=2
pkgdesc="Plasma 5 applet for monitoring CPU, GPU and other available temperature sensors"
arch=('any')
url="https://github.com/kotelnik/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/kotelnik/$_gitpkgname.git"
        "0001-let-var-systemmonitorAvailableSources-refer-to-an-empty-array.patch"
        "0002-Fix-Plasmashell-crash-when-opening-config.patch")
sha256sums=('SKIP'
            '9d2ce31a47ff9400040814d18be08503372ab9f2a8282c76dee8a0e4432814e8'
            '9efa74346a424990ddfdee9241d196f748d44f60a65a2216fa454370ccf8f135')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_gitpkgname}"
    patch -p1 -i ../0001-let-var-systemmonitorAvailableSources-refer-to-an-empty-array.patch
    patch -p1 -i ../0002-Fix-Plasmashell-crash-when-opening-config.patch
}

build() {
  cd "${_gitpkgname}"

  mkdir -p build
  cd build
  rm -rf *

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd "${_gitpkgname}"/build

  make install DESTDIR="${pkgdir}"
}
