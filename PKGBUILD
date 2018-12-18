# Maintainer: NamedKitten <kitteh@namedkitten.pw>
pkgname=kittehplayer
pkgver=r365.1dea7df
pkgrel=1
pkgdesc="A YouTube-like video player based on Qt, QML and libmpv."
arch=('x86_64' 'armv7h')
url="https://github.com/NamedKitten/KittehPlayer"
license=('MPL2')
depends=('qt5-svg' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'mpv' 'qt5-graphicaleffects' 'libx11' 'libxext' 'qt5-x11extras')
optdepends=(
	'mpv-vapoursynth: for vapoursynth support.'
	'youtube-dl: for remote video streaming'
	'ttf-roboto: default font recommended for a youtube-like UI'
)
makedepends=('git' 'cmake' 'ruby-ronn')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/NamedKitten/kittehplayer')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make $MAKEFLAGS
}

package() {
	cd "$srcdir/$pkgname/build"
	ronn -r --manual=KittehPlayer --organization="NamedKitten" ../DOCS.md
	mkdir -p $pkgdir/usr/share/man/man1/
	cp ../DOCS $pkgdir/usr/share/man/man1/KittehPlayer.1
	make DESTDIR="$pkgdir/" install
}
