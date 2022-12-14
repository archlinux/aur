# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ooniprobe-desktop
pkgver=3.8.3
_cliver=3.16.6
pkgrel=1
pkgdesc="The next generation OONI Probe desktop app"
arch=('x86_64')
url="https://ooni.org"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss')
makedepends=('yarn')
conflicts=("${pkgname%-desktop}")
replaces=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-desktop/archive/v$pkgver.tar.gz"
        "${pkgname%-desktop}-${_cliver}-linux-amd64::https://github.com/ooni/probe-cli/releases/download/v$_cliver/${pkgname%-desktop}-linux-amd64"
        "$pkgname.desktop")
sha256sums=('3867d767447947628322f7858aa54c79d5c3eb996f3ef413bdc63434c27c854c'
            'c8298d196a786c8df2e7008cb9d6370bce2e6c46972fd9d0506f2fb6c305973e'
            '77f39a9c8d017b391f61686ac38131a9e31435635de4b72d0f20930165404915')

prepare() {
  cd "${pkgname#ooni}-$pkgver"

  # Place files
  mkdir -p build/probe-cli/linux_amd64
  cp "$srcdir/${pkgname%-desktop}-${_cliver}-linux-amd64" \
    "build/probe-cli/linux_amd64/${pkgname%-desktop}"
  chmod +x "build/probe-cli/linux_amd64/${pkgname%-desktop}"
}

build() {
  cd "${pkgname#ooni}-$pkgver"
  export NODE_OPTIONS=--openssl-legacy-provider
  yarn install --cache-folder "$srcdir/yarn-cache"
  node_modules/.bin/next build renderer
  node_modules/.bin/next export renderer
  node_modules/.bin/electron-builder --linux
}

package() {
  cd "${pkgname#ooni}-$pkgver"
  install -d "$pkgdir/opt/OONI Probe"
  cp -a dist/linux-unpacked/* "$pkgdir/opt/OONI Probe"
  chmod 4755 "$pkgdir/opt/OONI Probe/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/OONI Probe/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

  for icon_size in 16 48; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d $pkgdir/${icons_dir}
    install -m644 dist/.icon-set/icon_${icon_size}x${icon_size}.png \
      ${pkgdir}${icons_dir}/$pkgname.png
  done

  for icon_size in 32 64 128 256 512 1024; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d $pkgdir/$icons_dir
    install -m644 dist/.icon-set/app_${icon_size}.png \
      ${pkgdir}${icons_dir}/$pkgname.png
  done
}
