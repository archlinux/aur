# Maintainer: Noel Jacob <noeljacob at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contrubutor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bunjs-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=("bun" "bun-bin")
sha256sums_x86_64=('f313015378e5a0cb1d7a47a32ab9ecc167f35e1c70bec1c53607147f8867d16e')
sha256sums_aarch64=('d0db68e448a4584bd6e8f097ebcd35ab10dd941d4fb562758b29b49b087f6092')
_baseline=''
_baseline_sha256sums='f47da0dd880fd671313084c05640ae840d8c9ab3788d71fb2cb72eaffb5e1537'
if [[ $CARCH == 'x86_64' && $(cat /proc/cpuinfo | grep avx2) = '' ]];then
  _baseline='-baseline'
  sha256sums_x86_64=(sha256sums_x86_64_baseline)
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
