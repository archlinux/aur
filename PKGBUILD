# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=wire-desktop-git
_pkgname=${pkgname%-git}
pkgver=2.14.2744.r1.geb28115
pkgrel=1
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('gendesk' 'grunt-cli' 'npm' 'python2')
optdepends=('hunspell-en: for English spellcheck support'
            'rust: for encryption speed improvements (optional makedep)')
provides=('wire-desktop')
source=("git://github.com/wireapp/wire-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\///g'
}

prepare() {
  gendesk -f -n --name=Wire --pkgname="${_pkgname}" --pkgdesc="${pkgdesc}" --exec="${_pkgname}" --categories="Network"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install
  grunt 'clean:linux' 'update-keys' 'release-prod'
  if [ $CARCH == 'x86_64' ]; then
    build_arch="x64"
  elif [ $CARCH == 'i686' ]; then
    build_arch="ia32"
  else
    echo "Unsupported architecture"; exit 1;
  fi
  grunt --arch=${build_arch} --target="dir" "electronbuilder:linux_other"
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  if [ $CARCH == 'x86_64' ]; then
    cp -a "${srcdir}/${_pkgname}/wrap/dist/linux-unpacked/"* "${pkgdir}/usr/lib/${_pkgname}"
  elif [ $CARCH == 'i686' ]; then
    cp -a "${srcdir}/${_pkgname}/wrap/dist/linux-ia32-unpacked/"* "${pkgdir}/usr/lib/${_pkgname}"
  else
    echo "Unsupported architecture"; exit 1;
  fi
  
  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  
  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  for res in 32x32 256x256; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  # Spellcheck dictionaries
  rm -rf "${pkgdir}/usr/lib/${_pkgname}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${_pkgname}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
}
