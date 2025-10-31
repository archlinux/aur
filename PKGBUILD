#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

_pkgname=alice-tools
pkgname=${_pkgname}-git
pkgver=0.13.0.r79.gd229d31
pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="This is a collection of command-line tools for viewing and editing file formats used in AliceSoft games"
arch=(x86_64)
url="https://github.com/nunuhara/alice-tools"
license=('GPL-2.0-only')
makedepends=(bison flex meson)
depends=(libpng libjpeg-turbo libwebp zlib qt5-base)
source=("${pkgname}::git+${url}.git"
	'galice.desktop')
sha256sums=('SKIP'
	    '8854d6ff3523f1209e781b04308d572b35d089f7c336d5e01cfdb8b45a5c6a54')
prepare () {
	cd "$srcdir/${pkgname}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname}"
	mkdir build
	meson setup build --prefix /usr
	ninja -C build
}

package() {
  cd "$srcdir/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install

  install -D -m 644 -T \
    "${srcdir}/galice.desktop" \
    "${pkgdir}/usr/share/applications/galice.desktop"
}
