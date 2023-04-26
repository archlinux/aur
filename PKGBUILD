# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.10.1
pkgrel=1
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/io.bassi.Amberol"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
_commit=3cd54f1251cf74dd02086614f1da4d96aa7e0132  # tags/0.10.1^0
source=("git+https://gitlab.gnome.org/World/amberol.git#commit=$_commit")
options=('!lto')
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  cargo update -p gmp-mpfr-sys
}

build() {
  local meson_options=(
    --buildtype release
  )

  export RUSTUP_TOOLCHAIN=stable
  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
