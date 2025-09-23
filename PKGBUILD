# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
_pkgname="${_basename}-master"
pkgname="${_pkgname}-bin"
pkgver=0.16.0dev.3+1840a4b8
pkgrel=2
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

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=arm;
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'loong64'     ]; then _arch=loongarch64;
elif [ "${CARCH}" = 'powerpc64le' ]; then _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then _arch=x86_64;
else _arch=DUMMY;
fi

_zig_version="$(zig version | tr -d '\n' | jq -sRr @uri)"
_json_index="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${_zig_version}&compatibility=only-runtime")"
_artifact_tarball="$(jq -r ".\"${_arch}-linux\".\"tarball\"" <<< "${_json_index}")"
_artifact_shasum="$(jq -r ".\"${_arch}-linux\".\"shasum\"" <<< "${_json_index}")"
_artifact_name="$(basename "${_artifact_tarball}")"

provides=(
  "${_basename}=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_basename}"
  "${_pkgname}"
)
source=("${_artifact_tarball}"
        "${_artifact_tarball}.minisig")
sha256sums=("${_artifact_shasum}"
            'SKIP')

verify() {
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"

  minisign -V \
    -P "${zls_minisign}" \
    -m "${_artifact_name}"
}

prepare() {
  cd "${srcdir}"
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
