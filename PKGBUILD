# Maintainer: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=nteract-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.3
pkgrel=1
pkgdesc="Interactive literate coding notebook"
url='https://nteract.io'
arch=('x86_64')
license=('BSD-3-Clause')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nodejs' 'nss' 'python')
makedepends=('gendesk')
optdepends=('ihaskell-git: support for Haskell'
            'julia: support for Julia (requires the "IJulia" package)'
            'python-ipykernel: support for Python 3'
            'python2-ipykernel: support for Python 2'
            'r: support for R (requires the "IRkernel" package)'
            'sagemath-jupyter: support for SageMath')
install=$pkgname.install

source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/nteract/nteract/releases/download/v0.4.3/nteract_0.4.3_amd64.deb"
        "LICENSE")
sha256sums=('5a2fab27241082d6fe4d1375ee8a3a33eefdc2cf5e0df0624ad8ab8adc475980'
            '9810f3d57c552d3b3f6c82cb3b6f3402d6faf94fc5a63067fe28360fb3b8b688')

prepare() {
  gendesk -f -n --name="${_pkgname}" --pkgname="${_pkgname}" --pkgdesc="${pkgdesc}" --exec="${_pkgname}" --categories="Development"
}

package() {
  cd "$srcdir"
  ar xf "${_pkgname}_${pkgver}_amd64.deb"
  tar xf data.tar.xz

  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${_pkgname}"

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icons
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
  cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
