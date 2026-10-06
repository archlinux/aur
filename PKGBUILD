# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=ollaya-bin
pkgver=0.11.0
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
sha256sums_x86_64=('cea0442812c0c317c4a6ac448537d746aeb4f680f3fbd6ce4176a14d81f4fffe')
sha256sums_aarch64=('dab3a4c1054417a22ea9cc33122ff15651c4c96c5414af4935bf6b9f922f5e12')

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
