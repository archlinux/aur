# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.18.00
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('any')
url="https://github.com/electronicarts/EASTL"
license=('BSD' 'custom')
depends=()
makedepends=("cmake" "git")
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/electronicarts/EASTL/archive/refs/tags/${pkgver}.tar.gz"
  "EABase::git+https://github.com/electronicarts/EABase.git"
  "EAAssert::git+https://github.com/electronicarts/EAAssert.git"
  "EAMain::git+https://github.com/electronicarts/EAMain.git"
  "EAStdC::git+https://github.com/electronicarts/EAStdC.git"
  "EATest::git+https://github.com/electronicarts/EATest.git"
  "EAThread::git+https://github.com/electronicarts/EAThread.git"
  "eastl-fix-cmake-install.patch")

sha256sums=('a3c5b970684be02e81fb16fbf92ed2584e055898704fde87c72d0331afdea12b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '148b64dcb56cb7e2e7c2f37a2329b41f41c65b718fa794c13a0400965787e9f2')

prepare() {
  cd ${_pkgname}-${pkgver}
  cp -r ../EABase/* test/packages/EABase
  cp -r ../EAAssert/* test/packages/EAAssert
  cp -r ../EAMain/* test/packages/EAMain
  cp -r ../EAStdC/* test/packages/EAStdC
  cp -r ../EATest/* test/packages/EATest
  cp -r ../EAThread/* test/packages/EAThread
  patch -p1 < ../eastl-fix-cmake-install.patch
}

build() {
  mkdir -p "${_pkgname}-${pkgver}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DEASTL_BUILD_TESTS=OFF \
        -DEASTL_BUILD_BENCHMARK=OFF \
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
