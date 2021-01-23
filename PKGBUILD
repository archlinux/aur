# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.24.1
pkgrel=1
_jslibcommit='6ac6df75d7a9bd5ea58f5d8310f1b3e34abd2bde'
_nodeversion='10.23.1'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('git' 'npm' 'python' 'nvm' 'jq' 'patch' 'pkgconf' 'make' 'gcc')
depends=('electron6' 'libnotify' 'libsecret' 'libxtst')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "package.json.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('3e37c53eb52b2926fe023a997d27ea1198bcb68a0590b83cdfc66bdfd4f94c187c2cf593bcb8543a904f3075798f8cb0c5ee8419d0f3c87aaa54df70de9ee76b'
            '972f56bdcc36522d9fb46245a607e9f1a1aee6031e19bd6e9c6bac70d3b4ff71b3cb5d963f01567955d1725a1c6babf0e9b8437f28b522e2433d97b1d2e30cf7'
            'cbe6dff699de7a274b7c5ab1dd25a348443dd3dc50eb8b2290c8c300b6b3a560271aef773b2cd55d25ccaa1527ed25d5626310f6da342f2893d2f63212bd2814'
            '25ec775e99686288b8242f19003f72e834022a69845da19687e6cdbd1cb399485b64369f90fa575e1b0e458fa1672fc5ba016750fda488bf1f536b1ebd5c07d0'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"

  # Patch out postinstall routines
  patch --strip=1 package.json ${srcdir}/package.json.patch

  # Patch build to make it work with system electron
  SYSTEM_ELECTRON_VERSION=$(pacman -Q electron6 | cut -d' ' -f2 | cut -d'-' -f1)
  jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION\
  '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron6"'\
  > package.json.patched
  mv package.json.patched package.json
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  local npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  npx electron-builder build --dir

  # Restore node config from nvm
  npm config set prefix "${npm_prefix}"
  nvm unalias default
}

package() {
  cd "${srcdir}/desktop-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
