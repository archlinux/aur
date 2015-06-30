# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=system-storage-manager-git
pkgver=0.3.r1.g83f908a
pkgrel=1
pkgdesc='System Storage Manager (ssm) provides easy to use command line interface to manage your storage using various technologies like lvm, btrfs, encrypted volumes and possibly more - git checkout'
arch=('i686' 'x86_64')
url='http://sourceforge.net/p/storagemanager/home/Home/'
license=('GPL')
depends=('python2' 'lvm2' 'e2fsprogs' 'xfsprogs' 'cryptsetup' 'btrfs-progs' 'device-mapper' 'dmraid')
makedepends=('git')
provides=(storagemanager)
conflicts=(storagemanager)
source=('system-storage-manager::git://git.code.sf.net/p/storagemanager/code')
sha256sums=('SKIP')

pkgver() {
	cd system-storage-manager/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd system-storage-manager/

	sed -i "s/'AUTHORS', //" setup.py
}

package() {
	cd system-storage-manager

	python2 setup.py install --root="${pkgdir}"
}

