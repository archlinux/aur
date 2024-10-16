# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="IceMaze"
_pkgname="${_binname,,}"
pkgname="${_pkgname}-bin"
pkgver=39
_commit="24515a6142624985eb46f8b10fbd99f57a0ccaec"
pkgrel=2
pkgdesc="A sliding block adventure. Platform/puzzle game."
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'powerpc64le' 's390x')
url="https://arthursonzogni.com/en/${_binname}"
_url="https://github.com/ArthurSonzogni/${_binname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11')
makedepends=('squashfs-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/${_commit}/README.md")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1130.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1131.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1132.snap")
source_i686=("${_pkgsrc}-i686.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1127.snap")
source_powerpc64le=("${_pkgsrc}-powerpc64le.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1133.snap")
source_s390x=("${_pkgsrc}-s390x.snap::https://api.snapcraft.io/api/v1/snaps/download/SNmBc9RKeGGSR5IntLSHw2TdKwcpq77f_1134.snap")
sha384sums=('fd69ceeb2f3b40ea2379fc8508430a3cf17d46402bf23e6305b547a174cd24d447b0b33da7180d19aa543ae704cce259')
sha384sums_x86_64=('ec67ab6897546762427fc482ce3ce139828596e7cbad04ff270c3e602945327875607cbccb7d04c4e28147b16f8b1ffc')
sha384sums_aarch64=('7a69d4c5550440319136f4afdab1219fdee5a58c976da81813a8710fbd3678c12db95197ea4c3ce37f39c2d4a42af41e')
sha384sums_armv7h=('ddbe2157e7bc81b7fc11a366b62850b39d5777d0d5bbc4fa9804c4a996c46cc8574abbaa177e4e288c7f192623a4d0c6')
sha384sums_i686=('f8207497c57133f8240a79a55f1a63d563a4b21503696e7618daabfca05479e520dd18030849cdacfe165ffd77899d53')
sha384sums_powerpc64le=('34c85807906fdec3f92bf7f8ce2581291feeae1af0cd160b44f1346408b5b4d90b598017211afda4d99eabf3d3c1ca94')
sha384sums_s390x=('9990809396cbd7b10dcf4d1517de8658f9bebbd19d231dce35af28ce9b0ece593367cacdf7cb28ef817f0b57688d00af')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  sed -i 's|Icon=${SNAP}/meta/gui/icemaze\.png|Icon=icemaze|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/bin"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share"
  find "${_pkgname}" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
}
