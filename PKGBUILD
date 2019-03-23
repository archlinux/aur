# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-git
pkgver=r20.3b852b3
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
electron_version='electron@v5.0.0-beta.6'
license=('WTFPL')
makedepends=('nodejs' 'npm')

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%}::git+${url}#branch=master")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    #need to tweak numbering since fork, add 7 commits offset
    ncom=$(git rev-list --count HEAD)
    rev=$((ncom+7))
    printf "r%s.%s" "$rev" "$(git rev-parse --short HEAD)"
  )
}

build() {
  npm install --prefix $srcdir/${pkgname}/ ${electron_version}
  cd "$srcdir/${pkgname}"
  npm install --production=false
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname}/assets/icon/chat-favicon-no-new-256dp.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
  install -Dm644 "${srcdir}/${pkgname}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm755 "${srcdir}/${pkgname}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/"
  rm -r "${srcdir}/${pkgname}/.git"
  mv "${srcdir}/${pkgname}" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/share/${pkgname%-git}"
}

