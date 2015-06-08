# Maintainer: Raimar Buehmann (raimar)

pkgname=lxtask-git
pkgver=0.1.6.r402.20150117
pkgrel=1
pkgdesc="Task manager and system monitor for LXDE"
arch=('i686' 'x86_64')
license=('GPL2')
groups=('lxde-git')
depends=('gtk2')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'pkgconfig' 'git' 'intltool')
provides=('lxtask')
conflicts=('lxtask')
replaces=('lxtask' 'lxtask-git=20120117-1')
url="http://lxde.org/"
source=(
	$pkgname::git+http://git.lxde.org/git/lxde/lxtask.git
#	$pkgname::git+git://git.lxde.org/git/lxde/lxtask.git
	Added-key-binding-Del-to-terminate-and-Shift-Del-to-kill-task.patch
	Changed-default-button-for-terminate-to-Yes.patch
)
sha256sums=(
	'SKIP'
	'34d35d40522d9758cb875cd40eaf5d4afeedffaafb7ca0efedbc431a163fa55b'
	'23e7ae15e32622fffdac883beb49a1745478e05f8089a78a64670eea9aa753c0')

_gitroot=$pkgname

pkgver() {
	# remove ".r*.*" from package version
	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
	cd $_gitroot
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add ".r*.*" from package version
	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
}

prepare() {
	cd $_gitroot
	patch -Np1 -i ../Added-key-binding-Del-to-terminate-and-Shift-Del-to-kill-task.patch
	patch -Np1 -i ../Changed-default-button-for-terminate-to-Yes.patch
}

build() {
	cd $_gitroot
	msg "Starting make..."
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd $_gitroot
	make DESTDIR="$pkgdir" install
}
