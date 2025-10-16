_pyname=pyexiv2
pkgname=python-${_pyname}
pkgver=2.15.5
pkgrel=1
pkgdesc="Read and write image metadata, including EXIF, IPTC, XMP, ICC Profile"
arch=('x86_64')
url="https://github.com/LeoHsiao1/pyexiv2"
license=('GPL3')
depends=('python>=3.8' 'exiv2')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'pybind11')
optdepends=()
conflicts=('python-exiv2')
source=("https://github.com/LeoHsiao1/pyexiv2/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('35b030ba0e7e65e788c4d37d11c93d3ef71911211bd9e6b0fa823b9a3935a6b3f823ea69e62f38a4a957127e1268e07d0c3925948900d07ed782213ac71a7b03')

build() {
  cd "${_pyname}-${pkgver}/${_pyname}/lib"
  g++ exiv2api.cpp -o exiv2api.so -std=c++11 -O3 -Wall -shared -fPIC `python -m pybind11 --includes` -l exiv2
  cd "${srcdir}/${_pyname}-${pkgver}"
  python -m build -wn
}

prepare() {
  cd "${_pyname}-${pkgver}"
  sed -i -e "s|ctypes.CDLL(os.path.join(lib_dir, 'libexiv2.so'))|ctypes.CDLL('libexiv2.so')|" "${_pyname}/lib/__init__.py"
  rm -r "${_pyname}"/tests
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
