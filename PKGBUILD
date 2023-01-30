# Maintainer: Ch4s3r <lamprecht.patrick1@gmail.com>
pkgname=argocd-autopilot-bin
pkgver=v0.4.11
pkgrel=1
pkgdesc="Argo-CD Autopilot is a tool which offers an opinionated way of installing Argo-CD and managing GitOps repositories."
arch=(x86_64 aarch64)
url="https://github.com/argoproj-labs/argocd-autopilot"
license=('Apache')
provides=(argocd-autopilot)

pkgver() {
  curl -s "https://api.github.com/repos/argoproj-labs/argocd-autopilot/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/'
}

package() {
    if [[ $CARCH == aarch64 ]]; then
        ARCH=arm64
    else
        ARCH=amd64
    fi

    curl -L --output - https://github.com/argoproj-labs/argocd-autopilot/releases/download/$pkgver/argocd-autopilot-linux-$ARCH.tar.gz | tar zx

    mv argocd-autopilot-* argocd-autopilot
    install -Dm755 argocd-autopilot "$pkgdir/usr/bin/argocd-autopilot"

    ./argocd-autopilot completion bash > completion
    install -Dm755 completion "$pkgdir/usr/share/bash-completion/completions/argocd-autopilot"

    ./argocd-autopilot completion bash > completion
    install -Dm755 completion "$pkgdir/usr/share/fish/vendor_completions.d/argocd-autopilot.fish"

    ./argocd-autopilot completion bash > completion
    install -Dm755 completion "$pkgdir/usr/share/zsh/site-functions/_argocd-autopilot"
}
