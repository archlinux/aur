# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# Maintainer: Versus Void <chaoskeeper &commat; mail FULL STOP ru>
# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>
# Contributor: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=redis-desktop-manager
pkgver=2022.0
pkgrel=1
pkgdesc='RESP.app - Open source cross-platform Redis Desktop Manager based on Qt 5'
arch=('x86_64')
url="https://resp.app"
license=('GPL3')
depends=(
	'qt5-base'
	'qt5-imageformats'
	'qt5-tools'
	'qt5-declarative'
	'qt5-quickcontrols'
	'qt5-quickcontrols2'
	'qt5-charts'
	'qt5-graphicaleffects'
	'qt5-svg'
	'libssh2'
	'python')
makedepends=('git' 'gcc' 'make' 'cmake')
conflicts=('redis-desktop-manager-bin')
source=("rdm::git+https://github.com/uglide/RedisDesktopManager.git#tag=$pkgver"
	'rdm.desktop')
sha256sums=('SKIP'
            '9ca6cfe0fc1a050552ec2fa009a2d517de3b049ff6f379f0fda849e4dbca3f68')

prepare() {
	cd rdm/
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/rdm/3rdparty/lz4/build/cmake"
	cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DLZ4_BUNDLED_MODE=ON . && make
	cd "$srcdir/rdm/3rdparty/zstd/build/cmake"
	cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release . && make libzstd_static
	cd "$srcdir/rdm/3rdparty/snappy"
	cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release . && make
	cd "$srcdir/rdm/3rdparty/brotli"
	cmake -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release . && make
	cd "$srcdir/rdm/src"
	lrelease resp.pro
	qmake VERSION="$pkgver" && make
}

package() {
	_instdir="$srcdir/rdm/bin/linux/release"
	_bindir="$pkgdir/usr/share/$pkgname/bin"

	mkdir -p "${_bindir}"
	mkdir "$pkgdir/usr/share/licenses"
	mkdir "$pkgdir/usr/share/pixmaps"
	mkdir "$pkgdir/usr/share/applications"

	install -Dm644 "$srcdir/rdm/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${_instdir}/resp" "${_bindir}/rdm"
	install -Dm644 "$srcdir/rdm/src/resources/images/rdm.png" "$pkgdir/usr/share/pixmaps/rdm.png"
	install -Dm644 "$srcdir/rdm.desktop" "$pkgdir/usr/share/applications/rdm.desktop"

	mkdir "$pkgdir/usr/bin"
	ln -s "/usr/share/$pkgname/bin/rdm" "$pkgdir/usr/bin/rdm"
}
