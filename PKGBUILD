# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nsh-cli-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Build and run nsh apps (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/longbridge/nsh'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc>=2.35')
options=(!strip !debug)
install=nsh-cli-bin.install

_tag="v$pkgver"
source=("nsh-LICENSE-$pkgver::https://raw.githubusercontent.com/longbridge/nsh/v$pkgver/LICENSE-APACHE"
        "nsh-web-$pkgver.tar.gz::$url/releases/download/$_tag/nsh-web.tar.gz"
        'nsh-cli-bin.install')
source_x86_64=("nsh-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-linux-x86_64.tar.gz"
        "nsh-gpui-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-gpui-linux-x86_64.tar.gz"
        "nsh-tui-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-tui-linux-x86_64.tar.gz")
source_aarch64=("nsh-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-linux-arm64.tar.gz"
        "nsh-gpui-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-gpui-linux-arm64.tar.gz"
        "nsh-tui-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-tui-linux-arm64.tar.gz")
sha256sums=('ec75427ad955e3c740f22e7dc3f6db6fc5b2cc1d9135c2af91cece8dd47a2d38'
            'e951e78966a65af4d7a0bbcd08a4a5eef4f3b6b4adaec3b4b502df7c4fe8b4e6'
            '6202f5f0c2894273a3e780d08a8c59c9b73cf358537e47dec1efcdc7bf48a4c3')
sha256sums_x86_64=('d281bfa3d93d84e9831e1a97dfdb63104329fcc87a0a48c78db5aeabb00c0073'
                   '9e0b6ad7f9ee1af825304a4f53fcefa412cb0b0f056e0fbb00c412487ff210f6'
                   'f453fedfa7a93b22bf75e6c429ff6edfa158fda25d3896e0240171806a06a1e2')
sha256sums_aarch64=('8392ec026bd32d1554b22f5ae8b574abcb746b502bc6ac93bcdca1436fdbbffc'
                    '1acf2ebc7c3948b1a085f6ddd0bcbfa16d384edd9e644dcc8c1af85432cc066f'
                    'b8615e3a3399c89e1b5d8d13447b374bc7b320add67687ca385c58b2e7bd97e9')

package() {
  cd "$srcdir/nsh"
  install -Dm755 bin/nsh "$pkgdir/usr/bin/nsh"
  install -dm755 "$pkgdir/usr/lib/nsh"
  cp -a runtime "$pkgdir/usr/lib/nsh/"

  # Install linux host and app from main runtime
  install -Dm755 runtime/linux/nsh-linux-host "$pkgdir/usr/bin/nsh-linux-host"
  install -Dm755 runtime/linux/nsh-linux-app "$pkgdir/usr/bin/nsh-linux-app"

  install -dm755 "$pkgdir/usr/lib/nsh/runtime"
  local gpui="nsh-gpui-$pkgver-$CARCH.tar.gz"
  local tui="nsh-tui-$pkgver-$CARCH.tar.gz"
  bsdtar -xf "$srcdir/$gpui" --strip-components=2 -C "$pkgdir/usr/lib/nsh/runtime"
  bsdtar -xf "$srcdir/$tui" --strip-components=2 -C "$pkgdir/usr/lib/nsh/runtime"

  # web archive has nsh/runtime/web/ structure - extract all components to /usr/runtime/
  install -dm755 "$pkgdir/usr/runtime"
  bsdtar -xf "$srcdir/nsh-web-$pkgver.tar.gz" --strip-components=2 -C "$pkgdir/usr/runtime"
  install -dm755 "$pkgdir/usr/runtime"
  bsdtar -xf "$srcdir/$gpui" --strip-components=2 -C "$pkgdir/usr/runtime"
  install -dm755 "$pkgdir/usr/runtime"
  bsdtar -xf "$srcdir/$tui" --strip-components=2 -C "$pkgdir/usr/runtime"

  # Install TUI host binary from extracted runtime
  install -Dm755 "$pkgdir/usr/lib/nsh/runtime/tui/nsh-tui-host" "$pkgdir/usr/bin/nsh-tui-host"

  # Install component record files so nsh CLI detects installed components
  install -dm755 "$pkgdir/usr/components"
  bsdtar -xf "$srcdir/$gpui" --strip-components=2 -C "$pkgdir/usr/components" nsh/components/gpui.json 2>/dev/null || :
  bsdtar -xf "$srcdir/$tui" --strip-components=2 -C "$pkgdir/usr/components" nsh/components/tui.json 2>/dev/null || :
  bsdtar -xf "$srcdir/nsh-web-$pkgver.tar.gz" --strip-components=2 -C "$pkgdir/usr/components" nsh/components/web.json 2>/dev/null || :

  install -Dm644 "$srcdir/nsh-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
