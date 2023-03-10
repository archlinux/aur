pkgname=brlcad
pkgver=7.34.0
pkgrel=1
pkgdesc='An extensive 3D solid modeling system.'
url='https://brlcad.org'
license=('LGPL' 'BSD' 'custom:BDL')
arch=('i686' 'x86_64')
depends=('libgl' 'libxft' 'libxi')
makedepends=('cmake' 'ninja')
install="${pkgname}.install"
_tag_name="rel-${pkgver//./-}"
source=(
    'build.patch'
    "https://github.com/BRL-CAD/${pkgname}/archive/refs/tags/${_tag_name}.tar.gz")
sha256sums=(
    'SKIP'
    'bdaff958dee7b39ca66c777bb889878a707a10130ef76c47928870ff98d08c1e')


_build_config='Release'
_prefix="/opt/${pkgname}"


prepare() {
    patch \
        --strip=0 \
        "--directory=${srcdir}/${pkgname}-${_tag_name}" \
        "--input=${srcdir}/build.patch"
}


build() {
    cmake \
        -G Ninja \
        -S "${srcdir}/${pkgname}-${_tag_name}" \
        -B "${srcdir}/build" \
        -Wno-dev \
        "-DCMAKE_INSTALL_PREFIX=${_prefix}" \
        "-DCMAKE_BUILD_TYPE=${_build_config}" \
        -DBUILD_STATIC_LIBS=OFF \
        -DBRLCAD_ENABLE_COMPILER_WARNINGS=OFF \
        -DBRLCAD_ENABLE_STRICT=OFF \
        -DBRLCAD_FLAGS_DEBUG=OFF \
        -DBRLCAD_BUNDLED_LIBS=BUNDLED \
        -DBRLCAD_PNG=OFF \
        -DBRLCAD_REGEX=OFF \
        -DBRLCAD_ZLIB=OFF \
        -DBRLCAD_ENABLE_OPENGL=ON \
        -DBRLCAD_ENABLE_QT=OFF

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
