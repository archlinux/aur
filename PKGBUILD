# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contributor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bun-bin
pkgver=1.0.20
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=('bun')
sha256sums_x86_64=('3484829701660df971c74f605a0a360a9c7f417c68ab8883718b97513d454e7f')
sha256sums_aarch64=('933838a53e1ee9ebefc8f8640b7c26c16b11bd2a5508ce398e09fecaf12f4da2')
_baseline=''
_baseline_sha256sums='28ebc2c9143b744488a6055a732d5e58a02fd44586e0c61ef6bdc425fb4c8cae'
if [[ $CARCH == 'x86_64' && $(cat /proc/cpuinfo | grep avx2) = '' ]];then
  _baseline='-baseline'
  sha256sums_x86_64=($_baseline_sha256sums)
fi
source_x86_64=("bun-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64${_baseline}.zip")
source_aarch64=("bun-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
build() {
  if [ "${CARCH}" == "aarch64" ]; then
    cd "bun-linux-aarch64"
  else
    cd "bun-linux-x64${_baseline}"
  fi
  install -dm755 "completions"
  SHELL=zsh "./bun" completions > "completions/bun.zsh"
  SHELL=bash "./bun" completions > "completions/bun.bash"
  SHELL=fish "./bun" completions > "completions/bun.fish"
}
package() {
  if [ "${CARCH}" == "aarch64" ]; then
    cd "bun-linux-aarch64"
    install -Dm755 "./bun-linux-aarch64/bun" "${pkgdir}/usr/bin/bun"
  else
    cd "bun-linux-x64${_baseline}"
    install -Dm755 "./bun" "${pkgdir}/usr/bin/bun"
  fi
  # simlink as bunx as in the official install.sh
  ln -s bun "${pkgdir}/usr/bin/bunx"
  
  install -Dm644 completions/bun.zsh "${pkgdir}/usr/share/zsh/site-functions/_bun"
  install -Dm644 completions/bun.bash "${pkgdir}/usr/share/bash-completion/completions/bun"
  install -Dm644 completions/bun.fish "${pkgdir}/usr/share/fish/vendor_completions.d/bun.fish"
}
