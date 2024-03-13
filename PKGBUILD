# Maintainer: Kogasa <kogasapls at gmail dot com>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
# based off `corectrl` PKGBUILD by Sergey Kostyuchenko <derfenix@gmail.com>

_pkgname=corectrl
pkgname=${_pkgname}-git
pkgver=1.3.0.r138.g3ff1f2d
pkgrel=1
pkgdesc="Application to control your hardware with ease using application profiles"
url="https://gitlab.com/corectrl/corectrl"
license=(GPL-3.0-or-later)
arch=(i686 x86_64)
depends=('botan>=2.2.0' 'qt5-base>=5.15' qt5-quickcontrols2 qt5-charts qt5-svg procps-ng hwdata quazip-qt5 dbus polkit 'pugixml>=1.11' 'spdlog>=1.4')
makedepends=(git 'cmake>=3.3' extra-cmake-modules 'gcc>=8' qt5-tools)
optdepends=(
    'vulkan-tools: for vulkaninfo'
    'mesa-utils: for glxinfo'
    'util-linux: for lscpu'
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

