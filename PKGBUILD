# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=nsc-bin
_pkgname=nsc
pkgver=2.15.1
pkgrel=1
pkgdesc="Tool for creating NATS operator, account and user access configurations (prebuilt binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/nats-io/nsc"
license=('Apache-2.0')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!debug')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::${_release}/nsc-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-arm64.zip::${_release}/nsc-linux-arm64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7.zip::${_release}/nsc-linux-armv7.zip")
# From upstream SHA256SUMS-nsc.txt
sha256sums_x86_64=('d0a69120fd81ed3b5ccff8285f866b16a807eaedd50f4d75a2c9300539aecab1')
sha256sums_aarch64=('eeace5acb08faaf91d2079ad2977ec8cce922c7567edb8a593dee32c07a3f0ac')
sha256sums_armv7h=('8a1a82b154d709dc2c97986022fe883af5b26c1ff967259cad3d729a29539dce')

build() {
  # Completions; nsc writes a config dir on first run, so keep it out of $HOME.
  local sh
  for sh in bash zsh fish; do
    HOME="${srcdir}/home" XDG_CONFIG_HOME="${srcdir}/home/.config" XDG_DATA_HOME="${srcdir}/home/.local/share" \
      ./nsc completion "$sh" > "nsc.${sh}"
  done
}

package() {
  install -Dm755 nsc -t "${pkgdir}/usr/bin/"
  install -Dm644 nsc.bash "${pkgdir}/usr/share/bash-completion/completions/nsc"
  install -Dm644 nsc.zsh "${pkgdir}/usr/share/zsh/site-functions/_nsc"
  install -Dm644 nsc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nsc.fish"
}
