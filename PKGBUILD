pkgbase=fuse-3ds-git
pkgname=(fuse-3ds-git fuse-3ds-gui-git)
pkgver=1.2.r16.gea9dc98
pkgrel=1
pkgdesc="FUSE Filesystem Python scripts for Nintendo 3DS files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/fuse-3ds'
makedepends=('python-setuptools' 'python-pycryptodomex' 'git')
options=(!strip)
source=("git+https://github.com/ihaveamac/fuse-3ds.git")
sha256sums=('SKIP')

pkgver() {
	cd fuse-3ds
	git describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "${srcdir}/fuse-3ds"
	python setup.py build
}

package_fuse-3ds-git() {
	depends=("python>=3.6.1" "python-pycryptodomex" "fuse2")
	conflicts=(fuse-3ds)
	provides=("fuse-3ds=$pkgver-$pkgrel")
	cd "${srcdir}/fuse-3ds"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/fuse3ds"
}

package_fuse-3ds-gui-git() {
	depends=("fuse-3ds-git=$pkgver-$pkgrel" "python-appjar")
	conflicts=(fuse-3ds-gui)
	provides=("fuse-3ds-gui=$pkgver-$pkgrel")
	install="Fuse3DSGUI.install"
	cd "${srcdir}/fuse-3ds"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/mount_"*
	rm -r "$pkgdir/usr/lib"
	PYTHONPATH="$pkgdir/usr:$PYTHONPATH" python -mfuse3ds --install-desktop-entry "$pkgdir/usr/share"
}
