# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('python-unidic')
_name=${pkgname#python-}
pkgver=1.1.0.unidic3.1.0
_ver=${pkgver%.unidic3.1.0}
pkgrel=4
pkgdesc="UniDic for Contemporary Written Japanese packaged for use with pip (with UniDic 3.1.0)"
url="https://github.com/polm/unidic"
license=('MIT' 'BSD-3-CLAUSE')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$_ver.tar.gz"
        "https://cotonoha-dic.s3-ap-northeast-1.amazonaws.com/unidic-3.1.0.zip")
b2sums=('16c541d583b03fbb5448aa1be86a79016532df7d3382c25c130b978457976b68f85e6319e57dffdc94a436ca6927e224a81af47b345f758d1021575a9b7aa78a'
        'becbaf46ac8c210b47461843e8daa2b07681664881d7cb849e4825f37569101e605015eb975390aec123f525550d4eeed4843f811c71a0977da1aa5431b616a9')
arch=('any')
depends=('python' 'python-requests' 'python-tqdm' 'python-wasabi<1.0.0' 'python-plac<2.0.0')
makedepends=('python-setuptools')

build(){
	cd "${_name}-${_ver}"
	python setup.py build
}

package(){
	cd "${_name}-${_ver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# Not in pypi tarball unlike unidic-lite
	#install -Dm644 LICENSE.unidic "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.unidic"

	cd "${srcdir}"/unidic
	find . -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/lib/python3.10/site-packages/unidic/dicdir/{}" \;
	echo "# This is a dummy file." > "${pkgdir}/usr/lib/python3.10/site-packages/unidic/dicdir/mecabrc"
}
