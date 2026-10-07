# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=ollaya-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Run open decision models locally, the way Ollama runs LLMs (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url='https://github.com/ollaya-dev/ollaya'
license=('Apache-2.0')
depends=('gcc-libs')
options=(!strip)
optdepends=('nvidia-utils: GPU acceleration on NVIDIA GPUs (CUDA 13 driver R580+, amd64 only)')
provides=('ollaya')
conflicts=('ollaya')
install='ollaya.install'

source=('ollaya.service'
        'ollaya.sysusers')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/ollaya-linux-amd64.tar.zst")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.zst::$url/releases/download/v$pkgver/ollaya-linux-arm64.tar.zst")

sha256sums=('e6a2415aa487f882d2075bfbe033b846063be1fde510cbd3965a696f6a9f300e'
            '888ff9184a099058f147d9ecadeeb7e26b69d536544a32cfc1777b6b3214c99b')
sha256sums_x86_64=('a24c3de5e1c5f33bb0973eae1a36ac8e9033f47f3ae836884e3857a1b2ea1003')
sha256sums_aarch64=('ac1b499480ae417b44c61294c82d0eef735401af082c5729ec30729fe18f5198')

# The release archives have no top-level directory; they unpack to bin/ and share/.
package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share"
  cp -t "$pkgdir/usr/bin" bin/*
  cp -rt "$pkgdir/usr/share" share/*

  # Arch convention: the license also lives in /usr/share/licenses/$pkgname.
  install -Dm644 share/doc/ollaya/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Systemd service and user, adapted from packaging/ollaya.service upstream.
  install -Dm644 "$srcdir/ollaya.service" "$pkgdir/usr/lib/systemd/system/ollaya.service"
  install -Dm644 "$srcdir/ollaya.sysusers" "$pkgdir/usr/lib/sysusers.d/ollaya.conf"
}
