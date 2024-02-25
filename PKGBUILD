pkgbase=ninfs-git
pkgname=(ninfs-git ninfs-gui-git)
pkgver=2.0.r0.g017935b
pkgrel=1
pkgdesc="FUSE filesystem Python scripts for Nintendo console files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/ninfs'
makedepends=('python-setuptools' 'git')
options=(!strip)
source=("ninfs::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd ninfs
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "${srcdir}/ninfs"
	python setup.py build
}

package_ninfs-git() {
	depends=("python>=3.8" "python-setuptools" "python-pycryptodomex" "python-pyctr" "python-pypng" "python-haccrypto" "fuse2" "openssl>=1.1")
	conflicts=("fuse-3ds-git" "fuse-3ds" "ninfs")
	replaces=("fuse-3ds-git" "fuse-3ds")
	provides=("fuse-3ds-git" "fuse-3ds" "ninfs=$pkgver-$pkgrel")
	cd "${srcdir}/ninfs"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/ninfs"
	rm -f "$pkgdir/usr/bin/ninfsw"
	rm -rf "$pkgdir/usr/share"
}

package_ninfs-gui-git() {
	depends=("ninfs-git=$pkgver-$pkgrel" "python-setuptools" "tk")
	conflicts=("fuse-3ds-gui-git" "fuse-3ds-gui" "ninfs-gui")
	replaces=("fuse-3ds-gui-git" "fuse-3ds-gui")
	provides=("fuse-3ds-gui-git" "fuse-3ds-gui" "ninfs-gui=$pkgver-$pkgrel")
	install="NinFSGUI.install"
	cd "${srcdir}/ninfs"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/mount_"*
	rm -rf "$pkgdir/usr/lib"
	PYTHONPATH="$pkgdir/usr:$PYTHONPATH" python -mninfs --install-desktop-entry "$pkgdir/usr/share"
}
