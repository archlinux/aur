# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu>

pkgname=argo-bin
pkgver=4.1.2
pkgrel=1
pkgdesc="Argo Workflows: Get stuff done with Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/argoproj/argo-workflows"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("argo_${pkgver}_x86_64.gz::https://github.com/argoproj/argo-workflows/releases/download/v${pkgver}/argo-linux-amd64.gz")
source_aarch64=("argo_${pkgver}_aarch64.gz::https://github.com/argoproj/argo-workflows/releases/download/v${pkgver}/argo-linux-arm64.gz")
sha256sums_x86_64=('1edee3c25de0129e4d358a87591f04b89b522ceccb11975970d45217a3cd9cdd')
sha256sums_aarch64=('04e2e1e0fc6d738034ff356e5bc8b2b819f963bf007331df4606611b3fa967b6')

latestver() {
  gh api --paginate repos/argoproj/argo-workflows/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "argo-linux-amd64.gz") and any(.assets[]; .name == "argo-linux-arm64.gz")) | .tag_name' | head -1 | sed -E 's/^v//'
}

build() {
  chmod +x "argo_${pkgver}_${CARCH}"
}

check() {
  ./argo_${pkgver}_${CARCH} version
}

package() {
  install -Dm755 "argo_${pkgver}_${CARCH}" "${pkgdir}/usr/bin/argo"

  "${pkgdir}/usr/bin/argo" completion bash > argo.bash
  "${pkgdir}/usr/bin/argo" completion zsh > argo.zsh
  install -Dm644 argo.bash "${pkgdir}/usr/share/bash-completion/completions/argo"
  install -Dm644 argo.zsh "${pkgdir}/usr/share/zsh/site-functions/_argo"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Apache License 2.0
https://github.com/argoproj/argo-workflows/blob/main/LICENSE
EOF
}
