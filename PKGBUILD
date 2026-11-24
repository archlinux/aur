# Maintainer: Federico Cerruti <cerruti.federico@gmail.com>

pkgname=chelsea
pkgver=0.1.2
pkgrel=1
pkgdesc='Discover and watch movies and series from your Stremio addons (libadwaita, built-in mpv player)'
arch=('any')
url='https://github.com/riyaniii/Chelsea'
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libepoxy'
  'libglvnd'
  'libsecret'
  'mpv'
  'nuvio-engine>=0.1.6'
  'python'
  'python-diskcache'
  'python-gobject'
  'python-httpx'
  'python-mpv'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'org.freedesktop.secrets: keep Stremio sign-in between sessions'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('abc915af2e72360d14aba357644b7465cec7b3c3d23ce2e65418d3aa3b4190d8')

prepare() {
  cd Chelsea-$pkgver
  # Use the GL renderer for the mpv video widget, as the Flatpak does;
  # it can still be overridden from the environment.
  sed -i "/^sys.path.insert(1, pkgdatadir)/a\\
os.environ.setdefault('GSK_RENDERER', 'gl')" src/chelsea.in
  grep -q GSK_RENDERER src/chelsea.in
}

build() {
  arch-meson Chelsea-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
