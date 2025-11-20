# Maintainer: Chris Duncan <chris@codecow.com>
# Contributor: Paul Hentschel (hpmachining)
# Contributor: greyltc

pkgname=cbang
pkgver=8.5.4
_pkgver="bastet-v${pkgver}"
_pkgname="${pkgname}-${_pkgver}"
pkgrel=1
pkgdesc='Library for cross-platform C++ development.'
arch=('x86_64')
url='https://github.com/CauldronDevelopmentLLC/cbang'
license=('LGPL-2.1-only')
depends=(
  'bzip2'
  'expat'
  'libevent'
  'libyaml'
  're2'
  'sqlite'
  'v8-r'
  'zlib'
)
makedepends=(
  'scons'
)
checkdepends=(
  'python'
  'python-six'
)
optdepends=(
  'mariadb-libs: MariaDB database support'
)
source=(
  "${_pkgname}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
  '0001_v8_disable_checks.patch'
  '0003_ScriptOrigin.patch'
  '0004_URI_contains.patch'
  '0005_as_string.patch'
  '0006_utf8length.patch'
)
sha256sums=(
  '5ac8218a2ba0f584fba17ef46218860c580229c6194810f73c3390bc1e8f2611'
  '23cb01aa43a03db26953eead4f7008f5f30bb7e22e6a671edcb27711f91d77a2'
  '9c2ea45a4e472f6676e9389448c62336876407b5b853fb4b8034b0df1c7c02d6'
  '88fbd57ed4f33d314bda1fee97a6fc58ca21d2db8db764211bc85729d7b846f1'
  '927ac60d93d777672089e114899b81a6c6dd2c31c8d51b4802369e2a9ef4de2a'
  '8a10a0294452b497cf5fa8e7c909632eec62e2020e10f460c78b0b26a1a16684'
)

prepare() {
  cd "${_pkgname}"

  patch -p1 -i '../0001_v8_disable_checks.patch'
  patch -p1 -i '../0003_ScriptOrigin.patch'
  patch -p1 -i '../0004_URI_contains.patch'
  patch -p1 -i '../0005_as_string.patch'
  patch -p1 -i '../0006_utf8length.patch'
}

build() {
  cd "${_pkgname}"
  scons \
    ccflags="-DV8_ENABLE_SANDBOX -DV8_TARGET_ARCH_X64" \
    cxxstd="c++20" \
    disable_local="bzip2 expat libevent libyaml re2 sqlite3 zlib"
}

check() {
  cd "${_pkgname}/tests"

  scons \
    cxxstd="c++20" \
    disable_local="bzip2 expat libevent libyaml re2 sqlite3 zlib"

  python './testHarness'
}

package() {
  cd "${_pkgname}"

  scons install \
    prefix="${pkgdir}/opt/${pkgname}" \
    cxxstd="c++20" \
    disable_local="bzip2 expat libevent libyaml re2 sqlite3 zlib"

  install -m 0644 lib/libcbang.a -t "${pkgdir}/opt/${pkgname}/lib"
  install -m 0644 lib/libcbang-boost.a -t "${pkgdir}/opt/${pkgname}/lib"
  cp -a config/ "${pkgdir}/opt/${pkgname}/config/"
  cp -a src/boost/boost/ "${pkgdir}/opt/${pkgname}/include/"
  cp -a include/cbang/ "${pkgdir}/opt/${pkgname}/include/"
}
