# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=92.0.4515.107
pkgrel=2
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=("clang" "lld" "ninja" "gn" "python2" "gcc" "llvm" "ccache")

_WITH_CLANG='Linux_x64'
_WITH_PGO='linux'
_WITH_GN='linux'

_clang_path='clang-llvmorg-13-init-10392-gd3676d4b-2.tgz'
_PGO_PATH='chrome-linux-4515-1626533253-34e4718a21d6b148e3c9459b9f213fba5d58ef83.profdata'
_gn_version='git_revision:39a87c0b36310bdf06b692c098f199a0d97fc810'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

update_helper() {
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
}

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
sha256sums=(
  "c25d981bd46af050c7931925e140b5621244ecabf15ae010c4659aeeb87923be"
  "ec7e686edd39068acd3122bbae4f4e83ba8540ffdb9fe30790679e72c7318d33"
  "723979ea8245a297fac101ff71e1e9f97f138e0bfb0e84176ef5ca70cc96bf8e"
  "4eb2ca84afcb7afdf1d96badec12b66edf109dacd2f4e900774f4584dd9bd609"
  "3c2acbecdc2a8ba58709954f29858cb2cff38c703f5f3a296e8c160fcfb53caf"
  "4c4400d81c00734f1b0ecd14b64ac3778dd939d29d807f13bd08a3c1f8ddc48b"
)
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
