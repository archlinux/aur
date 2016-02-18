# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Marco Melletti <melletti.marco@gmail.com>
pkgname=uarm-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v0.5.3.r26.3600cec
pkgrel=2
pkgdesc="arm7tdmi based computer emulator with debugging tools"
arch=('any')
url="http://mellotanica.github.io/uARM/"
license=('GPL')
groups=()
depends=('qt5-declarative' 'gcc' 'make' 'boost')
makedepends=('git')
replaces=()
backup=('etc/default/uarm')
options=()
install=
source=('git+https://github.com/mellotanica/uARM.git#branch=master')
noextract=()
md5sums=('SKIP')

_gitdir='uARM'

pkgver() {
	cd "$_gitdir"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$_gitdir"

	./configure

	qmake-qt5 elf2uarm.pro
	make
	qmake-qt5 mkdev.pro
	make
	qmake-qt5 qarm.pro
	make

	./compile
}

package() {
	cd "$_gitdir"
	./install.sh -b "$pkgdir"
}
