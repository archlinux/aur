# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

basename=gnome-shell-extension-xrdesktop
pkgname=$basename-git
pkgver=0.16.0.41.d5a2001
pkgrel=1
pkgdesc="An extension for toggling xrdesktop mode in GNOME Shell."
url="https://gitlab.freedesktop.org/xrdesktop/gnome-shell-extension-xrdesktop"
arch=(any)
license=(MIT)
makedepends=(meson git)

source=('git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell-extension-xrdesktop.git#branch=main')
sha256sums=('SKIP')
replaces=($basename)
conflicts=($basename)

ver() {
  PREFIX="  version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(ver).$revision.$hash
}
build() {
  arch-meson $basename build
  ninja -C build
}

# check() {
#   meson test -C build
# }

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "${srcdir}"/gnome-shell-extension-xrdesktop/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
