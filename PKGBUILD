# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="IronPython"
_basename="${_Name,,}"
pkgver=2.7.12
pkgrel=2
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
replaces=(
  "${_basename}-bin<3"
)
conflicts=(
  "${provides[@]}"
  "${replaces[@]}"
)
_pkgsrc="${_url##*/}-${pkgver}"
noextract=("${_pkgsrc}-any.deb")
source=("${_pkgsrc}-any.deb::${_url}/releases/download/ipy-${pkgver}/${_basename}_${pkgver}.deb"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/ipy-${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/ipy-${pkgver}/LICENSE"
        "${_basename}.sh")
sha256sums=('b7b90c82cf311dd3faf290ce3f274af5128b96db884a88dd643ce141bbf12fb9'
            'eb708d37373989d4f48e3c9993df6a4dd0b376ebb261378a8930fd1302402d47'
            '11c8b015ed198f376fd407aa23091187ee89c0f573d3df844bdd79fa02329049'
            '0a0dfec7b5b7b7035c2aa3d2028b849fac8a330b1373353e58cabde3a722eb77')

prepare() {
  cd "${srcdir}"
  sed -i "s/@@VERSION_MAJOR_MINOR@@/${pkgver%.*}/g" "${_basename}.sh"

  mkdir -p "${_pkgsrc}-any"
  bsdtar -xf "${_pkgsrc}-any.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-any"
  rm -f data.tar.*
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

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-any/usr"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr" "lib" "share"
}
