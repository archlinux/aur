# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=terri-fried-git
pkgver=r34.463aa1e
pkgrel=14
pkgdesc="A multi-platform C++ game made for Ludum Dare 46"
arch=('x86_64')
url="https://github.com/polymarsdev/terri-fried"
license=('LicenseRef-Custom')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme' 'bash' 'glibc')
makedepends=('git' 'gcc' 'pkg-config')
source=("$pkgname::git+https://github.com/polymarsdev/terri-fried" 
	'terri-fried'
	'terri-fried.desktop')
sha512sums=('SKIP'
            '3cd1eab4e20cb5bb726b70028b5cfe9ade8c30cedd6976b725bc0721bf9a05f7b98f58ad5265e008748d767640d8cef1a7908d6a53fcafd6559a2189f3315bbd'
            'cb435d7f26523d1af1182cd5f4af010c45cb4630133e04155ff806ca500c9e6882ae14ab0319b062aa3686bf72fd9e8569f449eef62571c8e080d7998b9100be')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname/linux"
	sed -i 's/22050/44100/g' main.cpp
}

build() {
	cd "$srcdir/$pkgname/linux/"
	CXX=g++
	$CXX -c -o player.o $CXXFLAGS player.cpp
	$CXX -c -o platform.o $CXXFLAGS platform.cpp
	$CXX -c -o main.o $CXXFLAGS main.cpp
	$CXX -o terri-fried player.o platform.o main.o $CXXFLAGS $LDFLAGS $(pkg-config --cflags --libs sdl2 SDL2_image SDL2_ttf SDL2_mixer) -lm
}

package() {
	cd "$srcdir/$pkgname/linux"
	install -Dm755 terri-fried "$pkgdir/usr/lib/terri-fried/terri-fried"
	cp -r resources "$pkgdir/usr/lib/terri-fried/resources"
	install -Dm755 "$srcdir/terri-fried" "$pkgdir/usr/bin/terri-fried"
	install -Dm644 "$srcdir/$pkgname/linux/resources/egg.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/terri-fried.png"
	install -Dm644 "$srcdir/terri-fried.desktop" "$pkgdir/usr/share/applications/terri-fried.desktop"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/" && cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt" -<<EOF
Feel free to create a fork of this repository if you want to port the game to additional platforms! The code can also be used for any other noncommercial purposes.
EOF
}
