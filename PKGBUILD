# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula
pkgver=0.1.10
pkgrel=1
pkgdesc='Capture, annotate, save, and copy screenshots on Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/fgonzalezurriola/shaula'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'json-glib'
  'pango'
  'wayland'
  'wl-clipboard'
  'xdg-desktop-portal'
)
makedepends=(
  'librsvg'
  'meson'
  'ninja'
  'pkgconf'
)
optdepends=(
  'grim: native capture on Niri and wlroots compositors'
  'niri: compositor-specific setup integration'
  'quickshell: Noctalia Shell integration'
  'ttf-geist: recommended UI font'
  'ttf-excalifont: recommended annotation font'
)
provides=('shaula')
conflicts=('shaula-bin')
install='shaula.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Release automation replaces the checked-in marker with the immutable tag
# archive SHA-256 only inside the temporary AUR clone.
sha256sums=('e4f60235e789677fecc5269d7e8397dc81ddc913fd1bca864771bde105147ed8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson setup build --prefix=/usr --buildtype=release --strip -Db_lto=true
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
