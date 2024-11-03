pkgname=nbopen
pkgver=0.7
pkgrel=1
pkgdesc='Opens an Jupyter notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=(python jupyter-notebook jupyter-server jupyter-nbformat 'shared-mime-info>=1.7' hicolor-icon-theme)
makedepends=(python-flit-core python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1c80ed2d80da0245270b4de9d2a1a44b19e55cfa17348ac45ee3d6f076303503')

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
