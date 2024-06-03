# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=textpieces
pkgver=4.0.6
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
b2sums=('b98e45452a89accd3be273976723a82824f0105825fc6ec9f595f815267e8561f06f38082ac9000b1637b639a778524c99ea9a0325cfe1aec59e7272cb9affc2')

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
  # Removes unnecessary dummy translation
  rm -r "${pkgdir}"/usr/share/locale/xx_XX/
}
