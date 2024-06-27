# Maintainer: SelfRef <arch@selfref.dev>
_basename=showtime
pkgname=${_basename}
pkgver=47.alpha
pkgrel=2
pkgdesc="Video Player - Watch without distraction"
arch=('x86_64')
url="https://apps.gnome.org/Showtime/"
license=('GPL')
depends=('python' 'gtk4>=4.15' 'libadwaita>=1.5' 'gst-plugin-gtk4')
makedepends=('git' 'meson')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://gitlab.gnome.org/GNOME/Incubator/showtime.git#commit=75e44a6c9d6eedde3a053af354693e20e4b3d91f")
sha256sums=('539011b3cccee9837ecc3da06a7181f72a18aecf7f2c3675993853ded1af95a9')

# Currently manual, project does not use git tags
# pkgver() {
#   cd "$_basename"
#   ( set -o pipefail
#     git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
#   )
# }

prepare() {
	meson subprojects download --sourcedir=$_basename
}

build() {
	arch-meson $_basename build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
