# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='torchac'
pkgname="python-pytorch-${_name}"
pkgver=0.9.3
pkgrel=1
pkgdesc="Fast Entropy Coding in PyTorch"
url="https://github.com/fab-jul/${_name}"
depends=('python-pytorch')
makedepends=('python-setuptools')
license=('GPL3')
arch=('x86_64')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")	
sha256sums=('2f3d11583430a82f71b1b507734f5f841bb51d08e0d7d9d9eaf0b122c82ea905')

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
	echo "{\"version\": \"${pkgver}\", \"used\": false}" > bin/version.json
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	COMPILE_CUDA=auto python setup.py build
	# Actually missing the c++ which will get built locally on the first
	# "python -c import torchac". Pretty dirty.
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	mkdir "${pkgdir}/${site_packages}/torchac/backend/"
	cp "${srcdir}/${_name}-${pkgver}/torchac/backend/torchac_backend.cpp" "${pkgdir}/${site_packages}/torchac/backend/"
}

