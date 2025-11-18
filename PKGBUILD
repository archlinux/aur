# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=process-map-git
pkgver=r9.bbe1145
pkgrel=1
pkgdesc='Visualize the virtual memory of a process'
arch=('x86_64')
url='https://github.com/arkanis/process-map'
license=('MIT')
depends=('libglvnd' 'libx11' 'noto-fonts' 'raylib')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/arkanis/process-map.git'
        'raylib.tar.gz::https://github.com/raysan5/raylib/archive/refs/tags/3.5.0.tar.gz'
        'process-map.diff')
noextract=('raylib.tar.gz')
sha256sums=('SKIP'
            '761985876092fa98a99cbf1fef7ca80c3ee0365fb6a107ab901a272178ba69f5'
            'SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cp "$srcdir/raylib.tar.gz" deps
	patch -p1 -i "$srcdir/${pkgname%-git}.diff"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 map "$pkgdir/usr/bin/process-map"
	mkdir -p "$pkgdir/usr/share/process-map"
	cp *.fs *.vs "$pkgdir/usr/share/process-map"
}
