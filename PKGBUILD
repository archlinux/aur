# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=terri-fried-git
pkgver=r34.463aa1e
pkgrel=12
pkgdesc="A multi-platform C++ game made for Ludum Dare 46"
arch=('x86_64')
url="https://github.com/polymarsdev/terri-fried"
license=('custom')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme' 'bash' 'glibc')
makedepends=('git' 'gcc')
source=("$pkgname::git+https://github.com/polymarsdev/terri-fried" 
	'terri-fried'
	'terri-fried.desktop')
sha512sums=('SKIP'
            '2f95712b853703111aba74ee9f2411c750bdbca973216eb7f2c06302ed9dbcbbd31b2139ff310ac0d140660092b60456b3b275fe1e92db58705063edf6a11d6c'
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
	cd "$pkgdir"
	cd "$srcdir/$pkgname/linux"
	install -Dm755 terri-fried "$pkgdir/opt/terri-fried/terri-fried"
	cp -r resources "$pkgdir/opt/terri-fried/resources"
	install -Dm755 "$srcdir/terri-fried" "$pkgdir/usr/bin/terri-fried"
	install -Dm644 "$srcdir/$pkgname/linux/resources/egg.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/terri-fried.png"
	install -Dm644 "$srcdir/terri-fried.desktop" "$pkgdir/usr/share/applications/terri-fried.desktop"
}
