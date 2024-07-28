# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=textpieces
pkgver=4.1.0
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
b2sums=('07e553a7ad3b247583ba42390dfbcdf16d9d46f8767e9e992367c61921b9992caf162d272f026c67be74e22e3e4b3d0f09701f6a72c2e52404b42f9822d2f4ac')

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
