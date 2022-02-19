pkgname=nbopen
pkgver=0.6
pkgrel=4
pkgdesc='Opens an Jupyter notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=(python jupyter 'shared-mime-info>=1.7')
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0aa53525a6ec3de403635dd91bab7607c451a67b275492947d6934963902ffa1')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	local desktopfile="$pkgdir/usr/share/applications/nbopen.desktop"
	install -Dm755 nbopen/nbopen.desktop "$desktopfile"
	sed -i 's/{PYTHON}/python3/' "$desktopfile"
	
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "nbopen/icons/ipynb_icon_${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/mimetypes/application-x-ipynb+json.png"
	done
	
	rm -rf "$pkgdir/usr/lib/python"*'/site-packages/nbopen/'{application-x-ipynb+json.xml,icons,nbopen.desktop}
}
