# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=nitchplusplus-git
pkgver=r119.650bbe6
pkgrel=1
pkgdesc="A fast system information fetch tool"
arch=('x86_64' 'aarch64')
url="https://github.com/clamsfeel2/nitchplusplus"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'git' 'gcc>=14' 'tomlplusplus')
provides=('nitchplusplus')
conflicts=('nitchplusplus')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd nitchplusplus
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd nitchplusplus
	sed -i '/^# Create config dir/,/^)$/d' CMakeLists.txt
}

build() {
	cmake -S nitchplusplus -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd nitchplusplus
	install -Dm644 config/example_config.toml "$pkgdir/usr/share/nitchplusplus/config.toml"
	install -Dm644 .assets/ascii.txt "$pkgdir/usr/share/nitchplusplus/ascii.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/nitchplusplus/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
