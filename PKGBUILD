# Maintainer: dreieck

_pkgname='vdex-extractor'
pkgname="${_pkgname}-git"
epoch=0
pkgver=0.6.0+7.r311.20200513.78f283b
pkgrel=3
pkgdesc="Command line tool to decompile and extract Android Dex bytecode from Vdex files that are generated along with Oat files when optimizing bytecode from dex2oat ART runtime compiler."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
license=('Apache-2.0')
url='https://github.com/anestisb/vdexExtractor'
depends=(
  'glibc'
  'zlib'
)
makedepends=(
  'gcc'
  'git'
  'make'
)
optdepends=(
  'bash:  For optional scripts'
)
replaces=()
provides=(
  "${_pkgname}=${pkgver}"
  "deodex=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "deodex"
)
source=(
  "${_pkgname}::git+${url}.git"
  'deodex.sh'
)
sha256sums=(
  'SKIP'                                                              # Main git source
  '116b999eb535c64551a974b8ed14af7efd9f7b7998122a742b52de31949887f2'  # deodex.sh
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  CFLAGS+=" -Wno-error=vla-parameter"
  CXXFLAGS+=" -Wno-error=vla-parameter"
  export CFLAGS
  export CXXFLAGS
  make -C src clean
  make -C src
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install software.
  install -dvm755 "${pkgdir}/usr/bin"
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}/bin"      "bin/vdexExtractor"
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}/scripts"  "scripts"/{extract-apps-from-device.sh,update-vdex-location-checksums.sh}
  install -Dvm644 -t "${pkgdir}/usr/lib/${_pkgname}/tools/deodex"   "tools/deodex/constants.sh"
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}/tools/deodex"   "tools/deodex/run.sh"
  ln -sv "/usr/lib/${_pkgname}/bin/vdexExtractor"                          "${pkgdir}/usr/bin/vdexExtractor"
  ln -sv "/usr/lib/${_pkgname}/scripts/extract-apps-from-device.sh"        "${pkgdir}/usr/bin/extract-apps-from-device"
  ln -sv "/usr/lib/${_pkgname}/scripts/update-vdex-location-checksums.sh"  "${pkgdir}/usr/bin/update-vdex-location-checksums"
  install -Dvm755 "${srcdir}/deodex.sh"                                    "${pkgdir}/usr/bin/deodex"

  # Install documentation.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/git.log" 'README.md'

  # Install license.
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
