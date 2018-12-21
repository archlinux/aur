# Maintainer: Doccrazy <mpiepk@gmail.com>

pkgname=stash-electron
_appname=Stash
pkgver=1.2.0
pkgrel=2
pkgdesc="Stash Team Secret Manager"
url='https://github.com/Doccrazy/stash-electron'
arch=('x86_64')
license=('GPL-3.0')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss' 'libsecret' 'libcurl-gnutls')
conflicts=('stash-electron-git')

source=("${pkgname}_${pkgver}-1_amd64.deb::https://bintray.com/doccrazy/deb/download_file?file_path=${pkgname}_${pkgver}-1_amd64.deb"
        "LICENSE")
sha256sums=('8c44a3d892dd843cc3c023d94c941523dd24105b3c90263450a74946697b44a2'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {
  cd "$srcdir"
  ar xf "${pkgname}_${pkgver}-1_amd64.deb"
  tar xf data.tar.xz

  # Place files
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -a "${srcdir}/opt/${_appname}/"* "${pkgdir}/usr/lib/${pkgname}"

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Place desktop entry and icons
  sed -i "s/opt\/${_appname}/usr\/lib\/${pkgname}/" "${srcdir}/usr/share/applications/${pkgname}.desktop"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
  cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${pkgname}/${license}" "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${pkgname}/${license}"
  done
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
