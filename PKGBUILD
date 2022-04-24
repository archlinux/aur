# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ccx2paraview
pkgdesc="CalculiX to Paraview converter (frd to vtk/vtu)"
pkgver=3.0.0
pkgrel=1
arch=(x86_64)
url="https://github.com/calculix/${pkgname}"
license=(GPL3)
depends=(python-numpy vtk ffmpeg python-mpi4py fmt pdal glew ospray qt5-base openvr unixodbc liblas cgns adios2 libharu gl2ps)
makedepends=(python-setuptools nuitka)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7e12457d4e1b51a7d5dcf76ad0371bcd7d73c0ce0c82e196e6dcf8e7a0987c9642c0b47463750b63f43deeb103b46b4b76e39237e29f037b6969f6f52bacec86')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  python -m nuitka \
    --follow-imports \
    --python-flag=no_site \
    --remove-output \
    -o ${pkgdir}/usr/bin/${pkgname} \
    ${pkgname}/__init__.py
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
