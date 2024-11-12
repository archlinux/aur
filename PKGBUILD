# Maintainer: envolution
pkgname=brlcad
pkgver=7.40.2
pkgrel=1
pkgdesc='An extensive 3D solid modeling system.'
url='https://brlcad.org'
license=('LGPL' 'BSD' 'custom:BDL')
arch=('i686' 'x86_64')
depends=('gdal' 'libgl' 'libxft' 'libxi')
makedepends=('cmake' 'ninja')
options=(!strip !debug)
install="${pkgname}.install"
_tag_name="rel-${pkgver//./-}"
source=(
  'build.patch'
  'clipper.core.h.patch'
  'slacon_idamax_isamax.patch'
  "https://github.com/BRL-CAD/${pkgname}/releases/download/${_tag_name}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=('74e8dc6bec7e83359439dc05d9f53105f487544ae61af19fca5658cc8f0d56d9'
            '9fb1f3670d3fc9a5566548ea56f7f51945eb2b9f782d6556adca4ddf111f12d9'
            '66ea42c548d50e203590afce317849766b91477da4e14cff494605288a22fb18'
            'da444502029791d2c074fc3826b8c32fec9afd7e762d19cd9797279ad691b809')

_build_config='Release'
_prefix="/opt/${pkgname}"

prepare() {
  mkdir -p build
  git clone -b "${_tag_name}" https://github.com/BRL-CAD/bext.git build/bext
  pwd
  ls -la
  patch -p0 -i ../clipper.core.h.patch
  patch -p0 -i ../slacon_idamax_isamax.patch
  patch -p0 -i ../build.patch -d $pkgname-${pkgver}

  cmake \
    -G Ninja \
    -S "${srcdir}/${pkgname}-${pkgver}" \
    -B "${srcdir}/build" \
    -Wno-dev \
    "-DCMAKE_INSTALL_PREFIX=${_prefix}" \
    "-DCMAKE_BUILD_TYPE=${_build_config}" \
    -DBUILD_STATIC_LIBS=OFF \
    -DBRLCAD_ENABLE_COMPILER_WARNINGS=OFF \
    -DBRLCAD_ENABLE_STRICT=OFF \
    -DBRLCAD_FLAGS_DEBUG=OFF \
    -DBRLCAD_BUNDLED_LIBS=BUNDLED \
    -DBRLCAD_GDAL=OFF \
    -DBRLCAD_PNG=OFF \
    -DBRLCAD_REGEX=OFF \
    -DBRLCAD_ZLIB=OFF \
    -DBRLCAD_ENABLE_OPENGL=ON \
    -DBRLCAD_ENABLE_QT=ON \
    -DBRLCAD_ENABLE_TCL=OFF

}

build() {
  cmake --build "${srcdir}/build" --config "${_build_config}"

  echo \
    "export PATH=\"\$PATH:${_prefix}/bin\"" \
    >"${srcdir}/build/${pkgname}.sh"
}

package() {
  cmake \
    --install "${srcdir}/build" \
    --config "${_build_config}" \
    --prefix "${pkgdir}${_prefix}"

  install \
    -D \
    --mode=u=rw,go=r \
    "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/build/share/doc/legal/"{bdl,bsd}.txt

  install \
    -D \
    --mode=u=rw,go=r \
    "--target-directory=${pkgdir}/etc/profile.d" \
    "${srcdir}/build/${pkgname}.sh"
}
