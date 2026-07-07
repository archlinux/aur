# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu>

pkgname=argo-bin
pkgver=4.0.7
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
sha256sums_x86_64=('1bb635c42d0bedf9fc6ae105962638c04244b4ff26b96069a06a6a01929add97')
sha256sums_aarch64=('eb1fbccc7a2de9468805b112da69c9af83217597fcdc31ea077f696494cd23ed')

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
