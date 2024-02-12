# Maintainer:  entshuld < edgar [not at)] openmail @ cc >
_base=itk-elastix
pkgname=python-${_base}-bin
pkgver=0.17.1
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
  https://files.pythonhosted.org/packages/77/b8/0efb8a251eeb8e1d756e5bfe4b772493246b01f1babf2a6d72c90944971e/itk_elastix-0.17.1-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
)
sha512sums=('ec6037b59c0bdd97d52767ccec7029b26894eb01774a4c7379545ca038a0482adcf878769564cb243230dedb2aca031bebda2f1a231a70ee362b82ce7dff5414')
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
