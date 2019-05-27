pkgbase=ninfs
pkgname=(ninfs ninfs-gui)
pkgver=1.6
pkgrel=3
pkgdesc="FUSE filesystem Python scripts for Nintendo console files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/ninfs'
makedepends=('unzip')
options=(!strip)
_source=("${pkgbase}-${pkgver}-src.zip"{,.asc}"::${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}-src.zip"{.asc,''})
source=(${_source[@]:1:2})
sha256sums=('27a93b1ff26afe826611937b8806fc880ef5f3768320ca1f894525bc760cbe47'
            'SKIP')
validpgpkeys=('E6284E1064CC2199B304B68990725113CA578EAA')
noextract=("${pkgbase}-${pkgver}-src.zip")

build() {
	unzip "${srcdir}/${pkgbase}-${pkgver}-src.zip" -d "${srcdir}/ninfs"
	cd "${srcdir}/ninfs"
	python setup.py build
}

package_ninfs() {
	depends=("python>=3.6.1" "python-setuptools" "python-pycryptodomex" "fuse2" "openssl>=1.1")
	conflicts=("fuse-3ds" "fuse-3ds-git" "ninfs-git")
	replaces=("fuse-3ds")
	provides=("fuse-3ds")
	cd "${srcdir}/ninfs"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/ninfs"
	rm -rf "$pkgdir/usr/share"
}

package_ninfs-gui() {
	depends=("ninfs=$pkgver-$pkgrel" "python-setuptools" "python-appjar" "tk")
	conflicts=("fuse-3ds-gui-git" "fuse-3ds-gui" "ninfs-gui-git")
	replaces=("fuse-3ds-gui")
	provides=("fuse-3ds-gui")
	install="NinFSGUI.install"
	cd "${srcdir}/ninfs"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm -f "$pkgdir/usr/bin/mount_"*
	rm -rf "$pkgdir/usr/lib"
	PYTHONPATH="$pkgdir/usr:$PYTHONPATH" python -mninfs --install-desktop-entry "$pkgdir/usr/share"
}
