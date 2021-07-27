# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=dragonstone-git
pkgver=r433.8e96806
pkgrel=1
pkgdesc="A simple GTK Gopher/Gemini client"
arch=('x86_64')
url="https://gitlab.com/baschdel/dragonstone"
license=('BSD')
depends=('gtk3' 'python3')
makedepends=('cmake' 'git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	mv com.gitlab.baschdel.dragonstone.desktop.in dragonstone.desktop.in
	sed -i '/Exec/c\Exec=/usr/bin/dragonstone %U' dragonstone.desktop.in
	sed -i 's/com.gitlab.baschdel.//' meson.build
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
