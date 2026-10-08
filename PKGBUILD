# Maintainer: Mikołaj <mikolaj.q@wp.pl>

pkgname=nudl-bin
pkgver=1.2.0
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
sha256sums_x86_64=('2e51392a7a0ef89b88139bf9b75e505a610281c9760f5b24a39ec547d6d1a82b'
                   '6fa7f535b5aa5c30a9e6a1ba159d40662a830924cef7a4f63710df433bdaed65')
sha256sums_aarch64=('50e87d01895f58c8a571b1c5cf461b1fbcfa8845ca77cc84e9c04637f4e6a5f6'
                    '39a601ec34c499fd552fae8a0274ede7cb64251b6f7b97ca377184b2085af4bf')

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
