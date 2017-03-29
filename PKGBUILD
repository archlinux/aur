# Maintainer: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=nteract-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive literate coding notebook"
url='https://nteract.io'
arch=('x86_64')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nodejs' 'nss' 'python')
makedepends=('gendesk')
license=('BSD-3-Clause')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/nteract/nteract/releases/download/v$pkgver/nteract_0.1.0_amd64.deb"
        "LICENSE")
sha256sums=('38d56954443a1debad628d1d76750e9c20f32932bfcb6eb632651211c3f6e1b2'
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
