# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="IronPython"
_basename="${_Name,,}"
pkgver=3.4.2
pkgrel=4
_pkgname="${_basename}${pkgver%%.*}"
pkgname="${_pkgname}-bin"
pkgdesc="Implementation of the Python programming language for .NET Framework; built on top of the Dynamic Language Runtime (DLR)"
arch=('any')
url="https://ironpython.net"
_url="https://github.com/IronLanguages/${_pkgname}"
license=('Apache-2.0')
depends=(
  'mono>=5.12'
  'sh'
)
optdepends=(
  'gtk2: Window Console Help'
)
provides=(
  "${_pkgname}"
  "${_basename}${pkgver%.*}"
)
conflicts=(
  "${provides[@]}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}-any.zip::${_url}/releases/download/v${pkgver}/${_Name}.${pkgver}.zip"
        "${_basename}.sh")
sha256sums=('b12b9d336819f08132338747c53ad4741010044fa56262399a279544be50d285'
            'd0a1515f3a8cfd824cafaa171d9cef11ba0d35939fd430fb900e8bbd4cdd3a2d')

prepare() {
  cd "${srcdir}"
  sed -i "s/@@VERSION_MAJOR_MINOR@@/${pkgver%.*}/g" "${_basename}.sh"
}

package() {
  cd "${srcdir}"
  for _exe in ipy ipyc ipyw; do
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${pkgver%.*}"
    sed -i "s/@@EXE@@/${_exe}/g"      "${pkgdir}/usr/bin/${_exe}${pkgver%.*}"
    ln -vsf "${_exe}${pkgver%.*}"     "${pkgdir}/usr/bin/${_exe}${pkgver%%.*}"
  done
  for _exe in ipy ipyw; do
    install -vDm755 "${_basename}.sh" "${pkgdir}/usr/bin/${_exe}${pkgver%.*}-32"
    sed -i "s/@@EXE@@/${_exe}32/g"    "${pkgdir}/usr/bin/${_exe}${pkgver%.*}-32"
    ln -vsf "${_exe}${pkgver%.*}-32"  "${pkgdir}/usr/bin/${_exe}${pkgver%%.*}-32"
  done

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vd "${pkgdir}/usr/lib/${_basename}${pkgver%.*}" "${pkgdir}/usr/share/${_basename}${pkgver%.*}"
  cp -aT --no-preserve=ownership "lib"    "${pkgdir}/usr/lib/${_basename}${pkgver%.*}"
  cp -aT --no-preserve=ownership "net462" "${pkgdir}/usr/share/${_basename}${pkgver%.*}"
}
