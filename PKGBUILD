# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
_pkgname="${_basename}-master"
pkgname="${_pkgname}-bin"
pkgver=0.16.0dev.26+8b2754ad
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
  # 'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
license=('MIT')
depends=(
  'zig-master'
)
makedepends=(
  'curl'
  'jq'
  'minisign'
)
provides=(
  "${_basename}=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_basename}"
  "${_pkgname}"
)

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=arm;
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'loong64'     ]; then _arch=loongarch64;
elif [ "${CARCH}" = 'powerpc64le' ]; then _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then _arch=x86_64;
else _arch=DUMMY;
fi

prepare() {
  local zig_version index_json artifact_tarball artifact_shasum artifact_filename
  zig_version="$(zig version | tr -d '\n' | jq -sRr @uri)"
  index_json="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${zig_version}&compatibility=only-runtime")"
  artifact_tarball="$(jq -r ".\"${_arch}-linux\".\"tarball\"" <<< "${index_json}")"
  artifact_shasum="$(jq -r ".\"${_arch}-linux\".\"shasum\"" <<< "${index_json}")"
  artifact_filename="$(basename "${artifact_tarball}")"
  
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
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  minisign -V \
    -P "${zls_minisign}" \
    -m "${artifact_filename}"

  echo "  ==> Extracting sources..."
  echo "   -> Extracting ${artifact_filename} with bsdtar"
  bsdtar -xf "${artifact_filename}"

  chmod +x ./"${_basename}"
}

pkgver() {
  cd "${srcdir}"
  ./"${_basename}" version | sed 's/-//g'
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/bin/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_basename}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
