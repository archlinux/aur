# Maintainer: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=stash-electron-git
_pkgname=${pkgname%-git}
_appname=Stash
pkgver=1.2.1pre
pkgrel=3
pkgdesc="Stash Team Secret Manager"
url='https://github.com/Doccrazy/stash-electron'
arch=('x86_64')
license=('GPL-3.0')
depends=('alsa-lib' 'gconf' 'gtk3' 'libxss' 'libxtst' 'nss' 'libsecret' 'libcurl-gnutls')
conflicts=('stash-electron')

source=("${pkgname}_${pkgver}-${pkgrel}_amd64.deb::https://bintray.com/doccrazy/deb/download_file?file_path=${pkgname}_${pkgver}-${pkgrel}_amd64.deb"
        "LICENSE")
sha256sums=('f5086539650fe34879c1061f0d2143edaea4216fdbfbb53732f4bedb5017fe2d'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {
  cd "$srcdir"
  ar xf "${pkgname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xf data.tar.xz

  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/opt/${_appname}/"* "${pkgdir}/usr/lib/${_pkgname}"

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icons
  sed -i "s/opt\/${_appname}/usr\/lib\/${_pkgname}/" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
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
