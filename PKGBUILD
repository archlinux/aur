# Maintainer:  entshuld < edgar [not at)] openmail @ cc >
_base=itk-strain
pkgname=python-${_base}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="N-dimensional ITK filters to estimate strain tensor fields from displacement fields or spatial transformations"
arch=('x86_64')
url="https://github.com/KitwareMedical/ITKStrain"
license=('APACHE')
groups=("itk")
depends=("python-itk" "expat" "fftw" "gdcm" "hdf5" "libjpeg-turbo"
         "libpng" "libtiff" "python" "vtk" "zlib")
makedepends=(python-build python-installer python-wheel)
# Check https://pypi.org/pypi/itk/json
source=(
  # From python get_source_url.py
  https://files.pythonhosted.org/packages/ca/1f/f52981cef9a1ea3de3c7fe2da24c550cebcd201ee1fdddda0c2d4d799d00/itk_strain-0.4.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
sha512sums=('98d598cd77f8da9bc4b7b4b66bc6d031d9419267550cb44992f33bdf57aa318843bad248b6c6818533a435f98001f88cce021067627ec5b36ee3b038524beaf9')

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
