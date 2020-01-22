# Maintainer: Daniel Flanagan <daniel@lyte.dev>

_gitname=htop
_githubuser=lytedev
_gitrepo=https://github.com/$_githubuser/$_gitname
_gitbranch=daniel/add-simple-vim-mode
_gitcommit=9ed47a2
_gitcommitcount=1081

pkgname=${_gitname}-vim-mode-git
pkgver=1081.9ed47a2
pkgrel=1
pkgdesc="lytedev's fork of the process monitor with a vim_mode setting"
arch=('x86_64')
url="git+$_gitrepo.git"
license=('GPL2')
depends=('ncurses')
makedepends=('git' 'python')
optdepends=('lsof: list open files for running process'
	'strace: attach to running process')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("${url}#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

prepare() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-unicode \
		--enable-openvz \
		--enable-vserver \
		--enable-cgroup
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
