# Contributor: Bernhard Walle <bernhard@bwalle.de>
# Contributor: Clovis Fabricio <arch.nosklo@0sg.net>
# Contributor: Christopher Krooß <c.krooss@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
# AUR Category: devel
pkgname=tortoisehg
pkgver=7.2.2
pkgrel=2
pkgdesc="Graphical tools for Mercurial"
arch=('any')
url="https://foss.heptapod.net/mercurial/tortoisehg/thg"
license=("GPL")
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=('python' 'mercurial>=6.0' 'python-qscintilla-qt6' 'python-iniparse' 'qt6-svg' 'python-pyqt6')
optdepends=('python-pygments: syntax highlighting'
            'python-nautilus: Python binding for Nautilus components')
source=("https://www.mercurial-scm.org/release/tortoisehg/targz/tortoisehg-$pkgver.tar.gz"
	"https://foss.heptapod.net/mercurial/tortoisehg/thg/-/commit/ff01aa72ea781c0dc689a9fa82931b15afccedb8.diff"
	)

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i "$srcdir"/ff01aa72ea781c0dc689a9fa82931b15afccedb8.diff
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 "contrib/mergetools.rc" "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
	install -Dm 644 "contrib/thg.desktop" "${pkgdir}/usr/share/applications/thg.desktop"
	install -Dm 644 "icons/svg/thg_logo.svg" "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

	# already provided by hg
	cd "$pkgdir/usr/lib/"
	rm -f python*/site-packages/hgext3rd/__init__.py
	rm -f python*/site-packages/hgext3rd/__init__.pyc
	rm -rf python*/site-packages/hgext3rd/__pycache__/
}

sha256sums=('2812d76e2436a7e9af30cd3f536d844304a3d8d20eda2daf234661985f207383'
            'afb421b452fc7b6aad6ffea4da4f51d29f1ffe5a86c3fa1e18e25f2830e3ae95')
