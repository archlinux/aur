# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='arm'
  ['loong64']='loongarch64'
  # ['powerpc64le']='powerpc64le'
  ['riscv64']='riscv64'
  # ['s390x']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_basename="zls"
_pkgname="${_basename}-master"
pkgname="${_pkgname}-bin"
pkgver=0.16.0dev.63+60cff3d6
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  "${!_arch[@]}"
)
url="https://zigtools.org/zls"
license=(
  'MIT'
)
depends=(
  'sh'
  'zig-master'
)
makedepends=(
  'curl'
  'jq'
  'minisign'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_basename}-versioned.sh"
)
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')

prepare() {
  local zig_version="$(zig-master version | tr -d '\n' | jq -sRr @uri)"
  local index_json="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${zig_version}&compatibility=only-runtime")"
  local artifact_tarball="$(jq -r ".\"${_arch[$CARCH]}-linux\".\"tarball\"" <<< "${index_json}")"
  local artifact_shasum="$(jq -r ".\"${_arch[$CARCH]}-linux\".\"shasum\"" <<< "${index_json}")"
  local artifact_filename="$(basename "${artifact_tarball}")"
  
  cd "${srcdir}"
  echo "  ==> Retrieving sources..."
  echo "   -> Downloading ${artifact_filename}..."
  curl -qgb "" -fLC - --retry 3 --retry-delay 3 -o "${artifact_filename}" "${artifact_tarball}"
  echo "   -> Downloading ${artifact_filename}.minisig..."
  curl -qgb "" -fLC - --retry 3 --retry-delay 3 -o "${artifact_filename}.minisig" "${artifact_tarball}.minisig"

  echo "  ==> Validating source files with sha256sums..."
  echo "${artifact_shasum}  ${artifact_filename}" | sha256sum -c -

  echo "  ==> Validating source files with minisig..."
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
  # https://github.com/zigtools/zls/releases/latest
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  minisign -V \
    -P "${zls_minisign}" \
    -m "${artifact_filename}"

  echo "  ==> Extracting sources..."
  echo "   -> Extracting ${artifact_filename} with bsdtar"
  bsdtar -xf "${artifact_filename}"

  chmod +x ./"${_basename}"

  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig-master|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"
}

pkgver() {
  cd "${srcdir}"
  ./"${_basename}" version | sed 's/-//g'
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
