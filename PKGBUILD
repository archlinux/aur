# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-git
pkgver=0.2.4
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
electron_version='electron@v6.0.0-beta.2'
license=('WTFPL')
makedepends=('nodejs' 'npm')

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%}::git+${url}#branch=master"
        "google-chat-linux.desktop"
        "google-chat-linux.sh")

sha256sums=('SKIP'
        'e65b8b9b0556dded2521aa12b6d8e87c59f08a79b9e8cbee4273a7a659f72a6a'
        '8a4cbe222200bf214b817003b3598ce0e231956961bc0719b4a6a4cc32aa5b11')

build() {
  npm install --prefix $srcdir/${pkgname}/ ${electron_version}
  cd "$srcdir/${pkgname}"
  npm install --production=true
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname}/assets/icon/chat-favicon-no-new-256dp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
  install -Dm644 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm755 "${pkgname%-git}.sh" "${pkgdir}/usr/bin/"
  rm "${srcdir}/${pkgname}/${pkgname%-git}.sh"
  rm -r "${srcdir}/${pkgname}/.git"
  chmod 4755 "${srcdir}/${pkgname}/node_modules/electron/dist/chrome-sandbox"
  mv "${srcdir}/${pkgname}" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/share/${pkgname%-git}"
}

