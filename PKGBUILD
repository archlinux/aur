# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.11.1
pkgrel=1
_jslibcommit='64a6015a67a8110cd8a4ef897e1338c71c4b6b49'
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
sha512sums=('74882467f077072f952ab026443d75cdc64e79cbd478dd0f732a72ae603e7fbd53141bd21f9238b1c64fa3e6e7a76f8aee4de07e300baebbe4dfbed61bbc22ce'
            'fc9590e3e62128799231742aa9d6ef5c716e2eeb3db30326f5b7e00a1345e0effc7953fc824599374c7d16d29cd9545789854a33dccb2b7b36f0a735ee6b4e8d'
            '4e12df4144ce40be087ef73987dd83e36f4ea2d92101ac34bfcef52059c6a94e2bdb21c73766d9b3596ac7d36d4ca75e9097f1857370ab9f99d9fbfa1f6d696e'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh --install
  nvm install 10 && nvm use 10

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
