# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-git
_pkgname=${pkgname%-git}
pkgver=3.5.2881.r14.g2b7ce57f
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
provides=('wire-desktop')
conflicts=('wire-desktop')
depends=('electron' 'xdg-utils')
makedepends=('cargo' 'npm' 'python2' 'git' 'yarn')
optdepends=('hunspell-en_US: for English spellcheck support'
            'emoji-font: colorful emoji')
source=("git+https://github.com/wireapp/wire-desktop.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'cc9056cecff2aa49a9ce9c8376d57ec8c7c2cb8174f7966b5cdccbeb2e3751ea')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/linux\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Create launcher script
  cat << EOF > "${_pkgname}-launcher"
#!/bin/sh

electron "/usr/lib/${_pkgname}"
EOF
}

build() {
  cd "${_pkgname}"
  yarn
  yarn build:ts
  npx grunt 'linux-other'
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${_pkgname}"/wrap/dist/linux-unpacked/resources/app/* "${pkgdir}/usr/lib/${_pkgname}"

  # Place launcher script
  install -Dm755 "${_pkgname}-launcher" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${_pkgname}.desktop"
  local res
  for res in 32x32 256x256; do
    install -Dm644 "${_pkgname}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  # Spellcheck dictionaries
  rm -rf "${pkgdir}/usr/lib/${_pkgname}/node_modules/spellchecker/vendor/hunspell_dictionaries"
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${_pkgname}/node_modules/spellchecker/vendor/hunspell_dictionaries"

  # Place license files
  local license
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${_pkgname}/wrap/dist/linux-unpacked/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
  done
}
