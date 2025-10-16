# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
_pkgname="${_basename}-mach"
pkgname="${_pkgname}-bin"
pkgver=0.14.0dev.2577+271452d22
pkgrel=3
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://ziglang.org"
license=('MIT')
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
options=(
  '!strip'
)

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=armv7a; # TODO: arm
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'loong64'     ]; then _arch=loongarch64;
elif [ "${CARCH}" = 'powerpc64le' ]; then _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then _arch=x86_64;
else _arch=DUMMY;
fi

_index_json="$(curl -s "https://machengine.org/${_basename}/index.json")"
_artifact_tarball="$(jq -r ".\"mach-latest\".\"${_arch}-linux\".\"tarball\"" <<< "${_index_json}")"
_artifact_shasum="$(jq -r ".\"mach-latest\".\"${_arch}-linux\".\"shasum\"" <<< "${_index_json}")"
_artifact_name="$(basename "${_artifact_tarball}")"

_pkgsrc="${_artifact_name%.tar*}"
source=("${_artifact_tarball}"
        "${_artifact_tarball}.minisig")
sha256sums=("${_artifact_shasum}"
            'SKIP')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${_artifact_name}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  chmod +x ./"${_basename}"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  ./"${_basename}" version | sed 's/-//g'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

