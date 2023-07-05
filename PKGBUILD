# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ooniprobe-desktop
pkgver=3.9.1
_cliver=3.17.5
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
sha256sums=('ebfa47340b9a9d37ce00843f8d4ec3b7dd87939ba2643ae908fee02d4d7e6686'
            'dc0d4ddc57c34f85026bacf801c45e97be987e41950d89363a70e634acfd3e06'
            '96a4ceb5ec8184908d9c2c29104fe3c35444f16b2fabe82d61d344453acee588')

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
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install
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
    icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "$pkgdir/${icons_dir}"
    install -m644 "dist/.icon-set/icon_${icon_size}x${icon_size}.png" \
      "${pkgdir}${icons_dir}/$pkgname.png"
  done

  for icon_size in 32 64 128 256 512 1024; do
    icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "$pkgdir/$icons_dir"
    install -m644 "dist/.icon-set/app_${icon_size}.png" \
      "${pkgdir}${icons_dir}/$pkgname.png"
  done
}
