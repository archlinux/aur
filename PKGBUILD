# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=whalebird
pkgver=5.0.4
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma and Misskey client"
arch=('x86_64')
url="https://whalebird.social"
license=('MIT')
depends=('electron21>=21.4.3' 'electron21<22.0.0')
makedepends=('yarn' 'tar' 'nodejs>=18.0.0')
provides=('whalebird')
cnflicts=('whalebird-bin' 'whalebird-desktop-git')
source=("https://github.com/h3poteto/whalebird-desktop/archive/refs/tags/v$pkgver.tar.gz"
        whalebird.desktop
        electron-builder.yml)
md5sums=('badfc8ffe4836f3b34eb5870509da72b'
         '2cf7ef689d208d2fa41ce3622dce3545'
         '68af72623ba3763c9a1ea440b72a253d')

prepare() {
  cd "whalebird-desktop-${pkgver}"
  rm -f electron-builder.json
  _electronVersion="$(</usr/lib/electron21/version)"
  yarn upgrade "electron@$_electronVersion"
}

build() {
  cp electron-builder.yml "whalebird-desktop-${pkgver}"/electron-builder.yml
  cd "whalebird-desktop-${pkgver}"
  make build
  yarn exec electron-builder --linux --dir --config electron-builder.yml -c.electronDist=/usr/lib/electron21 -c.electronVersion="$_electronVersion"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mv "whalebird-desktop-${pkgver}/build/linux-unpacked" "${pkgdir}/usr/share/${pkgname}"
  ln -sf "/usr/share/${pkgname}/whalebird" "${pkgdir}/usr/bin/whalebird"

  for i in 16 32 128 256 512; do
    install -Dm 644 "whalebird-desktop-${pkgver}/build/icons/icon.iconset/icon_${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png"
  done
  install -Dm 644 "whalebird-desktop-${pkgver}/build/icons/icon.iconset/icon_32x32@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/whalebird.png"

  install -Dm644 -t "${pkgdir}/usr/share/applications" whalebird.desktop
  install -Dm 644 "whalebird-desktop-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
