# Maintainer: pysen <pysen {a|t} svartavillan {d|o|t} se>
pkgname=keptn-bin
pkgdesc="The Keptn CLI includes commands to perform various tasks to manage the Keptn installation and projects"
pkgver=1.3.0
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
    b2sums+=('325f1d7daf2ac9b46e414b7b906af2fdd2d7ca662db2b56d215126511a497d0e79012f91df66aef398ee1ef92db68c7df3a98a3f4f23fb20126c7737a6c594ff')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('e686cce83fd47c3ce4d8a090b210cab56c39fbbbc16b60eb43e9691acadc020077b6f54a51e2921eea3a3e8d9f092dc8f96590e5685cd9a4bb5f2728e2f8b385')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('41776e64bacfa88b05f6fcdc69863358aab21e53b2094bb5c73aa25daff8bde5f8273224ded336c019e2eec38a7e9ef9f1a21d14150d5258555e1fac23c60709')
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
