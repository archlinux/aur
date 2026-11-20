# Maintainer: Pablo Palazon <ppalazon@phyxor.com>

pkgname=floci-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command-line interface for Floci local cloud emulators"
arch=('x86_64' 'aarch64')
url="https://github.com/floci-io/floci-cli"
license=('MIT')
depends=('glibc' 'zlib')
optdepends=(
  'docker: run and manage Floci emulator containers'
  'bash: using shell completions'
)
provides=('floci-cli')
conflicts=('floci-cli')
options=('!strip' '!debug')
source=("$pkgname-$pkgver-LICENSE.txt::https://raw.githubusercontent.com/floci-io/floci-cli/$pkgver/LICENSE")
source_x86_64=("floci-$pkgver::$url/releases/download/$pkgver/floci-linux-amd64")
source_aarch64=("floci-$pkgver::$url/releases/download/$pkgver/floci-linux-arm64")
noextract=("floci-$pkgver")
sha256sums=('76ab864e89fba40a87ed6ad64ca0abab6957e98c419930916db8825fd6109d8a')
sha256sums_x86_64=('abad8107f8ffba56f0e3af8c82710cfccee0dc61ba015699030e7a5029353714')
sha256sums_aarch64=('d2d22b5f6150b4e800248bccc65c386ec6d18b0cc57a6e64aa2884fe196f2218')

prepare() {
  chmod +x "floci-$pkgver"
  FLOCI_NO_UPDATE_CHECK=1 "./floci-$pkgver" completion bash >floci.bash
  sed -i '1{/^#!\/usr\/bin\/env bash$/d}' floci.bash
}

check() {
  FLOCI_NO_UPDATE_CHECK=1 "./floci-$pkgver" --help >/dev/null
  bash -n floci.bash
}

package() {
  install -Dm755 "floci-$pkgver" "$pkgdir/usr/bin/floci"
  install -Dm644 floci.bash "$pkgdir/usr/share/bash-completion/completions/floci"
  install -Dm644 "$pkgname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
