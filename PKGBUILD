# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=textpieces-git
pkgver=4.0.6.r0.g8042824
pkgrel=1
pkgdesc="Small tool for quick text transformations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/liferooter/textpieces"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!debug' '!emptydirs')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}"/output
  arch-meson "${pkgname%-git}" build
  meson compile -C build
  # Install step must be on build because it builds something
  meson install -C build --destdir "${srcdir}"/output
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  mv "${srcdir}"/output/* "${pkgdir}"
  rmdir "${srcdir}"/output
  # Removes unnecessary dummy translation
  rm -r "${pkgdir}"/usr/share/locale/xx_XX/
}
