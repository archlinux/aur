# Maintainer: buding <1259085392z@gmail.com>
pkgname=pixelterm-c
pkgver=1.8.7
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
sha256sums=('92a0d1d1659dfb34cee26cd62c9c39000dcb6e34c6badf5e9f805261cfa7aeb9')

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
# rebuild-deps: libmupdf=1.28.6-1 ffmpeg=2:9.0.2-3
