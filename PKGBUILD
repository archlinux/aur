# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_modules=(
  'serial'
  'parallel'
)
_pkgbase="bertini"
_pkgname=(
  "${_pkgbase}-common"
  "${_modules[@]/#/"${_pkgbase}-"}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/"-bin"}"
)
pkgver=1.7
pkgrel=2
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
arch=('x86_64')
url="https://bertini.nd.edu"
license=('custom:Bertini license')
makedepends=(
  'patchelf'
)
_pkgsrc="BertiniLinux64_OpenMPI_v${pkgver}"
source=("${_pkgbase}.sh")
source_x86_64=("${_pkgbase}-${pkgver}-x86_64.tar.gz::${url}/${_pkgsrc}.tar.gz")
sha256sums=('2b1ebb5e9004c3f8bdcc097cfe9c2fffd7e0ab0fe967adeb6f413f5c085f9cf3')
sha256sums_x86_64=('9699ed260068540c1c4f4127a20f2a8a5128bd6b0bcd8ec0a814f415baac6244')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patchelf --remove-rpath "${_pkgbase}-parallel"
}

package_bertini-common-bin() {
  pkgdesc+=" (common files)"
  arch=('any')
  depends=(
    'sh'
  )
  # provides=(
  #   "${pkgname%-bin}=${pkgver}"
  # )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

  cd "${_pkgsrc}"
  install -vDm644 "README" "${pkgdir}/usr/share/doc/${_pkgbase}/README"
  install -vDm644 "BertiniUsersManual.pdf" "${pkgdir}/usr/share/doc/${_pkgbase}/MANUAL.pdf"
  install -vDm644 "Bertini_License" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"

  cp -va --no-preserve=mode,ownership "examples" -t "${pkgdir}/usr/share/doc/${_pkgbase}"
}

package_bertini-serial-bin() {
  pkgdesc+=" (serial)"
  depends=(
    "${_pkgbase}-common-bin=${pkgver}-${pkgrel}"
    'glibc'
  )
  provides=(
    # "${pkgname%-bin}=${pkgver}"
    "${pkgbase}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -vDm644 "lib${pkgname%-bin}.a" -t "${pkgdir}/usr/lib"
}

package_bertini-parallel-bin() {
  pkgdesc+=" (parallel)"
  depends=(
    "${_pkgbase}-common-bin=${pkgver}-${pkgrel}"
    'glibc'
    'openmpi'
  )
  provides=(
    # "${pkgname%-bin}=${pkgver}"
    "${pkgbase}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -vDm644 "lib${pkgname%-bin}.a" -t "${pkgdir}/usr/lib"
}
