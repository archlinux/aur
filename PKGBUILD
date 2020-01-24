# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-nbopen
pkgver=0.6
pkgrel=3
pkgdesc='Opens an Jupyter notebook in the best available server'
arch=('any')
url='https://pypi.org/project/nbopen'
license=('BSD')
depends=(jupyter-notebook 'shared-mime-info>=1.7')
_pkgname=${pkgname//python-}
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9af5f92c857e0fdc1054f22f053d998b')

build() {
	cd "${_pkgname}-${pkgver}"
	sed -i 's/distutils.core/setuptools/' setup.py
	sed -i '/package_data=package_data,/d' setup.py
	rm -rf nbopen/install_*.py
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir"

	install -Dm755 {"$srcdir/${_pkgname}-${pkgver}/${_pkgname}","$pkgdir/usr/share/applications"}/nbopen.desktop
	sed -i 's/{PYTHON} -m nbopen/\/usr\/bin\/nbopen/' $pkgdir/usr/share/applications/nbopen.desktop

	for s in $(ls "$srcdir/${_pkgname}-${pkgver}/${_pkgname}/icons"| grep -o "[0-9]*x[0-9]*" -); do
		install -Dm644 "$srcdir/${_pkgname}-${pkgver}/${_pkgname}/icons/ipynb_icon_${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}/mimetypes/application-x-ipynb+json.png"
	done

	install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
