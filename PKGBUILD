# Maintainer: Milk Brewster (milkii on freenode irc)
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=BChoppr
_pkgname=${_name,,}
_plugin_uri="https://www.jahnichen.de/plugins/lv2/$_name"
pkgname=$_pkgname-git
pkgver=1.12.8.r0.g91f9e6d
pkgrel=1
pkgdesc='An audio stream chopping LV2 plugin (git version)'
arch=(x86_64)
url='https://github.com/sjaehn/BChoppr'
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(cairo gcc-libs)
makedepends=(git lv2 libsndfile)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 plugin')
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/sjaehn/$_name.git")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  # BWidgets submodule has no .gitmodules — set it up manually
  git config submodule.src/BWidgets.url https://github.com/sjaehn/BWidgets.git
  git submodule init
  git submodule update
  # BWidgets has its own pugl submodule
  cd src/BWidgets
  git submodule init
  git submodule update
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  lv2lint -Mpack -I "$_name.lv2" "$_plugin_uri" || true
}

package() {
  cd $_pkgname
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -vDm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm644 doc/*.png -t "$pkgdir"/usr/share/doc/$pkgname/doc
  # Remove useless license file
  rm -f "$pkgdir"/usr/lib/vst/$_name.lv2/LICENSE
}
