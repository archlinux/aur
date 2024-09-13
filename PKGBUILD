# Maintainer: Albert Gräf <aggraef@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Milk Brewster <aurentry@milkmiruku.com>

_pkgname=element
pkgname=$_pkgname-git
pkgver=1.0.0.300.g57eff7bc
pkgrel=1
pkgdesc='A modular audio plugin host (git version)'
arch=(x86_64)
url='https://kushview.net/element/'
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs hicolor-icon-theme)
makedepends=(alsa-lib boost git ladspa lilv lv2 suil python meson)
optdepends=('lua: for LUA scripting')
provides=($_pkgname ladspa-host lv2-host vst3-host)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/kushview/element.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    printf "%s.g%s" "$(python3 util/version.py --build | sed -e 's/-/./')" "$(python3 util/version.py --short-hash)" ||
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  meson setup $_pkgname $_pkgname-build --prefix /usr
  meson compile -C $_pkgname-build
}

package() {
  depends+=(libasound.so libcurl.so libfreetype.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
}
