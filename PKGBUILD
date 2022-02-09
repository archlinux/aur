# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
pkgver=98.0.4758.80_1
pkgrel=1
_pkgver=98.0.4758.80
_pkgrel=1
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=("gcc-libs" "glibc" "nss")
makedepends=("ninja" "python" "unzip")
optdepends=("ccache: Speed up compilation")


_clang_path='clang-llvmorg-14-init-11564-g37fbf238-3.tgz'
_PGO_PATH='chrome-linux-4758-1643195016-f5cfe4c93eff056f51290a33e603a214804dbd80.profdata'
_gn_version='git_revision:fc295f3ac7ca4fe7acc6cb5fb052d22909ef3a8f'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

sha256sums=(
  "7ea663ffc7a41162bc64d06d88788bcfa2e311e2a52e767eb579b9660b7d0747"
  "c05026423ca08e2c712745b717c23395e344f2c99b2dad30beed8e26922d268f"
  "daa0f591233625730168f3ea006f1d5a7e439e26b35a1051d957e394aa8a4440"
  "5bc9ef361e6303e151b6e63deb31b47e24a4f34ade4d8f092a04bc98e89a2edb"
  "e79cb8f1e65b44b932b9fd98365b3771e913e7275d9e92e59eca4334c5689a28"
  "41a0a5550852919751e885252d163b2b490a330598c64d9f721482fa928bb691"
  "cedac495348379e73a53d1a875cbe7eb0b07b358bdbcc9f9169866a0c7473d86"
)


source=(
  "${pkgname}-${_pkgver}-${_pkgrel}.tar.gz::https://github.com/klzgrad/naiveproxy/archive/refs/tags/v${_pkgver}-${_pkgrel}.tar.gz"
  "naiveproxy.service"
  "naiveproxy@.service"
  "naiveproxy.sysusers"
  "${_clang_path}::https://commondatastorage.googleapis.com/chromium-browser-clang/${_WITH_CLANG}/${_clang_path}"
  "${_PGO_PATH}::https://storage.googleapis.com/chromium-optimization-profiles/pgo_profiles/${_PGO_PATH}"
  "gn-${_gn_revision}.zip::https://chrome-infra-packages.appspot.com/dl/gn/gn/${_WITH_GN}-amd64/+/${_gn_version}"
)
noextract=(
  "${_clang_path}"
  "${_PGO_PATH}"
  "gn-${_gn_revision}.zip"
)
backup=(etc/naiveproxy/config.json)
provides=('naiveproxy')
conflicts=('naiveproxy-git' 'naiveproxy-bin')

prepare() {
  SRC_DIR="${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}/src"

  mkdir -p ${SRC_DIR}/third_party/llvm-build/Release+Asserts
  tar xzf ${_clang_path} -C ${SRC_DIR}/third_party/llvm-build/Release+Asserts

  mkdir -p ${SRC_DIR}/chrome/build/pgo_profiles
  cp ${_PGO_PATH} ${SRC_DIR}/chrome/build/pgo_profiles

  mkdir -p ${SRC_DIR}/gn/out
  unzip gn-${_gn_revision}.zip -d ${SRC_DIR}/gn/out
}

build(){
  SRC_DIR="${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}/src"
  pushd ${SRC_DIR}
  ./build.sh
  popd
}

package(){
  pushd ${srcdir}
  install -Dm644 naiveproxy.service ${pkgdir}/usr/lib/systemd/system/naiveproxy.service
  install -Dm644 naiveproxy@.service ${pkgdir}/usr/lib/systemd/system/naiveproxy@.service
  install -Dm644 naiveproxy.sysusers ${pkgdir}/usr/lib/sysusers.d/naiveproxy.conf
  popd

  pushd ${srcdir}/${pkgname}-${_pkgver}-${_pkgrel}
  install -d -m750 -o 0 -g 287 ${pkgdir}/etc/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
