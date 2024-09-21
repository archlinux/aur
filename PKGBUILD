# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.7.0
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
b2sums=('f4d2ce8259a599715f07ce3161f98d6c70368d574e61461c4b8c04284d635f28a743a52a4957d291a152cc7da770ef42e9a58bc522592f24ff7c7ac8b316829a')

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
