# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-reqif'
_name=${pkgname#python-}
pkgver='0.0.42'
pkgrel=3
pkgdesc="Python library for ReqIF format. ReqIF parsing and unparsing."
url="https://github.com/strictdoc-project/reqif"
depends=('python' 'python-jinja' 'python-lxml' 'python-xmlschema')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9afc4201517c20eb3f4d2f0454860744d989cd13fde11216f441f7e1f2bb9ffa')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	#install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl

	# not sure why these end up in the wrong spot...
	local _site=$(python -c "import site; print(site.getsitepackages()[0])")
	mv \
		"${pkgdir}${_site}/LICENSE" \
		"${pkgdir}${_site}/README.md" \
		"${pkgdir}${_site}/pyproject.toml" \
			"${pkgdir}${_site}/${_name}"
}
