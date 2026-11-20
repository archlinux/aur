# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.8.11
pkgrel=1
pkgdesc="A high-performance terminal image/video/book browser written in C, based on the Chafa library"
arch=('x86_64' 'aarch64')
url="https://github.com/zouyonghe/PixelTerm-C"
license=('LGPL-3.0-or-later')
depends=('chafa' 'glib2' 'gdk-pixbuf2' 'ffmpeg' 'libmupdf')
makedepends=('pkgconf')
provides=('pixelterm-c')
options=('!debug' '!strip')
source=("pixelterm-c-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('efa8bea3bc8b75cf9e006f5ac51b8d313050f754d6acdd5d6bd395392b1b8e4e')

build() {
  cd "${srcdir}/PixelTerm-C-${pkgver}"
  make VERSION="${pkgver}"
}

check() {
  cd "${srcdir}/PixelTerm-C-${pkgver}"
  local actual_version
  actual_version=$(./bin/pixelterm --version) || return 1
  test "${actual_version}" = "${pkgver}" || return 1
  ./bin/pixelterm --help >/dev/null
}

package() {
  cd "${srcdir}/PixelTerm-C-${pkgver}"
  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 completions/bash/pixelterm "${pkgdir}/usr/share/bash-completion/completions/pixelterm"
  install -Dm644 completions/zsh/_pixelterm "${pkgdir}/usr/share/zsh/site-functions/_pixelterm"
  install -Dm644 completions/fish/pixelterm.fish "${pkgdir}/usr/share/fish/vendor_completions.d/pixelterm.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# rebuild-deps: libmupdf=1.28.6-1 ffmpeg=2:9.1-1
