# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.2.1
pkgrel=1
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3799fbb714b9c45856856073a1988474ea34ca7bcfca2b21ff4470cb305bdbe5fb2681d53802088690831321f5410da0a76759c0e28150ab67cb3f655c65f68d')

# prepare() {
#
# }

build() {
	cd "$pkgname-$pkgver"
	local generator=$(\
		pacman -Qq ninja 1>/dev/null 2>/dev/null \
		&& echo 'Ninja' \
		|| echo 'GNU Makefiles' )

	mkdir -p build-Release
	cd build-Release
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .. -G "$generator"
	cmake --build . --config Release
}

check() {
	cd "$pkgname-$pkgver"
	build-Release/test/run-tests.sh
}

package() {
	cd "$pkgname-$pkgver"
	local license_dir="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$license_dir"
	cp LICENSE "$license_dir/."
	cmake --install build-Release
}
