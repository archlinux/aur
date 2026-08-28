# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=nudl-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Unofficial downloader for Hyundai, Kia and Genesis (HMG) infotainment navigation firmware (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/chenxiaolong/nudl"
license=('GPL-3.0-only')
provides=('nudl')
conflicts=('nudl')
makedepends=('openssh')
options=('!strip')

source_x86_64=(
  "$pkgname-$pkgver-x86_64.zip::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-x86_64-unknown-linux-musl.zip"
  "$pkgname-$pkgver-x86_64.ssh-sig::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-x86_64-unknown-linux-musl.zip.sig"
)
sha256sums_x86_64=('502ef5d620af95bb829dbc00945ab64049f7f1cf4f5549b1836bc19fcbeb1efe'
                    'f804b1c4cb110d5f3666aaff4986ec10a2b96d3674f004fe7ba8fd089fd50b35')

source_aarch64=(
  "$pkgname-$pkgver-aarch64.zip::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-aarch64-unknown-linux-musl.zip"
  "$pkgname-$pkgver-aarch64.ssh-sig::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-aarch64-unknown-linux-musl.zip.sig"
)
sha256sums_aarch64=('7837a52747603ae93f8f8a92929f09749ae75f17ac06253fc9c4ed42f12ea544'
                     '601d57aa7215dc7d3b47407e2d0c1e636675c28a24f95ba9df8ac835d2c6de26')

prepare() {
  # Weryfikacja podpisu SSH wydania (klucz opublikowany przez autora w
  # https://github.com/chenxiaolong/chenxiaolong/blob/master/VERIFY_SSH_SIGNATURES.md).
  # Rozszerzenie pliku podpisu celowo nie kończy się na ".sig", żeby makepkg
  # nie próbował weryfikować go automatycznie jako podpisu PGP.
  echo "chenxiaolong ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDOe6/tBnO7xZhAWXRj3ApUYgn+XZ0wnQiXM8B7tPgv4" > chenxiaolong_trusted_keys
  ssh-keygen -Y verify -f chenxiaolong_trusted_keys -I chenxiaolong -n file \
    -s "$pkgname-$pkgver-$CARCH.ssh-sig" < "$pkgname-$pkgver-$CARCH.zip"
}

package() {
  install -Dm0755 nudl "$pkgdir/usr/bin/nudl"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
