# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.21.12
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('any')
url="https://github.com/electronicarts/EASTL"
license=('BSD' 'custom')
depends=()
makedepends=("cmake" "git")
source=(
  "https://github.com/electronicarts/EASTL/archive/${pkgver}.tar.gz"
  "EABase::git+https://github.com/electronicarts/EABase.git"
  "eastl-implement-allocator.patch"
  )

sha256sums=('2a4d77e5eda23ec52fea8b22abbf2ea8002f38396d2a3beddda3ff2e17f7db2e'
            'SKIP'
            'cabc604045be6f901bc40c62f87e791af7a5f84b4857cfe1a149a653c8ed1166')

prepare() {
  cd ${_pkgname}-${pkgver}
  cp -r ../EABase/* test/packages/EABase
  patch -p1 < ../eastl-implement-allocator.patch
}

build() {
  mkdir -p "${_pkgname}-${pkgver}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DEASTL_BUILD_TESTS=OFF \
        -DEASTL_BUILD_BENCHMARK=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -B"${srcdir}/${_pkgname}-${pkgver}/build" \
        -H"${srcdir}/${_pkgname}-${pkgver}"

  cmake --build "${srcdir}/${_pkgname}-${pkgver}/build"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${_pkgname}-${pkgver}/build" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}"
}
