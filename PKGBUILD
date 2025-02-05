# Maintainer: Kogasa <kogasapls at gmail dot com>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
# based off `corectrl` PKGBUILD by Sergey Kostyuchenko <derfenix@gmail.com>

_pkgname=corectrl
pkgname=${_pkgname}-git
pkgver=1.4.0.r47.g0bbf5ad
pkgrel=1
pkgdesc="Application to control your hardware with ease using application profiles"
url="https://gitlab.com/corectrl/corectrl"
license=(GPL-3.0-or-later)
arch=(i686 x86_64)
depends=('botan>=3.0.0' 'qt6-base' 'qt6-charts' 'qt6-svg'
    'qt6-declarative' 'procps-ng' 'hwdata' 'quazip-qt6' 'dbus' 'polkit' 'pugixml>=1.11'
    'spdlog>=1.4' 'fmt>=5.0')
makedepends=('git' 'cmake>=3.3' 'extra-cmake-modules' 'qt6-tools')
optdepends=(
    'vulkan-tools: for vulkaninfo'
    'mesa-utils: for glxinfo'
    'util-linux: for lscpu'
    'hicolor-icon-theme: for hicolor theme hierarchy'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}/=/"
  export CXXFLAGS

  cmake -B build \
  -S "$_pkgname" \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_INSTALL_LIBEXECDIR=lib \
  -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  cd "$srcdir/"
  DESTDIR="$pkgdir" cmake --install build
}

