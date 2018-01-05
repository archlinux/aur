# Maintainer: David Birks <david@tellus.space>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alda <alda@leetchee.fr>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Jonhoo <jon at thesquareplanet.com>
pkgname=signal
pkgver=1.1.0
pkgrel=3
license=('GPL3')
pkgdesc='Signal Private Messenger for the Desktop'
depends=('electron')
makedepends=('npm' 'ruby-sass' 'python2' 'phantomjs' 'yarn' 'grunt-cli' 'git')
provides=('signal')
conflicts=('signal-desktop' 'signal-desktop-beta' 'signal-desktop-bin')
arch=("i686" "x86_64")
url='https://github.com/WhisperSystems/Signal-Desktop'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WhisperSystems/Signal-Desktop/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}-tray.desktop")
sha512sums=('f8409ace472f2bf7614741ddb0f612faaf9f130141bd22539dc0ee4987dd8260136dc53965876c101cce8e15bf2769ab8cb30a07ae304491d97704370bc57058'
            '2c7f7ab67b94f5c5ed799eba2c47c466d35bf16a60b6311bac606956e25689b21e3ffa2373cf47289d83d46e20da1213866ade06009eccd8012e840a7428f056'
            'a264bfc7a4a7aac747daa588a2acbf1eddfd201bc795f0fbc18460a9b25f4460f364124e227a527fec22631cd84bc9e190f9f4978069e9c119eb556b9ff2d327'
            'ced228d19303abe951c55f7874004cb9e4cd062dbda48c7ea80b0a6fb9adf5716a37164c01c9921a91f00653b0737fed80e3c5e684b0f3bcec375c265d6d8e5c')

prepare() {
  cd "Signal-Desktop-${pkgver}"
  # Fix issues/1829
  sed -i 's/"electron-builder": "^19.29.2"/"electron-builder": "19.47.0"/' package.json
}

build() {
  cd "Signal-Desktop-${pkgver}"
  yarn install
  yarn pack-prod
}

package() {
  cd "Signal-Desktop-${pkgver}/dist/linux-unpacked"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r resources "${pkgdir}/usr/lib/${pkgname}/"
      
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  for i in 16 24 32 48 64 128 256 512; do
    install -Dm644 "../../build/icons/png/${i}x${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}-desktop"
  
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop  
  install -Dm644 "${srcdir}"/${pkgname}-tray.desktop "${pkgdir}"/usr/share/applications/${pkgname}-tray.desktop
}
