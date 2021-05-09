# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_components=(
    'itk'
    'itk-io'
    'itk-segmentation'
    'itk-filtering'
    'itk-core'
    'itk-registration'
    'itk-numerics'
)
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"
pkgname=python-itk-bin
pkgver=5.2.0.post2
pkgrel=1
pkgdesc="Open-source toolkit for multidimensional image analysis"
arch=('x86_64')
url='https://itk.org/'
license=('Apache')
depends=('python-numpy')
provides=('python-itk')
conflicts=('python-itk')
makedepends=('python-pip')
sha256sums=('8b877cdd9079060ca99db6d8cdab08f8b1475f9ee16755176c334e663c95ffb8'
            '5a9f85c8f8edcefc07c30271ef22ff2bbffcde30607a634e232c18937c9b84c4'
            '37a86a170e8ceadc36dd8eeba01e6b163f08e7f872af571c2fd16c97cd5d59c9'
            'e670f6a4f0ce65af12fc44342eb43d515eb57861fea9010456e9017dd05d319f'
            '06b25b0bd37f2fba5ca41d99c52805e649e4079b8fe1b786cdf2865d07bc72e0'
            '6723a3921f823d188381fc621e9b07c28e7adf6cf9d2b092f323086ab78f59ed'
            '11f1d5faf043f8fd4053c52dbf1db15f4d1ddc05707faf7424e1421c94e284a1')

for _name in "${_components[@]}"; do
	source+=("https://files.pythonhosted.org/packages/$_py/${_name::1}/${_name}/${_name/-/_}-$pkgver-${_py}-${_py}-manylinux2014_x86_64.whl")
done

noextract=("${source[@]##*/}")

package() {
	cd "$srcdir"

	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/ITK"
}
