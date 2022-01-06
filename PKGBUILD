# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
pkgver=97.0.4692.71
pkgrel=1
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=("ninja" "python" "unzip")
optdepends=("ccache: Speed up compilation")

_clang_path='clang-llvmorg-14-init-8033-gabb2a91b-2.tgz'
_PGO_PATH='chrome-linux-4692-1640701189-f21838a98aa9a4bd13520a4261d2d77cbab9c3f3.profdata'
_gn_version='git_revision:90294ccdcf9334ed25a76ac9b67689468e506342'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

sha256sums=(
  "10535dac472243ac55d709a185434c72cde976143809c9bac213b6a4a5f521a1"
  "c05026423ca08e2c712745b717c23395e344f2c99b2dad30beed8e26922d268f"
  "daa0f591233625730168f3ea006f1d5a7e439e26b35a1051d957e394aa8a4440"
  "5bc9ef361e6303e151b6e63deb31b47e24a4f34ade4d8f092a04bc98e89a2edb"
  "720e10810f0005a4a8640728e72f06c283d4c51362f2889b513c6d6c3a136582"
  "8830cc810cdd1c4812a3cd009206bbf52f7c33a67b3280f62dd60cb684300e0f"
  "9cbfd56953d415a88dfae616191c0c37612a41f7fb09830d2952b8b5a59c7dec"
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
