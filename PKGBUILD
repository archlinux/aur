# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>

_base=SU2
pkgname=${_base,,}
pkgver=7.5.1
pkgrel=1
pkgdesc="An Open-Source Suite for Multiphysics Simulation and Design"
url="https://${pkgname}code.github.io"
license=(LGPL2.1)
depends=(python-numpy python-mpi4py intel-oneapi-mkl)
makedepends=(swig git)
arch=(x86_64)
source=("${_base}-${pkgver}::git+https://github.com/${pkgname}code/${_base}.git#tag=v${pkgver}"
  "${pkgname}.sh")
sha512sums=('SKIP'
  '1c753dc503cc56f86f784071a18ae71dd6fbf64a6d7948275f65cfb1187a68dbff9c01729ffdde86147fb2b8ff25cb5aaa934ffda7d3aa1563313a033d650993')

prepare() {
  cd ${_base}-${pkgver}
  git submodule init && git submodule update
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
