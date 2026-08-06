# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=Censor
pkgname=${_name,,}-git
pkgver=r369.762af2e
pkgrel=1
pkgdesc='PDF document redaction for the GNOME desktop'
arch=(x86_64)
url="https://codeberg.org/${_name,,}/${_name}"
license=(GPL-3.0-or-later)
depends=(gtk4
         libadwaita
         python-cairo
         python-gobject
         'python-pymupdf>=1.28.0')
makedepends=(git
             meson
             ninja)
checkdepends=(appstream-glib)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${_name}" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$pkgname-$pkgver-build" "$srcdir/${_name}"
    meson compile -C "$pkgname-$pkgver-build"
}

check() {
    meson test -C "$pkgname-$pkgver-build"
}

package() {
    meson install -C "$pkgname-$pkgver-build" --destdir "$pkgdir"
    cd "$pkgdir"
    python -m compileall --invalidation-mode=unchecked-hash .
}

