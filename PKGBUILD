# Maintainer: termuellinator
_gitname=krunner-symbols
pkgname=plasma6-runners-symbols-git
_pkgname=${pkgname%-git}
pkgver=r142.844195b
pkgrel=1
pkgdesc="A little krunner plugin (Plasma 6) to retrieve unicode symbols, or any other string, based on a corresponding keyword"
arch=('x86_64')
url="https://github.com/domschrei/$_gitname"
license=('GPL')
depends=('krunner' 'qt6-base' 'ki18n' 'qt6-5compat' 'qt6-declarative' 'ktextwidgets' 'libplasma')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'jq')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url#branch=plasma6")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  # Get correct installation directories
  prefix=$(qtdiag6 | grep PrefixPath | tr -d ' ' | cut -d ':' -f 2)
  loc_plugin=$(qtdiag6 | grep PluginsPath | tr -d ' ' | cut -d ':' -f 2 |sed 's.^'"$prefix"'/..')
  loc_config=share/config

  # Build the plugin
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=$prefix \
    -DLOCATION_PLUGIN=$loc_plugin \
    -DLOCATION_CONFIG=$loc_config \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}

