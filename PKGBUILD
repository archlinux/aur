# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=shvspy-git
_gitname=shvspy
pkgver=r508.21cc190
pkgrel=1
pkgdesc='Qt GUI tool for shvbroker administration and browsing'
url='https://github.com/silicon-heaven/shvspy'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL3')
depends=('necrolog' 'libshv' 'glibc' 'gcc-libs' 'qt6-base' 'qt6-networkauth' 'qt6-svg')
makedepends=('git' 'cmake')
conflicts=('shvspy' 'shvspy-git')
provides=('shvspy')
source=('git+https://github.com/silicon-heaven/shvspy.git'
		'bash-completion-shvspy'
)
md5sums=('SKIP'
		 'f681f0f02001b80f964ce640a41b5c27'
)

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DSHVSPY_USE_LOCAL_NECROLOG=ON \
	-DSHVSPY_USE_LOCAL_LIBSHV=ON \
	-DSHVSPY_USE_QT6=ON

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
	install -Dm644 bash-completion-shvspy "${pkgdir}/usr/share/bash-completion/completions/shvspy"
}
