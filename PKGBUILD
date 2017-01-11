# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=zazu-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.2
pkgrel=1
pkgdesc='A fully extensible and open source launcher for hackers, creators and dabblers.'
arch=('x86_64')
url='http://zazuapp.org/'
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('gendesk' 'npm')
provides=('zazu')
source=("https://github.com/tinytacoteam/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.deb")
sha256sums=('ef2637cb2f9a6b682cd21251e441489f0a7e727f4b9fe72f6f9f21bfdf633828')

prepare() {
  gendesk -f -n --name=Zazu --pkgname="${_pkgname}" --pkgdesc="${pkgdesc}" --exec="${_pkgname}" --categories="Utility"
}

package() {
  cd "$srcdir"
  ar xf "${_pkgname}-v${pkgver}-linux-x64.deb"
  tar xf data.tar.xz

  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/opt/${_pkgname}"* "${pkgdir}/usr/lib/"
  
  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  for res in 512x512; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  for license in "LICENSE" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
}
