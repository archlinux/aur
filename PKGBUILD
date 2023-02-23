# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtf-git
pkgver=r19.fd0c317
pkgrel=2
epoch=1
pkgdesc="QImageIO plugin to load Valve Texture Files in QT 5 Programs (View VTF in QT 5 Programs)"
arch=('x86_64')
url="https://github.com/panzi/qvtf"
license=('GPL')
depends=('libvtflib-git' 'qt5-base')
makedepends=('cmake' 'git')
source=("git+https://github.com/HurricanePootis/qvtf.git")
source=("git+$url.git"
	"headers.patch"
	"cmake.patch")
sha256sums=('SKIP'
            'ff2c3005ed51545227110776df21da425056a85263b0fa96f0318e76747ea7d9'
            'e62d82387d2fd9ddb0b3d1568e54f4f9167b7503affe6359f94605777e1aad2e')

pkgver() {
 cd "$srcdir/qvtf"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/qvtf"
	patch -p1 < ../headers.patch
	patch -p1 < ../cmake.patch
}

build() {
	cd "$srcdir"

	cmake -S qvtf -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr"

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgdir/usr/lib"
	mv qt5 qt
}
