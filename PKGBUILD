# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="icemaze"
pkgname="${_pkgname}-bin"
pkgver=39
_commit="24515a6142624985eb46f8b10fbd99f57a0ccaec" # 39
pkgrel=3
pkgdesc="A sliding block adventure. Platform/puzzle game."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'x86_64'
)
url="https://arthursonzogni.com/en/IceMaze/"
_url="https://github.com/ArthurSonzogni/IceMaze"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
)
makedepends=(
  'squashfs-tools'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/${_commit}/README.md"
)
# https://askubuntu.com/a/1196449
source_aarch64=(
  "https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1131.snap"
)
source_armv7h=(
  "https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1132.snap"
)
source_i686=(
  "https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1127.snap"
)
source_powerpc64le=(
  "https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1133.snap"
)
source_x86_64=(
  "https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1130.snap"
)
sha384sums=('fd69ceeb2f3b40ea2379fc8508430a3cf17d46402bf23e6305b547a174cd24d447b0b33da7180d19aa543ae704cce259')
sha384sums_aarch64=('7a69d4c5550440319136f4afdab1219fdee5a58c976da81813a8710fbd3678c12db95197ea4c3ce37f39c2d4a42af41e')
sha384sums_armv7h=('ddbe2157e7bc81b7fc11a366b62850b39d5777d0d5bbc4fa9804c4a996c46cc8574abbaa177e4e288c7f192623a4d0c6')
sha384sums_i686=('f8207497c57133f8240a79a55f1a63d563a4b21503696e7618daabfca05479e520dd18030849cdacfe165ffd77899d53')
sha384sums_powerpc64le=('34c85807906fdec3f92bf7f8ce2581291feeae1af0cd160b44f1346408b5b4d90b598017211afda4d99eabf3d3c1ca94')
sha384sums_x86_64=('ec67ab6897546762427fc482ce3ce139828596e7cbad04ff270c3e602945327875607cbccb7d04c4e28147b16f8b1ffc')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${source_artifact%.snap}" "${source_artifact}"

  cd "${source_artifact%.snap}/meta/gui"
  sed -e "s|^Icon=.*|Icon=${_pkgname}|g" \
      -i "${_pkgname}.desktop"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  
  cd "${source_artifact%.snap}"
  install -vDm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -va --parents --no-preserve=ownership "usr/share/${_pkgname}" -t "${pkgdir}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
