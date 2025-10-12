# Maintainer: András Wacha <awacha@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=python-bumps
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="Data fitting with uncertainty analysis"
arch=(any)
url="https://github.com/bumps/bumps"
license=('LicenseRef-Public Domain')
depends=(python
         python-aiohttp
         python-blinker
         python-cloudpickle
         python-dill
         python-h5py
         python-matplotlib
         python-mpld3
         python-msgpack
         python-numpy
         python-scikit-learn
         python-scipy
         python-socketio
         python-wxpython)
makedepends=(
             npm
             git
             python-build
             python-installer
             python-setuptools
             python-versioningit)
#             python-sphinx)
checkdepends=(python-nose python-plotly)
source=("$_name::git+https://github.com/${_name}/${_name}.git#tag=v${pkgver}"
	"bumps.patch")
sha256sums=('394b8bc0456770e43e0987f0801c978bfe472a71a0aa1fe225fbc7e83ba2c223'
            '398828e729a72bcfe0bdc7f6e8bbe6ca8e89700cd5f9da023e843c3551eddeea')

prepare() {
	cd ${_name}
	# https://github.com/bumps/bumps/issues/139
	# https://github.com/bumps/bumps/pull/140
	#patch -p1 <../bumps.patch
}

build() {
	cd ${_name}
	python -m build --wheel --no-isolation
#	(cd doc && make html)
#	(cd doc && make pdf)
}

check() {
	cd ${_name}
	python test.py
}

package() {
	cd ${_name}
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	python -m installer --destdir="$pkgdir" dist/*.whl
	cd "$pkgdir/$site_packages/bumps/webview/client"
	npm install
	npm run build
	rm -r node_modules/
#	python -m bumps.webview.build_client
	mkdir -p ${pkgdir}/usr/share/licenses/python-bumps
	cp ${srcdir}/${_name}/LICENSE.txt ${pkgdir}/usr/share/licenses/python-bumps/license.txt
#	mkdir -p ${pkgdir}/usr/share/doc/python-bumps
#	cp ${srcdir}/${_name}/doc/_build/html ${pkgdir}/usr/share/doc/python-bumps -R
}
