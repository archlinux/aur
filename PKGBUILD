# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
_base=SU2
pkgname=${_base,,}
pkgver=8.1.0
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://${pkgname}code.github.io"
license=(LGPL-2.1-or-later)
depends=(python-numpy python-mpi4py intel-oneapi-mkl)
makedepends=(swig python-setuptools git)
arch=(x86_64)
source=(${_base}-${pkgver}::git+https://github.com/${pkgname}code/${_base}.git#tag=v${pkgver}
  ${pkgname}.sh)
sha512sums=('e0722722cb481b35c6477541576d45622daaebcbe251bfa4b4a391e2c86d84a05910c2516410174a0aaefb8a23c64be89a06cd1a4c71fe58fc0b7feb2b774975'
  '1c753dc503cc56f86f784071a18ae71dd6fbf64a6d7948275f65cfb1187a68dbff9c01729ffdde86147fb2b8ff25cb5aaa934ffda7d3aa1563313a033d650993')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/su2code/SU2/issues/2364
  # sed -i 's/sys.path\[0\] + os.path.sep + \"ninja\"/\"\/usr\/bin\/ninja\"/' preconfigure.py
  # sed -i "27 a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ '-Wno-error=implicit-function-declaration'," meson.build
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-${pkgver}
  ./preconfigure.py --no-codi --no-medi --no-opdi --no-mpp --no-coolprop --no-mel --no-mlpcpp
  ./meson.py build \
    --prefix=/usr \
    --buildtype=plain \
    -Denable-autodiff=false \
    -Denable-directdiff=false \
    -Denable-pywrapper=false \
    -Dwith-mpi=enabled \
    -Denable-mkl=false \
    -Denable-openblas=false \
    -Denable-cgns=false \
    -Denable-pastix=false \
    -Denable-mpp=false \
    -Denable-mixedprec=false \
    -Denable-mlpcpp=false \
    -Denable-gprof=false \
    -Denable-tests=false
  ./ninja -C build
}

package() {
  cd ${_base}-${pkgver}
  DESTDIR="${pkgdir}" ./meson.py install -C build
  install -dm755 "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"
  cd "${pkgdir}/usr/bin"
  mv ${_base} -t "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"
  install -Dm755 "${srcdir}/${pkgname}.sh" -t "${pkgdir}/etc/profile.d"
}
