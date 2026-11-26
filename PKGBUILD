# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nsh-cli-bin
pkgver=0.7.1
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
            'a82f31022775cb88267fa57548665c8da7dba4b62f044a4945c17397ff0b99d6'
            '6202f5f0c2894273a3e780d08a8c59c9b73cf358537e47dec1efcdc7bf48a4c3')
sha256sums_x86_64=('04457ad3a53c91b66efcee537968c5af7c90df25cf61c18d51135ecc051e22b3'
                   '653dd3198fb4d2f680900d982d01582db0202781a197eebe4b6cc0a8aa546845'
                   'd2b8c19cd839fa224a4910d8981ab0a34a4815cf286ae514acf6a9514661c1ff')
sha256sums_aarch64=('011099329342bc961c9089de2c7c1ccdd60c0177b77d81284756866c2087ebbb'
                    '38a7a3bc0d6f69299cfd5acc2fcbf3792934eac4685bce46773e29371cd3ab36'
                    'd7674f9af244f441405fd8f6ee91e23638bbc1b074f972c5a4b3ab89001b3dde')

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
