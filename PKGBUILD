# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=vtex2
pkgver=0.1.2
pkgrel=1
pkgdesc="A VTF converter and editor"
arch=('x86_64')
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('gcc-libs' 'glibc' 'qt6-base')
makedepends=('cmake' 'git')
source=("git+$url.git"
		"vtflib::git+https://github.com/StrataSource/VTFLib.git"
		"fmtlib::git+https://github.com/fmtlib/fmt.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {vtflib,fmtlib};
	do
		git config submodule.external/$submodule.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build \
	-S $pkgname \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_GUI=1

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR=$pkgdir cmake --install build
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}