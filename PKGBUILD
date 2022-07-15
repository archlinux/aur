# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets-git
pkgver=6.0.beta.2.r280.g50b12686
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('libadwaita-git>=1.2.alpha' 'libpwquality' 'python-gobject' 'python-pykeepass' 'python-pyotp' 'python-cairo')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=('gnome-passwordsafe-git' "${pkgname%-git}")
replaces=('gnome-passwordsafe-git' "${pkgname%-git}")
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
