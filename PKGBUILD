# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.16.2
pkgrel=1
_jslibcommit='929dd8415dcd69032e545b20f75c1c8abaad0e3a'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('git' 'npm' 'nvm' 'jq')
depends=('alsa-lib' 'electron' 'gconf' 'gtk2' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nspr' 'nss')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('de9ba7f46a78bae2e47c01589fef254f9b98ae8b2b19d1b6f7bf981a4779d4cbe1d746c459f69a67b61318469629df0633b186401733f1c2b147e4c622043761'
            '8a379aa256f207370f395ff451f0c40964195de8c167fbfb32925ede6b94260eb0c48387fb7a8b605e8ed974c13deb50a9f5013276d251f5e631438ee7578afc'
            '72e86cb727ad0223937ad0fc95867e1485fa5180e5ed28010f732bc3fe7e562750c88c8b54d47cfa6fbbbc573c489961f1e024f7cd8a356c905650fc56a3c224'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  sed -i 's/ && npm run sub:init//' "${srcdir}/desktop-${pkgver}/package.json"
  # Patch the build config in package.json so it works with system electron
  SYSTEM_ELECTRON_VERSION=$(electron --version | sed -r 's/v//')
  cd "${srcdir}/desktop-${pkgver}"
  jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron"' > package.json.patched
  mv package.json.patched package.json
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.15.3 && nvm use 10.15.3

  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  # Make unpacked dist using electron-builder.
  # Don't use `npm run dist:lin` because it builds a bunch of other irrelevant
  # platforms as it uses the config in package.json
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
