# Maintainer: bgme <i@bgme.me>
# Contributor: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc="A Proxy using Chrome's network stack to camouflage traffic with strong censorship resistence and low detectablility."
pkgver=95.0.4638.54
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


_clang_path='clang-llvmorg-14-init-3191-g0e03450a-1.tgz'
_PGO_PATH='chrome-linux-4638-1634308623-72bf2d0e0b11b9cb785718016169434ba1d25ee3.profdata'
_gn_version='git_revision:69ec4fca1fa69ddadae13f9e6b7507efa0675263'
_gn_revision='39a87c0b36310bdf06b692c098f199a0d97fc810'

sha256sums=(
  "ccfb2462d91d9c0a77be23aef33962a0ce761a63e8e77c9a34e815c504dceac0"
  "ec7e686edd39068acd3122bbae4f4e83ba8540ffdb9fe30790679e72c7318d33"
  "723979ea8245a297fac101ff71e1e9f97f138e0bfb0e84176ef5ca70cc96bf8e"
  "dd7479d43ce61401e057a5dee8b7e32bc2bd0d0e15d4f46c6858daf9170c9978"
  "252703067ad0897cc0f39f618eb792b0899769bb0e1b715b64bee15bcfba6f0b"
  "8bedd600ac58311f384e5113ab6a544bc72edb587ccb8f9e784c4dff208872c4"
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
