# Maintainer: Victor Engmark <victor.engmark@gmail.com>
pkgname=fgit-git
pkgver=1.0.2.r0.360dc3f
pkgrel=1
pkgdesc="Run git commands on multiple repositories with a single command"
arch=('any')
url='https://github.com/l0b0/fgit'
license=('GPL3')
depends=('bash' 'git' 'ncurses')
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'git+https://github.com/l0b0/fgit.git'
    'git+https://github.com/l0b0/make-includes.git'
    'git+https://github.com/l0b0/shell-includes.git'
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git config submodule.mysubmodule.url $srcdir/make-includes
    git config submodule.mysubmodule.url $srcdir/shell-includes
    git submodule update
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="${pkgdir}/usr" DESTDIR="/usr" install
}
