# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=nudl-bin
pkgver=1.3.0
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
sha256sums_x86_64=('66d0e1c6ab35a5ca372ed47125bbb633d9a5c995347651910b535caff94ad028'
                   '53b6661231ad81562ddbd01dc7c43156c1a0d630d39aed892564b548a6ae18f0')
sha256sums_aarch64=('6053e9de1723306fd52e1ecba1696e51384b9b539d08ccb5e37784ad2ccf7e6a'
                    '228267b6dcf6060b38389c08f3d2620a558bf5108c96961546d8f4b9dd519469')

source_aarch64=(
  "$pkgname-$pkgver-aarch64.zip::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-aarch64-unknown-linux-musl.zip"
  "$pkgname-$pkgver-aarch64.ssh-sig::https://github.com/chenxiaolong/nudl/releases/download/v$pkgver/nudl-$pkgver-aarch64-unknown-linux-musl.zip.sig"
)

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
