# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
_commit=1aa784643081404783ce6494eb2fcaba99d8f6a5
pkgver=3.20.02
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('any')
url="https://github.com/electronicarts/EASTL"
license=('BSD' 'custom')
depends=()
makedepends=("cmake" "git")
source=(
  "${_pkgname}::git+https://github.com/electronicarts/EASTL.git#commit=${_commit}"
  "EABase::git+https://github.com/electronicarts/EABase.git"
  "eastl-fix-cmake-install.patch"
  "eastl-implement-allocator.patch"
  )

sha256sums=('SKIP'
            'SKIP'
            '47b65685430a7af2dec6bbf0a4c52e775f1ab23891f100c2db340bc57bd7b758'
            'cabc604045be6f901bc40c62f87e791af7a5f84b4857cfe1a149a653c8ed1166')

prepare() {
  cd ${_pkgname}
  cp -r ../EABase/* test/packages/EABase
  patch -p1 < ../eastl-fix-cmake-install.patch
  patch -p1 < ../eastl-implement-allocator.patch
}

build() {
  mkdir -p "${_pkgname}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DEASTL_BUILD_TESTS=OFF \
        -DEASTL_BUILD_BENCHMARK=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -B"${srcdir}/${_pkgname}/build" \
        -H"${srcdir}/${_pkgname}"

  cmake --build "${srcdir}/${_pkgname}/build"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${_pkgname}/build" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}"
}
