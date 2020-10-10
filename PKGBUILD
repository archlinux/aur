# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

_pkgname=devilutionX
pkgname=devilutionx
pkgver=1.0.2
pkgrel=1
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('graphite' 'libsodium' 'sdl2_mixer' 'sdl2_ttf')
makedepends=('cmake' 'gcc-libs')
install="$pkgname".install
options=('strip')
source=("https://github.com/diasurgical/devilutionX/archive/$pkgver.tar.gz")

prepare() {
	cd "$srcdir/${_pkgname}-$pkgver"
	if [ ! -d build ]; then
		mkdir build
	fi
}

build() {
	cd "$srcdir/${_pkgname}-$pkgver/build"
	cmake .. \
		-DPIE=ON \
		-DBINARY_RELEASE=ON \
		-DTTF_FONT_PATH=\"/usr/share/fonts/truetype/CharisSILB.ttf\" \
		-DGIT_TAG="$pkgver"
	make INSTALL_ROOT="$pkgdir"
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"

	# Install and link binary
	install -vDm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"

	# Install font
	install -Dm644 Packaging/resources/CharisSILB.ttf \
		"$pkgdir/usr/share/fonts/truetype/CharisSILB.ttf"

	# Install icons
	install -Dm644 Packaging/cpi-gamesh/Devilution.png \
		"$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Install desktop file
	install -Dm664 Packaging/fedora/$pkgname.desktop -t \
		"$pkgdir/usr/share/applications"

	# Install license
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	# Install font license
	install -Dm644 Packaging/resources/LICENSE.CharisSILB.txt -t \
		"$pkgdir/usr/share/licenses/$pkgname"
}

md5sums=('4deac1025350eec0b36569af9dc3cd5c')
