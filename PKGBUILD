# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Milk Brewster <aurentry@milkmiruku.com>

_pkgname=element
pkgname=$_pkgname-git
pkgver=0.46.5.r489.ga46ede9a
pkgrel=1
pkgdesc='A modular audio plugin host (git version)'
arch=(x86_64)
url='https://github.com/kushview/Element'
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs hicolor-icon-theme)
makedepends=(alsa-lib boost git ladspa lilv lv2 suil)
optdepends=('lua: for LUA scripting')
provides=($_pkgname ladspa-host lv2-host vst3-host)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/kushview/Element.git"
        'JUCE::git+https://github.com/WeAreRoli/JUCE.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.JUCE.url "$srcdir/"JUCE
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

package() {
  depends+=(libasound.so libcurl.so libfreetype.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
}
