# Maintainer: Jan Tulak <jan@tulak.me>
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: James An <james@jamesan.ca>

pkgname=system-storage-manager-git
pkgver=1.4.r1.39278a5
pkgrel=1
pkgdesc='System Storage Manager (ssm) provides easy to use command line interface to manage your storage using various technologies like lvm, btrfs, encrypted volumes and possibly more - git checkout'
arch=('i686' 'x86_64')
url='https://system-storage-manager.github.io/'
license=('GPL2')
depends=('python' 'lvm2' 'e2fsprogs' 'xfsprogs' 'cryptsetup' 'btrfs-progs' 'device-mapper' 'dmraid' 'libpwquality')
makedepends=('python-sphinx' 'git')
provides=(storagemanager)
conflicts=(storagemanager)
source=('system-storage-manager::git+https://github.com/system-storage-manager/ssm.git')
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


build() {
    cd system-storage-manager
    python setup.py build
    make SPHINXBUILD=sphinx-build -C doc man
 }


package() {
   cd system-storage-manager

   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
