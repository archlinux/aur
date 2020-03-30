# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.17.9
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url='https://github.com/RocketChat/Rocket.Chat.Electron'
license=('MIT')
depends=('electron7')
makedepends=('nodejs-lts-erbium' 'node-gyp' 'python' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        rocketchat-desktop
        rocketchat-desktop.desktop
        use-system-dictionaries.patch)
sha256sums=('ea2ee46df9c5d5ba9772fb69fcadec5d458ffac5b2cfc821b1ded70df4bca06b'
            '996bd106c0e742be0f4a342c5b3f683a28b65b2f93e98c783cb6ef03e8fcc98c'
            '31fae4f98a61a774f84030fd43d2ef92c7633740dc5aa55967a21d0e29ea621a'
            '9a18a4db55c49c8c71c84e331d519dc16509c38566f5c1602224dc4a3ca73a3e')

_dir="Rocket.Chat.Electron-${pkgver}"
prepare() {
  cd "$_dir"
  patch -Np1 <../use-system-dictionaries.patch
  yarn upgrade electron@"$(</usr/lib/electron7/version)" --non-interactive
}

build() {
  cd "$_dir"
  local i686=ia32 x86_64=x64
  export NODE_ENV=production
  yarn gulp build
  yarn run electron-builder --linux --"${!CARCH}" --dir \
    -c.electronDist=/usr/lib/electron7 \
    -c.electronVersion="$(</usr/lib/electron7/version)"
}

package() {
  local i686=linux-ia32-unpacked x86_64=linux-unpacked
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop" 
  install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

  cd "$_dir"
  install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE 
  install -Dm644 "dist/${!CARCH}/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
}
