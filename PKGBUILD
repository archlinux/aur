# Maintainer: bemxio <bemxiov at protonmail dot com>

_pkgname=jumpcutter
pkgname="python-${_pkgname}"

pkgdesc="Automatically jump-cut silent parts of your videos using Python"

pkgver=0.1.6
pkgrel=5

arch=(any)

url="https://github.com/emkademy/${_pkgname}"
license=(MIT)

depends=(python-moviepy python-numpy python-tqdm)
makedepends=(python-build python-installer python-poetry-core python-setuptools python-wheel)

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz" 
		0001-add-type-annotations.patch
		0002-fix-arrays-to-stack-must-be-passed-as-a-sequence.patch
		0003-migrate-from-moviepy-v1.x-to-v2.x.patch)
md5sums=(375c45a6fa9e6a8aec0594699ccf8722 4f79e95ef8cd94cfd9c2790da9051aeb 26946f68a6a7b5ccf61bef1a8a9935d5 2f87703685722c86656256e5bde8c2fc)

prepare() {
	# move to the source directory
	cd "${_pkgname}-${pkgver}"

	# apply neccessary patches
	patch -p1 -i ../0001-add-type-annotations.patch
	patch -p1 -i ../0002-fix-arrays-to-stack-must-be-passed-as-a-sequence.patch
	patch -p1 -i ../0003-migrate-from-moviepy-v1.x-to-v2.x.patch
}

build() {
	# move to the source directory
	cd "${_pkgname}-${pkgver}"

	# build the package
	python -m build --wheel --no-isolation
}

package() {
	# move to the source directory
	cd "${_pkgname}-${pkgver}"

	# copy the files over to the package directory
	python -m installer --destdir="${pkgdir}" dist/*.whl

	# bundle the license and docs inside the package
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}