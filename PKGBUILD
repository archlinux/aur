# Maintainer: Simon Repp <simon@fdpl.io>

pkgname=faircamp-git
pkgver=r529.369d9c6
pkgrel=1
pkgdesc='A static site generator for audio producers'
arch=('x86_64')
license=('AGPL3')
# TODO: Dependency on openslide and poppler-glib is unclear,
#       technically these are optional dependencies of libvips
#       and faircamp does not require them either (no TIFF or SVG/PDF
#       related operations with libvips), but at least two people have
#       reported runtime errors related to libvips without them.
depends=('ffmpeg' 'libvips>=8.13.3' 'openslide' 'opus' 'poppler-glib')
makedepends=('cmake' 'git' 'rust')
url='https://simonrepp.com/faircamp'
conflicts=('faircamp')
provides=('faircamp')
source=('faircamp-git::git+https://codeberg.org/simonrepp/faircamp.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --features libvips --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
