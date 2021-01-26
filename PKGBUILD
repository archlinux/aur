# Maintainer: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=nteract-bin
_pkgname=${pkgname%-bin}
pkgver=0.28.0
pkgrel=1
pkgdesc="Interactive literate coding notebook"
url='https://nteract.io'
arch=('x86_64')
license=('BSD-3-Clause')
depends=('gtk3' 'libxss' 'nodejs' 'nss' 'python')
optdepends=('ihaskell-git: support for Haskell'
            'julia: support for Julia (requires the "IJulia" package)'
            'python-ipykernel: support for Python 3'
            'python2-ipykernel: support for Python 2'
            'r: support for R (requires the "IRkernel" package)'
            'sagemath-jupyter: support for SageMath')
install=$pkgname.install

source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/nteract/nteract/releases/download/v${pkgver}/nteract_${pkgver}_amd64.deb"
        "LICENSE")
sha256sums=('2f35c5e2ae3b3f7a99a1fc2fb22bac9ffaad831fc1f7f8c5f8d990fdcedc4c90'
            '866e6fa48cb8810d36d8d85a3085d7aa1c4317d3731f0ef84919428fee87bf71')

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
  sed -i 's/opt/usr\/lib/' "${srcdir}/usr/share/applications/${_pkgname}.desktop"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
  cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
