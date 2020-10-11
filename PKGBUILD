# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

_pkgname=devilutionX
pkgname=devilutionx
pkgver=1.1.0
pkgrel=1
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('graphite' 'libsodium' 'sdl2_mixer' 'sdl2_ttf' 'ttf-charis-sil')
makedepends=('cmake' 'gcc-libs')
install="$pkgname".install
options=('strip')
source=("https://github.com/diasurgical/devilutionX/archive/$pkgver.tar.gz")

prepare() {
	cd "$srcdir/${_pkgname}-$pkgver"
	if [ ! -d build ]; then
		mkdir build
	fi
	sed -i "s/\/usr\/share\/fonts\/truetype/\/usr\/share\/fonts\/ttf-charis-sil/g" \
		SourceX/DiabloUI/fonts.cpp
}

build() {
	cd "$srcdir/${_pkgname}-$pkgver/build"
	cmake .. \
		-DPIE=ON \
		-DBINARY_RELEASE=ON \
		-DTTF_FONT_DIR=\"/usr/share/fonts/ttf-charis-sil\" \
		-DTTF_FONT_NAME=\"CharisSIL-B.ttf\" \
		-DVERSION_NUM="$pkgver"

	make INSTALL_ROOT="$pkgdir" -j$(nproc)
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"

	# Install and link binary
	install -vDm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"

	# Install icons
	install -Dm644 Packaging/cpi-gamesh/Devilution.png \
		"$pkgdir/usr/share/pixmaps/$pkgname.png"

	# Install desktop file
	install -Dm664 Packaging/fedora/$pkgname.desktop -t \
		"$pkgdir/usr/share/applications"

	# Install license
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

md5sums=('76e7f5219e8f58ee71ab671b13ce3139')
