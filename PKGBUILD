# Maintainer: wedjat <wedjat@protonmail.com>
pkgname=python-nipy
pkgver=0.4.2
pkgrel=1
pkgdesc="Analysis of structural and functional neuroimaging data."
arch=("x86_64")
url="http://nipy.org/nipy/"
license=('BSD 3-clause')
depends=('python' 'python-numpy>=1.6.0' 'python-scipy>=0.9.0' 'python-sympy>=0.7.0' 'python-nibabel>=1.2.0')
makedepends=('python-setuptools' 'cython') 	# ('python-sphinx>=1.0' 'python-numpydoc' 'python-matplotlib' 'python-texext' 'ipython')  # CAN'T BUILD DOCUMENTATION PROPERLY FOR SOME REASON
# checkdepends=('python-nose' 'python-mock')
optdepends=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/nipy/nipy/archive/$pkgver.tar.gz" "http://nipy.org/data-packages/nipy-templates-0.2.tar.gz" "http://nipy.org/data-packages/nipy-data-0.2.tar.gz")
md5sums=('f8162b019845c41b57b44d181763e85a'
         '8e7d607a3b83ba1216432907f0c954c8'
         'ea94bd420ce103d920cfcd0e3b551424')

prepare()
{
	# change "import ConfigParser" to "import configparser" (needed in python3)
	cd "$srcdir/nipy-data-0.2/"
	_old_line="$(sed '8q;d' setup.py)"
	_new_line="import configparser"
	sed --in-place "8 s/$_old_line/$_new_line/" setup.py
	
	_old_line="$(sed '23q;d' setup.py)"
	_new_line=$(echo "config = configparser.SafeConfigParser()")
	sed --in-place "23 s/$_old_line/$_new_line/" setup.py


	# change "import ConfigParser" to "import configparser" (needed in python3)
	cd "$srcdir/nipy-templates-0.2/"
	_old_line="$(sed '8q;d' setup.py)"
	_new_line="import configparser"
	sed --in-place "8 s/$_old_line/$_new_line/" setup.py

	_old_line="$(sed '23q;d' setup.py)"
	_new_line=$(echo "config = configparser.SafeConfigParser()")
	sed --in-place "23 s/$_old_line/$_new_line/" setup.py
	
}

build() 
{
	# buiding nipy package
	cd "$srcdir/nipy-$pkgver"
        make

	# building documentation (CAN'T MAKE IT WORKING so far)
#	python setup.py build_sphinx	

}

package() 
{
	cd "$srcdir/nipy-$pkgver"
	python setup.py install --root="$pkgdir"/ --optimize=1


	# building nipy data 
	cd "$srcdir/nipy-data-0.2/"
	python setup.py install --root="$pkgdir"/ --optimize=1	
	
	# building nipy templates

	cd "$srcdir/nipy-templates-0.2/"
	python setup.py install --root="$pkgdir"/ --optimize=1
}
