# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-nbopen
_name=${pkgname#python-}
pkgver=0.6
pkgrel=4
pkgdesc='Opens an Jupyter notebook in the best available server'
arch=('any')
url='https://pypi.org/project/nbopen'
license=('BSD')
depends=(python jupyter-notebook jupyter-nbformat 'shared-mime-info>=1.7')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
md5sums=('9af5f92c857e0fdc1054f22f053d998b')

build() {
	cd "$srcdir/${_name}-$pkgver"
	sed -i 's/distutils.core/setuptools/' setup.py
	sed -i '/package_data=package_data,/d' setup.py
	rm -rf nbopen/install_*.py
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1

	install -Dm755 {"$srcdir/${_name}-$pkgver/${_name}","$pkgdir/usr/share/applications"}/nbopen.desktop
	sed -i 's/{PYTHON} -m nbopen/\/usr\/bin\/nbopen/' $pkgdir/usr/share/applications/nbopen.desktop
	for s in $(ls "$srcdir/${_name}-$pkgver/${_name}/icons"| grep -o "[0-9]*x[0-9]*" -); do
		install -Dm644 "$srcdir/${_name}-$pkgver/${_name}/icons/ipynb_icon_${s}.png" "$pkgdir/usr/share/icons/hicolor/$s/mimetypes/application-x-ipynb+json.png"
	done
	install -Dm644 "$srcdir/${_name}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
