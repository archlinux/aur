# Merged with official ABS kde-gtk-config PKGBUILD by João, 2023/05/14 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kde-gtk-config-git
pkgver=6.0.80_r1027.g8f477ae
pkgrel=2
pkgdesc='GTK2 and GTK3 Configurator for KDE'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glib2 glibc kcolorscheme-git kconfig-git kcoreaddons-git kdbusaddons-git kdecoration-git kguiaddons-git kwindowsystem-git qt6-base qt6-svg sh)
makedepends=(git extra-cmake-modules-git gtk3 sassc)
optdepends=('gtk3: GTK3 apps support'
            'xsettingsd: apply settings to GTK applications on the fly')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
