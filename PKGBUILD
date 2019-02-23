# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-git
pkgver=r18.41eeb02
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat"
arch=('x86_64' 'i686')
url="https://github.com/robyf/google-chat-linux"
license=('WTFPL')
depends=('electron>=1.8.4',electron<=3.1.3-1)
makedepends=('nodejs' 'npm')

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%-git}::git+${url}#branch=master"
    "${pkgname%-git}.desktop"
    "${pkgname%-git}.sh"
    "package.json"
    "chat-favicon-no-new-256dp.png")

sha256sums=('SKIP'
    'e65b8b9b0556dded2521aa12b6d8e87c59f08a79b9e8cbee4273a7a659f72a6a'
    'd23052d27c870090987d1844e7c82bc42b878afa42c8af9a363d8414560ea34d'
    '25b73ffc5ea40317faffaa277243617b1a2daed5bec7ddfb39e31274c5a88a79'
    '573cfc3e46a33c24b1caeb324d83e9557bf982326f0e63efc2d0b01f491fa5dc')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cp "$srcdir/package.json" "$srcdir/${pkgname%-git}/"
  cp "$srcdir/chat-favicon-no-new-256dp.png" "$srcdir/${pkgname%-git}/assets/icon/icon.png"
  cp "$srcdir/chat-favicon-no-new-256dp.png" "$srcdir/${pkgname%-git}/assets/icon/icon@2x.png"
  cp "$srcdir/chat-favicon-no-new-256dp.png" "$srcdir/${pkgname%-git}/assets/icon/"
  cd "$srcdir/${pkgname%-git}"
  npm install --production=false
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/${pkgname%-git}"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname%-git}/assets/icon/chat-favicon-no-new-256dp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
  install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/"
  rm -r "${srcdir}/${pkgname%-git}/.git"
  mv "${srcdir}/${pkgname%-git}" "${pkgdir}/usr/share/"
}

