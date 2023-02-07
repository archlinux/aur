# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=checkpointctl-git
_pkgname=checkpointctl
pkgver=76.6476d53
pkgrel=1
pkgdesc="Tool to manipulate Kubernetes and Podman checkpoints"
arch=('any')
url="https://github.com/checkpoint-restore/checkpointctl"
license=('APACHE')
makedepends=('go' 'git' 'bash-bats')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

check() {
  make -C "${srcdir}/${_pkgname}" test
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.name=${_pkgname}" .
}

package() {
  "${srcdir}/${_pkgname}/${_pkgname}" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  "${srcdir}/${_pkgname}/${_pkgname}" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  "${srcdir}/${_pkgname}/${_pkgname}" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
