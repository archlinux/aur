# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote-git
pkgver=0.5.6.r1.ga59f1e4
pkgrel=1
pkgdesc="A simple drawing application to create handwritten notes"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('libadwaita' 'poppler-glib' 'gstreamer' 'alsa-lib')
makedepends=('git' 'meson' 'cargo' 'cmake' 'clang')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "${pkgname%-git}::git+$url.git"
  "${pkgname%-git}-ink-stroke-modeler-rs::git+https://github.com/flxzt/ink-stroke-modeler-rs"
  "${pkgname%-git}-piet::git+https://github.com/flxzt/piet"
  "${pkgname%-git}-piet-gpu::git+https://github.com/flxzt/piet-gpu"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')
options=('!lto')

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule."piet".url "${srcdir}/${pkgname%-git}"-piet
  git config submodule."piet-gpu".url "${srcdir}/${pkgname%-git}"-piet-gpu
  git config submodule."ink-stroke-modeler-rs".url "${srcdir}/${pkgname%-git}"-ink-stroke-modeler-rs
  git -c protocol.file.allow=always submodule update --init --recursive
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
