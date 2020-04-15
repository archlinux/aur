# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.6
pkgrel=2
pkgdesc="The Kubernetes Package Manager"
arch=(
  "x86_64"  # amd64
  "aarch64"  # arm64
  "arm" "armv6h" "armv7h"  # arm
  "i486" "i686"  # i386
)
url="https://helm.sh/"
license=("Apache")
provides=("helm2" "kubernetes-helm2" "helm" "kubernetes-helm")
conflicts=("helm2" "kubernetes-helm2")
makedepends=("grep")
validpgpkeys=(
  '672C657BE06B4B30969C4A57461449C25E36B98E'  # Matthew Farina <matt@mattfarina.com>, https://keybase.io/mattfarina
)

[ "${CARCH}" = "x86_64" ] && _CARCH=amd64 && sha256sums=(
  'e38fea59bc382feb0f80322d582266465d76ab72acdc0079c2350cc3fd8a3f4c'
  'SKIP'
)

[ "${CARCH}" = "aarch64" ] && _CARCH=arm64 && sha256sums=(
  '115bef1e1171c3d71df3475ac4bc3ee7a43a5632591fafb6add797b65008026a'
  'SKIP'
)

echo ${CARCH} | grep -E '^arm' &>/dev/null && _CARCH=arm && sha256sums=(
  '5c72eb00e5273297dbafb570607bcff8c59b06096d50ac0d74872528992f9d70'
  'SKIP'
)

[ "${CARCH}" = "i486" -o "${CARCH}" = "i686" ] && _CARCH=386 && sha256sums=(
  '72b5f80e97c7b385a01c525bdd2d9c10b7a7b472f99ca99d3e5f55a4ead9ac40'
  'SKIP'
)

source=(
  "https://get.helm.sh/helm-v${pkgver}-linux-${_CARCH}.tar.gz"
  "https://github.com/helm/helm/releases/download/v${pkgver}/helm-v${pkgver}-linux-${_CARCH}.tar.gz.asc"
)

package(){
    cd "${srcdir}/linux-${_CARCH}"
    install -Dm755 helm "${pkgdir}/usr/bin/helm2"
    install -Dm755 tiller "${pkgdir}/usr/bin/tiller2"
    ./helm completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/helm2"
    ./helm completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_helm2"
}
