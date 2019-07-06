# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=origin-client
pkgdesc="Openshift client"
pkgver=4.1.0
pkgrel=2
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
makedepends=('go-pie' 'rsync')
validpgpkeys=('0E2CFB1B72F087ACF089B41E3D16906B4F1C5CB3')  # Clayton Coleman (Red Hat key) <ccoleman@redhat.com>
source=("git+https://github.com/openshift/origin#tag=v${pkgver}?signed")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/origin"
  unset GOPATH
  make WHAT=cmd/oc
  hack/generate-docs.sh
}

package() {
  cd "${srcdir}/origin"
  install -Dm755 _output/local/bin/linux/amd64/oc -t "$pkgdir/usr/bin"
  install -Dm644 docs/man/man1/* -t "$pkgdir/usr/share/man/man1"

  "$pkgdir/usr/bin/oc" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/oc"
  "$pkgdir/usr/bin/oc" completion zsh | sed 's/kubectl/oc/g' | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_oc"
}
