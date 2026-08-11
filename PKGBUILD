# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>
# Contributor: David Rodriguez <dissonant.tech@gmail.com>
# Contributor: Peter Smit <peter@smitmail.eu>

pkgname=argo-bin
pkgver=4.1.0
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
sha256sums_x86_64=('ad176b3bb64a7eb6666586a50001e4807ba0c98ab50bb4f2e87a465f07784ced')
sha256sums_aarch64=('426df551c35dff9a5065f22de15ffac81ec2377f316735864d50b4ffe2324259')

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
