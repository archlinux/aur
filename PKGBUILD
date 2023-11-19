# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=quiltix
_name=QuiltiX
pkgver=0.5.0
pkgrel=1
pkgdesc="A graphical node editor to edit, and author MaterialX based materials of 3D assets"
arch=('x86_64')
url="https://github.com/PrismPipeline/QuiltiX"
license=('Apache')
arch=('any')
depends=(usd
		materialx
		python-qt.py
		python
		pyside2
		python-pyqt5
		)
makedepends=(git)
source=(git+$url.git#tag=v$pkgver
		git+https://github.com/manuelkoester/NodeGraphQt.git#branch=develop
		$pkgname.desktop
		$pkgname)
sha256sums=('SKIP'
            'SKIP'
            'fb5049cbae6eefd067c50e3ae3aa85e45b7b94da10e6af267bdfe5f317e74eee'
            '15aec531df344870fe6a50bece2403a62a17aefcb7d7a2f70d5be584b8e469ee')

build() {
	cd NodeGraphQt
	python -m build --wheel --no-isolation

	cd ../$_name
	python -m build --wheel --no-isolation
}

package() {
	python -m installer --destdir=${pkgdir} ${srcdir}/NodeGraphQt/dist/*.whl
	python -m installer --destdir=${pkgdir} ${srcdir}/$_name/dist/*.whl

	cp -f ${srcdir}/$pkgname  ${pkgdir}/usr/bin/$pkgname

	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	install -Dm644 ${srcdir}/$_name/{LICENSE,NOTICE,THIRD-PARTY.md} $_/
	install -Dm644 ${srcdir}/$_name/src/$_name/resources/icons/$pkgname-logo-x.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/$pkgname.png
	install -Dm755 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
	mkdir -p ${pkgdir}/usr/share/doc
	mv ${pkgdir}/usr/lib/python3.11/site-packages/examples $_/$_name
}
