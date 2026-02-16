# Maintainer: Atharv Gokule <gokuleatharv06@gmail.com>
pkgname='timepad'
pkgver=0.1.0alpha
pkgrel=1
pkgdesc="A minimal timer app for linux that mimicks the builtin windows clock app"
arch=('x86_64')
url="https://github.com/agokule/timepad"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3')
makedepends=('git' 'cmake' 'base-devel')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
install=
source=(
	'timepad::git+https://github.com/agokule/timepad.git#commit=5f48963d85d4ace05d57ab0c25122c1646b172f3'
	'git+https://github.com/ocornut/imgui.git'
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/${pkgname}"

	git submodule init
	git config submodule.dependencies/imgui.url "$srcdir/imgui"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname}"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DTIMEPAD_NOVENDORED=ON -DDISTRIBUTION_MODE=ON
	cmake --build build -- -j
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 ./build/Timepad "$pkgdir/usr/bin/Timepad"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/timepad/LICENSE"

	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Regular-400.otf -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Solid-900.otf   -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/MaterialSymbolsRounded-Regular.ttf     -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Roboto-Regular.ttf                     -t "$pkgdir/usr/share/timepad/fonts/"

	install -Dm644 ./assets/sound/freesound_community-kitchen-timer-87485.mp3 -t "$pkgdir/usr/share/timepad/sound/"

	install -Dm644 ./assets/icon.png -t "$pkgdir/usr/share/timepad/"

	install -Dm644 ./Timepad.desktop "$pkgdir/usr/share/applications/timepad.desktop"
}
