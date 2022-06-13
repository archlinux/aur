# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=krunner-pass-git
pkgver=1.3.0.r15.gce0fbda
pkgrel=1
pkgdesc="A krunner plugin to retrieve a password from the password-store (https://www.passwordstore.org/)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/akermu/krunner-pass"
license=('GPL')
provides=("krunner-pass=${pkgver}")
conflicts=('krunner-pass')
depends=('krunner' 'qt5-base' 'ki18n' 'kcmutils')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt5-tools')
source=('git+https://github.com/akermu/krunner-pass'
        'fix_build.patch::https://github.com/akermu/krunner-pass/pull/21.patch')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "krunner-pass"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
  cd krunner-pass
  patch -p1 -i ../fix_build.patch
}

build() {
  cmake -B build -S krunner-pass \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) \
      -DQT_PLUGIN_INSTALL_DIR=$(qtpaths --plugin-dir) \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" VERBOSE=1 cmake --install build
}
