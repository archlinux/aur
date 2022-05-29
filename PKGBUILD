# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Davide Depau <davide@depau.eu>

pkgname=authenticator-git
_pkgname=Authenticator
pkgver=4.1.2.r0.g66e0fc1
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL3')
depends=('glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'pipewire')
makedepends=('git' 'meson' 'gobject-introspection' 'rust' 'clang')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}

