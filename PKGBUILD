# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf-git
pkgrel=1
pkgver=0.4.0.r1.g2c5c24b
pkgdesc="PDF support for zathura (mupdf backend)"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura-pdf-mupdf"
license=('custom')
depends=('zathura-git' 'gumbo-parser' 'jbig2dec' 'openjpeg2')
makedepends=('git' 'meson' 'ninja' 'libmupdf')
conflicts=('zathura-pdf-mupdf' 'zathura-pdf-poppler')
provides=('zathura-pdf-mupdf')
source=("$pkgname::git+https://git.pwmt.org/pwmt/zathura-pdf-mupdf.git#branch=develop"
        "0001-Remove-mupdf-linking-detection.patch")
sha256sums=('SKIP'
            'f09e9ea91193fc225b82e4779ad8b0a5440f5938b69d19286d9c467aefa7ace3')

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
