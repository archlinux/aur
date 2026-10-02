# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=hnterm
pkgver=0.4
pkgrel=1
pkgdesc="Hacker News in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ggerganov/hnterm"
license=('MIT')
depends=('curl' 'ncurses' 'gcc-libs')
makedepends=('cmake' 'ninja' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver" 'imtui::git+https://github.com/ggerganov/imtui.git#commit=203b2320c02949e40aab442f86a1487b34c89470' 'imgui::git+https://github.com/ggerganov/imgui.git#commit=4e0ce6f1df52fa40b105c96820eec60b4fb2a658')
sha256sums=('3d9a1e122d6c66ed7f1e32e0d0190341d587237fc2d4849d9f1cd44155fc7344'
            '6b26f485936afb9463533747b98329e1c23f9d2050239dea44fb87ef1b0b56d5'
            'adf12b252f4b1d9402c751f2dbf0285b5811c5dd4e130288eca1a8007901d0da')

prepare() {
	cd "$pkgname"
	sed -i '0,/#include/s//#include <cstdint>\n#include/' src/hn-state.h
	git submodule init
	git config submodule.third-party/imtui.url "$srcdir/imtui"
	git -c protocol.file.allow=always submodule update
	(
		cd third-party/imtui
		git submodule init
		git config submodule.third-party/imgui/imgui.url "$srcdir/imgui"
		git -c protocol.file.allow=always submodule update
	)
}

build() {
	cmake -S "$pkgname" -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	install -Dm755 build/bin/hnterm "$pkgdir/usr/bin/hnterm"
	install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
