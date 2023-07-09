# Maintainer: pysen <pysen {a|t} svartavillan {d|o|t} se>
pkgname=keptn-bin
pkgdesc="The Keptn CLI includes commands to perform various tasks to manage the Keptn installation and projects"
pkgver=1.4.0
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
    b2sums+=('faa7e6496f969493cc81ef93a2d58237bfa7a3b1b03c50ab7754c470391244ba58a144fcc1f53b4ec94ccf8c9877b10a0131e178eae74dc1d13408091d585973')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('e8e15efecf4208980b0679040ef7e557774542493066b224bdf7060a246353a50c060a12ca932581231e3f6db27bd17c842be829fb730124757eb0c274b68bf7')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('174609d3490ffc6a82307424bfa88b59f9857ee99dcfb88a34108cb34a24740209f686c96524b1d14fe987a1b9963bb716a4262a5d2835554b3cb39e0970c44f')
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
