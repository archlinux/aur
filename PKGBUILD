# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=textpieces
pkgver=4.0.7
pkgrel=1
pkgdesc="Small tool for quick text transformations"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/liferooter/textpieces"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtksourceview5')
makedepends=('blueprint-compiler' 'git' 'meson' 'rust' 'vala')
checkdepends=('appstream-glib')
conflicts=("${pkgname}-git")
options=('!debug' '!emptydirs')
source=("${url}/-/archive/v${pkgver/_/-}/${pkgname}-v${pkgver/_/-}.tar.gz")
b2sums=('7fec75efb2e464e82b3e72897e4fe063832927c16d1b2fc9c15ca153b75434db0be072d545e498971b76a6c5d64602a998f9b7271ee0af8c1a65510d498fb9ac')

build() {
  mkdir -p "${srcdir}"/output
  arch-meson "${pkgname}-v${pkgver/_/-}" build
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
}
