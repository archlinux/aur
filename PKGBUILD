# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.7
pkgrel=1
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
install=helm2-bin.install
validpgpkeys=(
  '672C657BE06B4B30969C4A57461449C25E36B98E'  # Matthew Farina <matt@mattfarina.com>, https://keybase.io/mattfarina
)

sha256sums=('SKIP')

[ "${CARCH}" = "x86_64" ] && _CARCH=amd64 && sha256sums+=('4afe48da420e4c3adcccf8484f27991834e3a3838668103199f274f4fa6f2df2')
[ "${CARCH}" = "aarch64" ] && _CARCH=arm64 && sha256sums+=('966f47419571c28e923481413553956b05f682f7486fb47a32c62adcf3c4c5f1')
echo ${CARCH} | grep -E '^arm' &>/dev/null && _CARCH=arm && sha256sums+=('390bff179dae4e8dcf829d83e326b8b461a08525a70c91d7cf69e071c5fe684f')
[ "${CARCH}" = "i486" -o "${CARCH}" = "i686" ] && _CARCH=386 && sha256sums+=('ee716f2c86ace7735a726ad564a101fff32c74a1d23b45a2274ce090ed120877')

source=(
  "https://github.com/helm/helm/releases/download/v${pkgver}/helm-v${pkgver}-linux-${_CARCH}.tar.gz.asc"
  "https://get.helm.sh/helm-v${pkgver}-linux-${_CARCH}.tar.gz"
)

package(){
    cd "${srcdir}/linux-${_CARCH}"
    install -Dm755 helm "${pkgdir}/usr/bin/helm2"
    install -Dm755 tiller "${pkgdir}/usr/bin/tiller"
    ./helm completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/helm2"
    ./helm completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_helm2"
}
