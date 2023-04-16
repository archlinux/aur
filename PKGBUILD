pkgname=snapshot-git
pkgver=r249.3025e6c
pkgrel=1
pkgdesc='Take pictures and videos'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/Incubator/snapshot"
license=('GPL3')
depends=('libadwaita-git' 'gstreamer>=1.20.0' 'gst-plugins-base>=1.20.0' 'gst-plugins-bad>=1.20.0' 'gst-plugins-good>=1.20.0' 'gtk4>=4.9.0' 'glib2>=2.75.0' 'xdg-desktop-portal' 'pipewire' 'gst-plugin-pipewire')
makedepends=('git' 'meson' 'cargo' 'clang')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
