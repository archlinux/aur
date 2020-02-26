# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.16.6
pkgrel=6
_jslibcommit='53d08067df953e7a66ebf0b972e6443e1f275d86'
_nodeversion='10.19.0'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('git' 'npm' 'nvm' 'jq' 'patch')
depends=('alsa-lib' 'electron' 'gtk2' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "package.json.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('9b372488a6521443c78a68114f83b8bbcabd2adc366e993e11e79cc5f7e60417fe21bd050eb0eea7a352c4b24f96c7f8cda96a3c90afebe6b424a2973d4f2f54'
            'db30beb20b9dbde28336f48ff315e552000c878cd62eea7cf5f42ba24759be605b49066489367973463aa4a8eb0d3ce0e69b0918706e40858810d53208bbaab4'
            'f51ad4e9d3cf7a3f266f4a5341c46a11c053c1c1f4ba834ac6ae75ad4f1f383d0f3aea6127cbb83693bc75df77f59ffc038bbf2d67af1f732479634fe76dfa7a'
            '724b548688e2af1d8d25e6ebe6e35831e891453f2df011e5fa757b57fcbcfef3c171510be4537652891441c65121bd9766f372f82d3edd5971fb77b726409575'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"
  # Patch out postinstall routines
  patch --strip=1 package.json ${srcdir}/package.json.patch
  # Patch build to make it work with system electron
  SYSTEM_ELECTRON_VERSION=$(electron --version | sed -r 's/v//')
  jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION\
  '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron"'\
  > package.json.patched
  mv package.json.patched package.json
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  npx electron-builder --dir build

  # Restore node config from nvm
  npm config set prefix ${_npm_prefix}
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

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
