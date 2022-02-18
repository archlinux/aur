# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets-git
pkgver=6.0.beta.2.r50.gbbec1dd8
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('gtk4>=4.5.0' 'glib2' 'libadwaita>=1.0.0' 'libpwquality>=1.4.0' 'python-gobject' 'python-pykeepass>=4.0.1' 'python-pyotp>=2.4.0' 'python-cairo')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=('gnome-passwordsafe' "${pkgname%-git}")
replaces=('gnome-passwordsafe' "${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
