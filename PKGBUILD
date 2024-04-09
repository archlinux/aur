# Maintainer:  entshuld < edgar [not at)] openmail @ cc >
_base=itk-elastix
pkgname=python-${_base}-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="ITK (Python) interface to elastix, a toolbox for rigid and nonrigid registration of images."
arch=('x86_64')
url="https://github.com/InsightSoftwareConsortium/ITKElastix"
license=('APACHE')
groups=("itk")
depends=("python-itk" "expat" "fftw" "gdcm" "hdf5" "libjpeg-turbo"
         "libpng" "libtiff" "python" "vtk" "zlib")
makedepends=(python-build python-installer python-wheel)
# Check https://pypi.org/pypi/itk/json
source=(
  # From python get_source_url.py
  https://files.pythonhosted.org/packages/17/95/5ef5487c8e730a3a977dda5a7088c8e1a06be9fc0b62c2b656502878c401/itk_elastix-0.19.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
)
sha512sums=('0cd7e0ee2f7950c5e0bead0fc6274ac4c3ecb1ff10e01f79a41e4e0cd36ac1ff298d5d793c2dc4a2544460fbd88771f055fddcc1621f0b8642534c101a0cad47')
provides=("python-${_base}"
          "python-${_base//-/}")
conflicts=("python-${_base}"
           "python-${_base//-/}")


# # This is the standard way of building. There is no std in ITK
# build() {
#   cd "$_base-$pkgver"
#   python -m build --wheel --no-isolation
# }
#
# package() {
#   cd "$_base-$pkgver"
#   python -m installer --destdir="$pkgdir" dist/*.whl
# }

noextract=("${source[@]##*/}")
_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
_py="cp${_python_version//./}"

package() {
  cd "$srcdir"

  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ./*.whl
  python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/ITK"
}

# vim:set ts=2 sw=2 et:
