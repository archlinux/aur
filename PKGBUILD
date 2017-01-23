# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=wire-desktop-git
_pkgname=wire-desktop
_name=wire
pkgver=2.11.2688.r2.ge890ff6
pkgrel=1
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('gendesk' 'grunt-cli' 'npm' 'python2')
optdepends=('hunspell-en: for English spellcheck support')
provides=('wire-desktop')
source=("git://github.com/wireapp/wire-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release\///g'
}

prepare() {
  gendesk -f -n --name=Wire --pkgname="${_name}" --pkgdesc="${pkgdesc}" --exec="${_name}" --categories="Network"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install
  grunt 'clean:linux' 'update-keys' 'release-prod'
  if [ $CARCH == 'x86_64' ]; then
    node_modules/.bin/build --linux --x64 --dir
  elif [ $CARCH == 'i686' ]; then
    node_modules/.bin/build --linux --ia32 --dir
  else
    echo "Unknown architecture"; exit 1;
  fi
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${_name}"
  if [ $CARCH == 'x86_64' ]; then
    cp -a "${srcdir}/${_pkgname}/wrap/dist/linux-unpacked/"* "${pkgdir}/usr/lib/${_name}"
  elif [ $CARCH == 'i686' ]; then
    cp -a "${srcdir}/${_pkgname}/wrap/dist/linux-ia32-unpacked/"* "${pkgdir}/usr/lib/${_name}"
  else
    echo "Unknown architecture"; exit 1;
  fi
  
  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
  
  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_name}.desktop"
  for res in 32x32 256x256; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_name}.png"
  done

  # Spellcheck dictionaries
  rm -rf "${pkgdir}/usr/lib/${_name}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${_name}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_name}/${license}" "${pkgdir}/usr/share/licenses/${_name}/${license}"
    rm "${pkgdir}/usr/lib/${_name}/${license}"
  done
}
