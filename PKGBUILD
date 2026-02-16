# Maintainer: Atharv Gokule <gokuleatharv06@gmail.com>
pkgname='timepad-git'
pkgver=0.1.0.alpha.r0.g5f48963
pkgrel=1
pkgdesc="A minimal timer app for linux that mimicks the builtin windows clock app"
arch=('x86_64')
url="https://github.com/agokule/timepad"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3')
makedepends=('git' 'cmake' 'base-devel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=(
	'timepad::git+https://github.com/agokule/timepad.git'
	'git+https://github.com/ocornut/imgui.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	git submodule init
	git config submodule.dependencies/imgui.url "$srcdir/imgui"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DTIMEPAD_NOVENDORED=ON -DDISTRIBUTION_MODE=ON
	cmake --build build -- -j
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 ./build/Timepad "$pkgdir/usr/bin/Timepad"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/timepad-git/LICENSE"

	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Regular-400.otf -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Font\ Awesome\ 7\ Free-Solid-900.otf   -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/MaterialSymbolsRounded-Regular.ttf     -t "$pkgdir/usr/share/timepad/fonts/"
	install -Dm644 ./assets/fonts/Roboto-Regular.ttf                     -t "$pkgdir/usr/share/timepad/fonts/"

	install -Dm644 ./assets/sound/freesound_community-kitchen-timer-87485.mp3 -t "$pkgdir/usr/share/timepad/sound/"

	install -Dm644 ./assets/icon.png -t "$pkgdir/usr/share/timepad/"

	install -Dm644 ./Timepad.desktop "$pkgdir/usr/share/applications/timepad.desktop"
}
