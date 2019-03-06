# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.13.1
pkgrel=1
_jslibcommit='39b2ba1548b1843cd0cdce610da955844eecddae'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('npm' 'nvm')
depends=('alsa-lib' 'electron' 'gconf' 'gtk2' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nspr' 'nss')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('8c2c5d0ef33d3a526aeefef0b58dfeb519d04d3c35ecbf235e1a7a37cc3411966b0d12f292f4bca5ee149406599a905ebc624e886d5f47c168cd9bbd34423727'
            '6dc8516b6dcdbf49dad08881b83879aad893ddb096b7b8054942cf06655b4dd85f06981e518ea00c71f1f74043d53a65e2194ed2d22ccb01cd5ea01d77adc3a1'
            '72cb31b6bdccf7b4ea2a151e3be1e19d8d6f2f2034a658aef0f6aedca33a5b4faa3bed11ba973cfbbb9317b84532312affe4fdb478d84dc67a365fd25cf1e28c'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  sed -i 's/ && npm run sub:init//' "${srcdir}/desktop-${pkgver}/package.json"
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 10.13.0 && nvm use 10.13.0

  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  # Make unpacked dist using electron-builder.
  # Don't use `npm run dist:lin` because it builds a bunch of other irrelevant
  # platforms as it uses the config in package.json
  npx build --dir build

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
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
