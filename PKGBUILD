_pyname=pyexiv2
pkgname=python-${_pyname}
pkgver=2.15.4
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
b2sums=('44771e2034a77199c1d6fbbb64e3c961c831951a7005ceff2dfbd3eaaed7f9b4e3a5b44546beb4d9e4d37e2f63a10aa7a9ff646f083806e98c53ec2dffcae995')

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
