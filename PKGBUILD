# Maintainer: zeozeozeo <goonox35@proton.me>

pkgname=elpaudio-mini-git
pkgdesc="Simple audio player, written on GameBreaker (git version)"
pkgver=0.0.11.r0.gdbf5b80
pkgrel=1
arch=(x86_64)
url="https://codeberg.org/elpAudio/elpAudioMini"
license=(BSD-3-Clause)
depends=('gamebreaker-sdl3>=0.1.10b')
makedepends=(git make gcc)
provides=('elpaudio-mini')
conflicts=('elpaudio-mini')
source=("git+https://codeberg.org/elpAudio/elpAudioMini.git"
        "elpaudio-mini.desktop"
        "LICENSE")
sha256sums=('SKIP'
            'fa6a380c59b8a1afe997febe9b4e602d1104f061b7f70c60fd19d65d3c66e080'
            'b5622819086fbbc29c29908f39ca3c8cac50a8d8e1a823892d9ee25daac3007a')

pkgver() {
	cd "$srcdir/elpAudioMini"
	git describe --long --tags --abbrev=7 2>/dev/null |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/elpAudioMini"
	make CXX=g++
}

package() {
	cd "$srcdir/elpAudioMini"

	install -Dm755 elpaudio-mini "$pkgdir/usr/lib/elpaudio-mini/elpaudio-mini"
	cp -r resources themes visualisers "$pkgdir/usr/lib/elpaudio-mini/"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/elpaudio-mini" <<'EOF'
#!/bin/sh
if [ "$#" -eq 1 ] && [ "${1#-}" = "$1" ] && [ "${1#/}" = "$1" ]; then
	set -- "$PWD/$1"
fi
cd /usr/lib/elpaudio-mini || exit 1
exec ./elpaudio-mini "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/elpaudio-mini"

	install -Dm644 "$srcdir/elpaudio-mini.desktop" \
		"$pkgdir/usr/share/applications/elpaudio-mini.desktop"
	install -Dm644 resources/gb.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/elpaudio-mini.png"
	install -Dm644 "$srcdir/LICENSE" \
		"$pkgdir/usr/share/licenses/elpaudio-mini-git/LICENSE"
}
