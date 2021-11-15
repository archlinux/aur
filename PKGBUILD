# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
pkgver=96.0.4664.45
pkgrel=1
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=("ninja" "python2" "unzip")
optdepends=("ccache: Speed up compilation")

_WITH_CLANG='Linux_x64'
_WITH_PGO='linux'
_WITH_GN='linux'

_clang_path='clang-llvmorg-14-init-5759-g02895eed-1.tgz'
_PGO_PATH='chrome-linux-4664-1636557077-6e390f4e505916531ca2ab0c895d5903ab4d88a9.profdata'
_gn_version='git_revision:0153d369bbccc908f4da4993b1ba82728055926a'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

sha256sums=(
  "b7ec325ac48d85063137a9efa3cbee7184052d7f4b4c469d88f4e5223235ca1f"
  "c05026423ca08e2c712745b717c23395e344f2c99b2dad30beed8e26922d268f"
  "daa0f591233625730168f3ea006f1d5a7e439e26b35a1051d957e394aa8a4440"
  "5bc9ef361e6303e151b6e63deb31b47e24a4f34ade4d8f092a04bc98e89a2edb"
  "5c2d11236c7254d48b02535ff58897830bc64e7258434d658c7d606e8d01b179"
  "8dcf5973033d40c9a7b15e571dea3832e7b67976aad9113369e22d43808c603f"
  "8022d1e0d6627a740847806c27a195fa9fc15c4883359a6d162944c3d5e26b44"
)

source=(
  "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/klzgrad/naiveproxy/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz"
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
  SRC_DIR="${srcdir}/${pkgname}-${pkgver}-${pkgrel}/src"

  mkdir -p ${SRC_DIR}/third_party/llvm-build/Release+Asserts
  tar xzf ${_clang_path} -C ${SRC_DIR}/third_party/llvm-build/Release+Asserts

  mkdir -p ${SRC_DIR}/chrome/build/pgo_profiles
  cp ${_PGO_PATH} ${SRC_DIR}/chrome/build/pgo_profiles

  mkdir -p ${SRC_DIR}/gn/out
  unzip gn-${_gn_revision}.zip -d ${SRC_DIR}/gn/out
}

build(){
  SRC_DIR="${srcdir}/${pkgname}-${pkgver}-${pkgrel}/src"
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

  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  install -d -m750 -o 0 -g 287 ${pkgdir}/etc/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
