# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf-git
pkgrel=1
pkgver=0.4.4.r1.g8e76566
pkgdesc="PDF support for zathura (mupdf backend) (Supports PDF, ePub, and OpenXPS)"
arch=('x86_64')
url="https://pwmt.org/projects/zathura-pdf-mupdf"
license=('Zlib')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg-turbo' 'libmupdf' 'openjpeg2' 'openssl' 'zathura-git')
makedepends=('git' 'meson' 'ninja' 'appstream-glib')
conflicts=('zathura-pdf-mupdf' 'zathura-pdf-poppler' 'zathura-pdf-poppler-git')
provides=('zathura-pdf-mupdf')
source=("$pkgname::git+https://github.com/pwmt/zathura-pdf-mupdf.git#branch=develop"
        "0001-Remove-mupdf-linking-detection.patch")
sha256sums=('SKIP'
            '711a6cee7b34160c6a1d735a2ddb1e639ea575d500354e79fc1609306cbfde40')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  patch -p1 < ../0001-Remove-mupdf-linking-detection.patch
}

build() {
  cd "$pkgname"
  arch-meson build
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
