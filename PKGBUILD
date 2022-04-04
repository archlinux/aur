# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=fedit2-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=2020.08
pkgrel=1
pkgdesc="Formation editor for Robocup 2D Simulation made by Helios"
arch=('any')
url="https://github.com/helios-base/fedit2"
license=('GPL')
groups=('rcss')
depends=('librcsc-git')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('fedit2-git::git+https://github.com/helios-base/fedit2.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	# Git, tags available
	grep AC_INIT configure.ac | cut -d ',' -f 2 | sed 's/ \[//g' | sed 's/\]//g'
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	find . -name "*.cpp" | xargs sed -i 's/boost::shared/std::shared/g'
	find . -name "*.h" | xargs sed -i 's/boost::shared/std::shared/g'
	find . -name "*.h" | xargs sed -i 's/boost::weak/std::weak/g'
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	make DESTDIR="$pkgdir/" install
}
