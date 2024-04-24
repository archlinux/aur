# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.6.4
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL-3.0-or-later')
depends=('cairo'
         'dconf'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk4'
         'gtksourceview5'
         'hicolor-icon-theme'
         'libadwaita'
         'openssl'
         'poppler-glib')
makedepends=('cargo' 'meson')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('2453f8876b36d4b546a6a26f2fe18b42354f8667644ff65da04ac0868065cf035214cdd48139f4773feb10f9f0054273e97756203a9e40ff1d8a958087670c82')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
