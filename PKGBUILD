# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=antspy
pkgname=python-$_pkgname
pkgver=0.1.5
pkgrel=1
pkgdesc="Advanced Normalization Tools (ANTs) in Python"
arch=('any')
url="https://github.com/ANTsX/ANTsPy"
license=('apache')
depends=('python' 'python-numpy' 'python-webcolors' 'insight-toolkit')
optdepends=('python-plotly: surface rendering')
makedepends=('python-setuptools')
source=("https://github.com/ANTsX/ANTsPy/archive/v${pkgver}.tar.gz")
sha512sums=('0d6a9bc0d33c8969ce95beca08a771fda5bdf73837c78840ec405c89787656e2cb40174706b9981eb31f02c9fae9db818c58acbbfa3c2f903dc6b7b33befa3ed')

package() {
	cd "$srcdir/ANTsPy-$pkgver"

	export ITK_DIR="/usr"

	# Solve troubles with object instantiations 
	sed -i 's,typename TransformType::Pointer transformPointer,auto transformPointer,' \
		"${srcdir}/ANTsPy-0.1.5/ants/lib/LOCAL_antsTransform.h" \
		"${srcdir}/ANTsPy-0.1.5/ants/lib/LOCAL_readTransform.cxx"

	# Solve dumb bug
	sed -i '521s,void,LabelParameterMapType,' "ants/lib/antscore/antsAtroposSegmentationImageFilter.h"

	python setup.py install --optimize=1 --root="${pkgdir}"
}
