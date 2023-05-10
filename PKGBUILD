# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: tuberry <youremail@domain.com>

pkgname=gnome-shell-extension-shuzhi-git
_pkgname=shuzhi
pkgver=44.0.r3.g9a71d66
pkgrel=1
pkgdesc="A wallpaper generation extension for gnome shell, inspired by Jizhi"
arch=('any')
url="https://github.com/tuberry/shuzhi"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
checkdepends=('fortune-mod')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -Dtarget=system
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
