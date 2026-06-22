# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

_name=telepresence
pkgname=${_name}2
pkgver=2.29.0 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=(any)
depends=(sshfs)
makedepends=('go' 'git' 'make' 'jq' 'fuse2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d7f9cedee3b8bf0800b6cfd6ee5f9b6482ee94945876af038be866194c4810de44396cbcbe62ef64e9349386918a1093d3819fb69e405e785a1f752d7b3f53e2')

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
