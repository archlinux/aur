# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contributor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bun-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=('bun')
sha256sums_x86_64=('a53f7e19c84d0b7be67858131741b3cf22f3581ac241c47f0c54552b60a71c2c')
sha256sums_aarch64=('ffd30a0f6891a20ace2222a50823d45f92a80c3d2b33b2bcfa354bc7dc71b39b')
_baseline=''
_baseline_sha256sums='6de3e07cf38c0d44654a886a99b78a97a615b563c717796ad44591a0c8304390'
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
