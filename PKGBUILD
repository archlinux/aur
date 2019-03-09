pkgbase=fuse-3ds
pkgname=(fuse-3ds fuse-3ds-gui)
pkgver=1.3.1
pkgrel=1
pkgdesc="FUSE Filesystem Python scripts for Nintendo 3DS files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/fuse-3ds'
makedepends=('python-setuptools' 'python-pycryptodomex' 'unzip')
options=(!strip)
source=("fuse-3ds-${pkgver}-src.zip::https://github.com/ihaveamac/fuse-3ds/releases/download/v${pkgver}/fuse-3ds-${pkgver}-src.zip")
sha256sums=('8243f64fdabb536b07e9a4fbf152a35e9350f58ae8c49938c115d607a46911d0')
noextract=("fuse-3ds-${pkgver}-src.zip")

build() {
	unzip "${srcdir}/fuse-3ds-${pkgver}-src.zip" -d "${srcdir}/fuse-3ds"
	cd "${srcdir}/fuse-3ds"
	python setup.py build
}

package_fuse-3ds() {
	depends=("python>=3.6.1" "python-pycryptodomex" "fuse2")
	cd "${srcdir}/fuse-3ds"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/fuse3ds"
	rm -rf "$pkgdir/usr/share"
}

package_fuse-3ds-gui() {
	depends=("fuse-3ds=$pkgver-$pkgrel" "python-appjar" "tk")
	cd "${srcdir}/fuse-3ds"
	install="Fuse3DSGUI.install"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/mount_"*
	rm -r "$pkgdir/usr/lib"
	PYTHONPATH="$pkgdir/usr:$PYTHONPATH" python -mfuse3ds --install-desktop-entry "$pkgdir/usr/share"
}
