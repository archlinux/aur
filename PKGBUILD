# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=picplanner-git
pkgver=0.3.2.r0.g4962fe6
pkgrel=1
pkgdesc="Plan your next photo locations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zwarf/picplanner"
license=('GPL3')
depends=('libadwaita' 'libshumate' 'libgweather-4' 'geocode-glib-2' 'protobuf-c')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git
  0179-fix-dependency.patch)
b2sums=('SKIP'
        'b3c0209ccafac973a3a04f509f0dd7a2ea49d210321b8a1f83c86fb1d17d08793998e9a88ae86b9abc066094b543496e075d1552074a549b13cb2996c72f3b68')

prepare() {
  cd "${pkgname%-git}"
  patch -p1 -i ../0179-fix-dependency.patch
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
