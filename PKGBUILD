# Maintainer: ml <>
# Contributor: Jean Lucas <jean AT 4ray.co>

pkgname=whalebird-desktop
pkgver=4.3.4
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=('any')
url='https://whalebird.org'
license=('MIT')
depends=('electron')
makedepends=('git' 'python2' 'yarn')
provides=('whalebird')
source=("https://github.com/h3poteto/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  whalebird.desktop
  whalebird.sh)
sha256sums=('c30d767367120c962861babd0133df307610d549f21c43cb41278a582189932e'
            '8feed931453da872291c4588c981007ed36566155cfcf55ab3ff5d7431d60aef'
            'a0a050952353c78389bdafd8885cae4a402d0819acad07010566657e387c5ce9')

_npmopt=(--no-audit --no-progress --no-fund)
prepare() {
  cd "${pkgname}-${pkgver}"
  rm -f package-lock.json
  yarn --non-interactive upgrade electron@"$(</usr/lib/electron/version)"
}

build() {
  cd "${pkgname}-${pkgver}"
  export NODE_ENV=production

  # the same as calling `node .electron-vue/build.js` but doesn't try to display fancy text
  for c in webpack.{main,renderer}.config.js; do
    yarn --non-interactive exec -- webpack --mode production --config=.electron-vue/"$c"
  done

  yarn --non-interactive exec -- electron-builder --linux --dir \
    -c.electronDist=/usr/lib/electron \
    -c.electronVersion="$(</usr/lib/electron/version)"
}

package() {
  install -Dm755 whalebird.sh "${pkgdir}/usr/bin/whalebird"
  install -Dm644 -t "${pkgdir}/usr/share/applications" whalebird.desktop

  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt

  cd build
  cp -r linux-unpacked/resources "${pkgdir}/usr/share/${pkgname}"

  cd icons/icon.iconset
  for i in 16 32 128 256 512; do
    install -Dm644 "icon_${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png"
  done
}
