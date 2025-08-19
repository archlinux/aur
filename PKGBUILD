# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgdir=ANGRYsearch
_pkgname=angrysearch
pkgname=${_pkgname}-git
pkgver=1.0.4
pkgrel=1
pkgdesc='Linux file search, instant results as you type'
url='https://github.com/DoTheEvo/ANGRYsearch'
# This won't work, just yet.
#_checksum="$(git ls-remote ${url} master | awk '{print $1}')"
arch=('any')
license=('GPL-2.0-only')
depends=('python'
		 'python-gobject'
		 'python-pyqt5'
		 'libxkbcommon-x11'
		 'xdg-utils'
		 'xdotool')
makedepends=('git'
			 'python-build'
			 'python-installer'
			 'python-setuptools'
			 'python-wheel'
			 'sudo')
source=("git+https://github.com/DoTheEvo/ANGRYsearch.git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
sha1sums=("SKIP")
#sha1sums=("$_checksum")

pkgver() {
    cd $srcdir/$_pkgdir
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgdir
	python -m build --no-isolation --wheel
}

package() {
	cd $srcdir/$_pkgdir
	python -m installer --destdir="$pkgdir" dist/*.whl
	
	local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	mv "$pkgdir/$_site_packages"/usr/* "$pkgdir/usr/"

	chmod +x install.sh
	sudo -E ./install.sh
	
	rmdir "$pkgdir/$_site_packages"/usr
}
