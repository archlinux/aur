# Maintainer: hzmi <contact@hzmi.xyz>
pkgname=strait-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A virtual service between Kubernetes clusters at different sites"
arch=('x86_64' 'aarch64')
url="https://strait.tako.id"
license=('Apache-2.0')
provides=('strait')
conflicts=('strait')
options=('!strip' '!debug')
source_x86_64=("https://github.com/takodotid/strait/releases/download/v${pkgver}/strait_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/takodotid/strait/releases/download/v${pkgver}/strait_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b31e8f170947272808c11f29cd9c138b2d431659b9aa3bf75d34f2f363454981')
sha256sums_aarch64=('b31b94eeb1aced90b4a2232cd6f8e1708a7db4c79e989ff5c3bc0daeb17e7d00')

package() {
  cd strait_v"${pkgver}"_linux_*/
  install -Dm755 strait "${pkgdir}/usr/bin/strait"
  # kubectl runs it as "kubectl strait", and completes it with kubectl_complete-strait.
  ln -s strait "${pkgdir}/usr/bin/kubectl-strait"
  ln -s strait "${pkgdir}/usr/bin/kubectl_complete-strait"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/man1/*.1
  install -Dm644 -t "${pkgdir}/usr/share/doc/strait" README.md SKILL.md
  ./strait completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/strait"
  ./strait completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_strait"
  ./strait completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/strait.fish"
}
