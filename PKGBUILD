# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>

_name=telepresence
pkgname=${_name}2
pkgver=2.27.4 # renovate: datasource=github-releases depName=telepresenceio/telepresence
pkgrel=1
url="https://github.com/telepresenceio/$_name"
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster"
license=('Apache-2.0')
arch=(any)
depends=(sshfs)
makedepends=('go' 'git' 'make' 'jq' 'fuse2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/telepresenceio/telepresence/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6e5c7d7dc89565619098e7123bd3abebc72e9eabb550433e31bd15245a5f7c9f449c7aac4e94cae6cf548136c26ed22b7746f1e8b6e9f0d56ede4b8aa2a34cdc')

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
