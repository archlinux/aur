pkgbase=ninfs
pkgname=(ninfs ninfs-gui)
pkgver=2.0
pkgrel=1
pkgdesc="FUSE filesystem Python scripts for Nintendo console files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/ninfs'
makedepends=('python-setuptools')
options=(!strip)
#_source=("${pkgbase}-${pkgver}-src.zip"{,.asc}"::${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}-src.zip"{.asc,''})
source=("ninfs-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89403ebb535d2a5b7ce0f0b954c95a93c03f0cc31907452e36260744a0e3e926')

build() {
	cd "${srcdir}/ninfs-${pkgver}"
	python setup.py build
}

package_ninfs() {
	depends=("python>=3.8" "python-setuptools" "python-pycryptodomex" "python-pyctr" "python-pypng" "python-haccrypto" "fuse2" "openssl>=1.1")
	conflicts=("fuse-3ds" "fuse-3ds-git" "ninfs-git")
	replaces=("fuse-3ds")
	provides=("fuse-3ds")
	cd "${srcdir}/ninfs-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/ninfs"
	rm -f "$pkgdir/usr/bin/ninfsw"
	rm -rf "$pkgdir/usr/share"
}

package_ninfs-gui() {
	depends=("ninfs=$pkgver-$pkgrel" "python-setuptools" "tk")
	conflicts=("fuse-3ds-gui-git" "fuse-3ds-gui" "ninfs-gui-git")
	replaces=("fuse-3ds-gui")
	provides=("fuse-3ds-gui")
	install="NinFSGUI.install"
	cd "${srcdir}/ninfs-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/mount_"*
	rm -rf "$pkgdir/usr/lib"
	PYTHONPATH="$pkgdir/usr:$PYTHONPATH" python -mninfs --install-desktop-entry "$pkgdir/usr/share"
}
