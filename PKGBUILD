# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-qtconsole-git
pkgver=4.8.0.dev0.1683.efa3302
pkgrel=1
pkgdesc='Qt-based console for Jupyter with support for rich media output'
arch=(any)
url='https://pypi.python.org/pypi/qtconsole'
license=(BSD)
depends=(
	python-ipykernel python-jupyter_core python-jupyter_client
	python-traitlets python-pygments python-pyzmq
	qt5-svg python-pyqt5 python-sip)
conflicts=(python-qtconsole)
provides=(python-qtconsole)
makedepends=(python-setuptools)
source=("git://github.com/jupyter/qtconsole.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/qtconsole"
	printf "%s.%s.%s" \
		"$(python -c 'from qtconsole._version import __version__; print(__version__)')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/qtconsole"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	cd examples
	# FS#47046 fix .desktop icon
	local _python3="$(readlink /usr/bin/python3)"
	sed -i "s|^Icon=.*$|Icon=/usr/lib/$_python3/site-packages/qtconsole/resources/icon/JupyterConsole.svg|" jupyter-qtconsole.desktop
	install -Dm644 jupyter-qtconsole.desktop "$pkgdir/usr/share/applications/jupyter-qtconsole.desktop"
}

