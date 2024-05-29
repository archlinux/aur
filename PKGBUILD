# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgbase=jpterm
pkgname=('jpterm' 'python-txl')
pkgver=0.2.12
pkgrel=1
url="https://davidbrochart.github.io/jpterm/"
license=('MIT')
arch=('any')
depends=('python>=3.10' 'python-rich-click' 'python-asphalt' 'python-asyncio_extras' 'jupyterlab>=4' 'jupyter-collaboration>=2')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-hatchling')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/davidbrochart/$pkgbase/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7c8863db4004c721a8334e49055b4ce6f3af970ab98e346723eb6ed1cf6dc71')

_plugins=(
	"cell"     "editors"       "image_viewer"  "kernel"    "local_contents"  "local_terminals"  "notebook_editor"  "remote_contents"  "remote_terminals"  "text_editor"  "widgets"
	"console"  "file_browser"  "jpterm"        "launcher"  "local_kernels"   "markdown_viewer"  "notebook_viewer"  "remote_kernels"   "terminal"          "text_viewer"
)

build() {
	cd "$pkgbase-$pkgver"
	python -m build --wheel --no-isolation

	cd txl
	python -m build --wheel --no-isolation

	cd ../plugins
	for plugin in "${_plugins[@]}"; do
		cd $plugin
		python -m build --wheel --no-isolation
		cd ..
	done
}

package_jpterm() {
	pkgdesc="Jupyter in the terminal."
	depends=("python-txl=$pkgver")

	cd "$pkgbase-$pkgver"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}

package_python-txl() {
	pkgdesc="The plugin system for jpterm"
	depends=('python-asphalt' 'python-textual' 'python-pycrdt' 'python-jupyter-ydoc' 'python-pycrdt' 'python-anyio' 'python-textual_imageview' 'python-ypywidgets_textual')

	cd "$pkgbase-$pkgver"/txl
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	cd ../plugins
	for plugin in "${_plugins[@]}"; do
		cd $plugin
		python -m installer --destdir="\$pkgdir/" dist/*.whl
		cd ..
	done

}
