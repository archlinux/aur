# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

_name=telepresence
pkgname=${_name}2
pkgver=2.27.0 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=(any)
depends=(sshfs)
makedepends=('go' 'git' 'make' 'jq' 'fuse2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3bc2cce8a2db11ab4744bcd027a9b85510d3cc229ca85f56ec8ab5cb425a38aa49b6334ecee2766d9a387508ae707f73b06014a7242a8efdc4ee9846c77d79e0')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  TELEPRESENCE_VERSION=v${pkgver} make build
  install -Dm755 ./build-output/bin/${_name} "${pkgdir}/usr/bin/${_name}"
  "${pkgdir}/usr/bin/${_name}" completion zsh >"$srcdir/zsh_${_name}"
  "${pkgdir}/usr/bin/${_name}" completion fish >"${srcdir}/fish_${_name}"
  "${pkgdir}/usr/bin/${_name}" completion bash >"$srcdir/bash_${_name}"
  install -D -m 0644 "$srcdir/zsh_${_name}" "$pkgdir/usr/share/zsh/site-functions/_${_name}"
  install -D -m 0644 "${srcdir}/fish_${_name}" "${pkgdir}/usr/share/fish/completions/${_name}.fish"
  install -D -m 0644 "$srcdir/bash_${_name}" "$pkgdir/usr/share/bash-completion/completions/${_name}"
}
