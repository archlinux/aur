# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
_pkgname="${_basename}-mach"
pkgname="${_pkgname}-bin"
pkgver=0.14.0dev.406+336f468
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

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=arm;
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'loong64'     ]; then _arch=loongarch64;
elif [ "${CARCH}" = 'powerpc64le' ]; then _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then _arch=x86_64;
else _arch=DUMMY;
fi

_zig_version="$(zig-mach version | tr -d '\n' | jq -sRr @uri)"
_json_index="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${_zig_version}&compatibility=only-runtime")"
_artifact_tarball="$(jq -r ".\"${_arch}-linux\".\"tarball\"" <<< "${_json_index}")"
_artifact_shasum="$(jq -r ".\"${_arch}-linux\".\"shasum\"" <<< "${_json_index}")"
_artifact_name="$(basename "${_artifact_tarball}")"

depends=(
  'sh'
  'zig-mach'
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
source=("${_basename}-versioned.sh"
        "${_artifact_tarball}"
        "${_artifact_tarball}.minisig")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            "${_artifact_shasum}"
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
  sed -e "s|@@ZIG_PATH@@|/opt/zig-mach|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"

  chmod +x ./"${_basename}"
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
