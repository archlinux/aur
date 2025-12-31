# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# Contributor: Jonathan Engber
pkgname=brlcad
pkgver=7.42.0
pkgrel=2
pkgdesc="Extensive 3D solid modeling system"
url="https://${pkgname}.org"
license=(LGPL-2.1-only BSD-3-Clause LicenseRef-BDL)
arch=(i686 x86_64)
depends=(gdal libgl libxft libxi)
makedepends=(cmake ninja git)
install="${pkgname}".install
_tag_name="rel-${pkgver//./-}"
source=(${pkgname}-${_tag_name}.tar.gz::https://github.com/BRL-CAD/${pkgname}/archive/refs/tags/${_tag_name}.tar.gz)
sha512sums=('b22b3cbb8f574f2be67516dbf5be03630505a15a706060d7ef528c3fdd53489a076dbc9f7b77251d1fb189e839636525dc78eff3ec2d9c4191ad1777cc3e56cc')
_build_config='Release'
_prefix="/opt/${pkgname}"

prepare() {
    sed -i 's/g_target/#g_target/' "${srcdir}/${pkgname}-${_tag_name}"/db/nist/CMakeLists.txt
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
        -DBRLCAD_GDAL=OFF \
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
