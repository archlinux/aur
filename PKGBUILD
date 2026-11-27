# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nsh-cli-bin
pkgver=0.7.2
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
            'd5b4de432bffa961bd5df8eda3853b791b4c9f07993c22a6a026a206aa455d5d'
            '6202f5f0c2894273a3e780d08a8c59c9b73cf358537e47dec1efcdc7bf48a4c3')
sha256sums_x86_64=('cb087e1e6afeb4ce4c2e70d8f803ccffe376b0a73d48605e492ec50fbbd45bec'
                   '3ec4ebca8ee61ec7348ef0f67edd2d924977d0f92e715a614f6cc71c9356afcd'
                   '5d8a1b58cfee076426cdd553a8a516169e6cbc55f2d62df1da0254a91ab55514')
sha256sums_aarch64=('8ac73c12fb0936707eb2216f66b63c2b359bcb9d4b553c2cca13e6add5af84b0'
                    '2e40eb4edbd05d38e03b3d2892495125a651d25eb02dec73fb068f1165f8441a'
                    '934e2d285ff60e320475ada1c3439b477a50976783e41f2db80ae84507cec64d')

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
