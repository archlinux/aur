# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=93.0.4577.63
pkgrel=1
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=("clang" "lld" "ninja" "gn" "python2" "gcc" "llvm" "ccache")

_WITH_CLANG='Linux_x64'
_WITH_PGO='linux'
_WITH_GN='linux'

_update_helper() {
  wget "https://github.com/klzgrad/naiveproxy/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz" -O "${pkgname}-${pkgver}-${pkgrel}.tar.gz"
  tar xf "${pkgname}-${pkgver}-${pkgrel}.tar.gz"

  cd "${pkgname}-${pkgver}-${pkgrel}/src"
  _WITH_CLANG='Linux_x64'
  _WITH_PGO='linux'
  _WITH_GN='linux'
  _PYTHON=$(which python2 2>/dev/null || which python 2>/dev/null)
  _CLANG_REVISION=$(${_PYTHON} tools/clang/scripts/update.py --print-revision)
  _clang_path="clang-${_CLANG_REVISION}.tgz"
  _PGO_PATH=$(cat chrome/build/${_WITH_PGO}.pgo.txt)
  _gn_version=$(grep "'gn_version':" DEPS | cut -d"'" -f4)

  cd ../../
  wget "https://commondatastorage.googleapis.com/chromium-browser-clang/${_WITH_CLANG}/${_clang_path}" -O "${_clang_path}"
  wget "https://storage.googleapis.com/chromium-optimization-profiles/pgo_profiles/${_PGO_PATH}" -O "${_PGO_PATH}"
  wget "https://chrome-infra-packages.appspot.com/dl/gn/gn/${_WITH_GN}-amd64/+/${_gn_version}" -O "gn-${_gn_revision}.zip"

  echo
  echo
  echo "_clang_path='${_clang_path}'"
  echo "_PGO_PATH='${_PGO_PATH}'"
  echo "_gn_version='${_gn_version}'"
  echo "_gn_revision='${_gn_revision}'"
  echo
  sha256sum "${pkgname}-${pkgver}-${pkgrel}.tar.gz" "naiveproxy.service" "naiveproxy@.service" "${_clang_path}" "${_PGO_PATH}" "gn-${_gn_revision}.zip" | \
  awk 'BEGIN {print "sha256sums=(" } { print "  \x22"$1"\x22" } END { print ")" }'

  rm -r "${pkgname}-${pkgver}-${pkgrel}"
}

_clang_path='clang-llvmorg-13-init-15163-g98033fdc-1.tgz'
_PGO_PATH='chrome-linux-4577-1629902302-97a75bab19e52f72bda9d9d33032dd998433e8c2.profdata'
_gn_version='git_revision:24e2f7df92641de0351a96096fb2c490b2436bb8'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

sha256sums=(
  "dc2e76f8ad5b92931deb0db799e35d9a74975f625d568bebda84a63d3274bb01"
  "ec7e686edd39068acd3122bbae4f4e83ba8540ffdb9fe30790679e72c7318d33"
  "723979ea8245a297fac101ff71e1e9f97f138e0bfb0e84176ef5ca70cc96bf8e"
  "cf74ea4bdd833b18ef52959f2791b11354fea20425b8dbfa4d017fc46732c665"
  "f8874377e631b3bccc6581a79bd9f720b5d0700f7e021930d00b626cf7ab3874"
  "b1df7d28776ebf714edc98abaaa09aa8b308212eef5a23fa24de8f4107ae1cd3"
)

source=(
  "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/klzgrad/naiveproxy/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz"
  "naiveproxy.service"
  "naiveproxy@.service"
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
  popd

  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
