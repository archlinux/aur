# Maintainer: pysen <pysen {a|t} svartavillan {d|o|t} se>
pkgname=keptn-bin
pkgdesc="The Keptn CLI includes commands to perform various tasks to manage the Keptn installation and projects"
pkgver=1.4.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/keptn/keptn"
license=('Apache')
optdepends=(
    'kubectl'
  )
conflicts=('keptn')
provides=('keptn')
source=()
b2sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('92ba4aaef38af1629007a4fc846746396395581ff0ab23194edc747d1bddb1bfb9b580150609d7fce7bd3495722c41215602ed93f2a151b1775bba513187252d')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('15d37df54de9b9c71e3bbdf185ac8c62b2e00cfd22a5a6709f6987b69fb656192ad68832779d8a0cdd0e891c2ea2bf763b6628a67a84d12a9d2e548fa281aa41')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('755ff705bea986541bb017240f530a803abe51840335e18dffd8d407a08fa393b7b436030496755573c151ccd1b55e77c212914eedcbd451bc6a802bb0b62b9f')
    ;;
esac

source+=(${pkgname/-bin/}-${pkgver}-${_pkgarch}::"https://github.com/keptn/keptn/releases/download/${pkgver}/${pkgname/-bin/}-${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  _output="${srcdir}/${pkgname/-bin/}-${pkgver}-${_pkgarch}"
  install -Dm 0755 "${pkgname/-bin/}-${pkgver}-linux-${_pkgarch}" "${pkgdir}/usr/bin/keptn"
  # Disable daily automatic version check or else the completion output is incorrect
  ${pkgdir}/usr/bin/keptn set config AutomaticVersionCheck false
  # Shell completions
  mkdir -p completions
  ${pkgdir}/usr/bin/keptn completion bash > completions/keptn
  ${pkgdir}/usr/bin/keptn completion zsh  > completions/_keptn
  ${pkgdir}/usr/bin/keptn completion fish > completions/keptn.fish
  install -D -m 0644 completions/keptn ${pkgdir}/usr/share/bash-completion/completions/keptn
  install -D -m 0644 completions/_keptn ${pkgdir}/usr/share/zsh/site-functions/_keptn
  install -D -m 0644 completions/keptn.fish ${pkgdir}/usr/share/fish/vendor_completions.d/keptn.fish
}
