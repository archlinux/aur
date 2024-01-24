# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=whalebird
pkgver=6.0.0
pkgrel=1
pkgdesc="An Electron based Fediverse client"
arch=('x86_64')
url="https://whalebird.social"
license=('GPL3')
depends=('electron26>=26.0.0' 'electron26<27.0.0')
makedepends=('yarn' 'tar' 'nodejs-lts-hydrogen' 'node-gyp' 'git')
provides=('whalebird')
conflicts=('whalebird-bin' 'whalebird-desktop-git')
source=("https://github.com/h3poteto/whalebird-desktop/archive/refs/tags/v$pkgver.tar.gz"
        whalebird.desktop
        electron-builder.yml)
md5sums=('bf31494f589e08341f55568fbcedf29a'
         '6ab525c54c6e91871d0d6f05a76f5289'
         '480286196dc0614fd14b0d906c00b228')

prepare() {
  cd "whalebird-desktop-${pkgver}"
  rm -f electron-builder.yml
  _electronVersion="$(</usr/lib/electron26/version)"
  yarn up "electron@$_electronVersion"
}

build() {
  cp electron-builder.yml "whalebird-desktop-${pkgver}"/electron-builder.yml
  cd "whalebird-desktop-${pkgver}"
  yarn exec nextron build --no-pack
  yarn exec electron-builder --linux --dir --config electron-builder.yml -c.electronDist=/usr/lib/electron26 -c.electronVersion="$_electronVersion"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mv "whalebird-desktop-${pkgver}/dist/linux-unpacked" "${pkgdir}/usr/share/${pkgname}"
  ln -sf "/usr/share/${pkgname}/whalebird" "${pkgdir}/usr/bin/whalebird"

  for i in 16 32 128 256 512; do
    install -Dm 644 "whalebird-desktop-${pkgver}/resources/icons/icon.iconset/icon_${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png"
  done
  install -Dm 644 "whalebird-desktop-${pkgver}/resources/icons/icon.iconset/icon_32x32@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/whalebird.png"

  install -Dm644 -t "${pkgdir}/usr/share/applications" whalebird.desktop
  install -Dm 644 "whalebird-desktop-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
