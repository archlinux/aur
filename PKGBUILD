# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
_base=SU2
pkgname=${_base,,}
pkgver=8.0.1
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://${pkgname}code.github.io"
license=(LGPL-2.1-or-later)
depends=(python-numpy python-mpi4py intel-oneapi-mkl)
makedepends=(swig python-setuptools git) # ninja
arch=(x86_64)
source=(${_base}-${pkgver}::git+https://github.com/${pkgname}code/${_base}.git#tag=v${pkgver}
  ${pkgname}.sh)
sha512sums=('83c82596ab2102f59be733c7cdc522efc4ba96c0d3197f4eeee457f8667fce6a5ce23d1777b823434eb56d83151b86e3b2bacf7863fd874af75786e174bfa3a8'
  '1c753dc503cc56f86f784071a18ae71dd6fbf64a6d7948275f65cfb1187a68dbff9c01729ffdde86147fb2b8ff25cb5aaa934ffda7d3aa1563313a033d650993')

prepare() {
  cd ${_base}-${pkgver}
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-${pkgver}
  ./meson.py build \
    --prefix=/usr \
    --buildtype=plain \
    -Dwith-mpi=enabled \
    -Denable-mkl=true \
    -Denable-autodiff=true \
    -Denable-directdiff=true \
    -Denable-mixedprec=true \
    -Denable-pastix=false \
    -Denable-openblas=true \
    -Denable-pywrapper=false \
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
