# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules-git
pkgver=5.83.0.r3296.4d307aaf
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=('any')
url='https://projects.kde.org/projects/kdesupport/extra-cmake-modules'
license=('LGPL')
depends=('cmake')
makedepends=('git'
             'python-sphinx'
             'python-requests'
             'qt5-tools'
             )
conflicts=('extra-cmake-modules')
provides=('extra-cmake-modules')
source=('git+https://invent.kde.org/frameworks/extra-cmake-modules.git'
        'https://gitweb.gentoo.org/repo/gentoo.git/plain/kde-frameworks/extra-cmake-modules/files/extra-cmake-modules-5.82.0-sphinx-4.patch')
sha256sums=('SKIP'
            '5c3bb91ff092c9bc671d01eb9af4bbbd8f5a84178a12a7311a1efb5711253f01'
            )

pkgver() {
  cd extra-cmake-modules
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  patch -d extra-cmake-modules -p1 -i "${srcdir}/extra-cmake-modules-5.82.0-sphinx-4.patch"
}

build() {
  cd build
  cmake ../extra-cmake-modules \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
