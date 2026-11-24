# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nsh-cli-bin
pkgver=0.6.1
pkgrel=3
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
        "nsh-gpui-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-gpui-linux-x86_64.tar.gz"
        "nsh-gpui-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-gpui-linux-arm64.tar.gz"
        "nsh-tui-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-tui-linux-x86_64.tar.gz"
        "nsh-tui-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-tui-linux-arm64.tar.gz"
        'nsh-cli-bin.install')
source_x86_64=("nsh-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-linux-x86_64.tar.gz")
source_aarch64=("nsh-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-linux-arm64.tar.gz")
sha256sums=('ec75427ad955e3c740f22e7dc3f6db6fc5b2cc1d9135c2af91cece8dd47a2d38'
            'e509e35fbad261a4a5e27a9225c364ff0d9ddd202a638b02bbfd13fb5cd1b9f1'
            '2eac439a283c6bfbb318652aca5f6087025e7a58e098dd0e2ffb66f0c368d0ac'
            '00f2fba16b7398870c24a59c6594974fc31e0ed0af099d0757d067f241f1a09c'
            '8bde6cf9c63a6ee7ce8f6f1bba5432bc556659bd747ad615c4beeffdf9a8877c'
            'b3f085c06b6f9fddef3adfeccf655500c35fac9c46a0390b34547506a8e8effc'
            '6202f5f0c2894273a3e780d08a8c59c9b73cf358537e47dec1efcdc7bf48a4c3')
sha256sums_x86_64=('9a7ac692f1c229df476be8ff83a3c5912d271453b644e313f02cb19d18696070')
sha256sums_aarch64=('d7d54b8a62aa8bd4a9fb73fcc0abce8cc565185926f226aa90f48622f3e410a3')

package() {
  cd "$srcdir/nsh"
  install -Dm755 bin/nsh "$pkgdir/usr/bin/nsh"
  install -dm755 "$pkgdir/usr/lib/nsh"
  cp -a runtime "$pkgdir/usr/lib/nsh/"

  install -dm755 "$pkgdir/usr/lib/nsh/runtime"
  for arch in x86_64 aarch64; do
    local gpui="nsh-gpui-$pkgver-$arch.tar.gz"
    local tui="nsh-tui-$pkgver-$arch.tar.gz"
    bsdtar -xf "$srcdir/$gpui" --strip-components=2 -C "$pkgdir/usr/lib/nsh/runtime"
    bsdtar -xf "$srcdir/$tui" --strip-components=2 -C "$pkgdir/usr/lib/nsh/runtime"
  done

  bsdtar -xf "$srcdir/nsh-web-$pkgver.tar.gz" --strip-components=2 -C "$pkgdir/usr/lib/nsh/runtime"

  install -Dm644 "$srcdir/nsh-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
