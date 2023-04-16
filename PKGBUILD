# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=amberol
pkgver=0.9.2
pkgrel=2
pkgdesc="Plays music, and nothing else"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/io.bassi.Amberol"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib' 'reuse')
_commit=c23ec2f11fa441c402b80f7a1733ac9aea65c81d  # tags/0.9.2^0
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
