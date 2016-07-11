# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Ning Humbert <galaxy0419@gmail.com>
pkgname=easydrcom-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=08f4404
pkgrel=1
pkgdesc="3rd Party Dr.COM Client for HITwh"
arch=('i686' 'x86_64')
url="https://github.com/coverxit/EasyDrcom"
license=('Apache')
depends=(libpcap)
makedepends=('git' 'boost') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("EasyDrcom")
options=("!buildflags")
source=('git+https://github.com/coverxit/EasyDrcom.git'
        'EasyDrcom.conf'
	'patch.txt')
md5sums=('SKIP'
         'ed15888b134b18d885d81567542042a4'
	 '1dba42fe14d02ec886d8023f835fe21e')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

_gitname=EasyDrcom

pkgver() {
	cd $_gitname
	echo $(git describe --always | sed 's/-/./g')
}

prepare() {
	cd $_gitname/EasyDrcom
	patch -p1 -i $srcdir/patch.txt
}

build() {
	cd $_gitname/EasyDrcom
	g++ -DLINUX -Os -s -std=c++0x -o EasyDrcom md5.c main.cpp -lpcap -lpthread
}

package() {
	mkdir -p $pkgdir/etc
	cp EasyDrcom.conf $pkgdir/etc/
	cd $_gitname/EasyDrcom
	mkdir -p $pkgdir/usr/bin
	cp EasyDrcom $pkgdir/usr/bin/
}

