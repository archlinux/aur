# Maintainer: agony <27015 at riseup dot net>

pkgname=ghostunnel
pkgver=1.11.5
pkgrel=1
pkgdesc='TLS proxy with mutual authentication for securing non-TLS services'
arch=('x86_64' 'aarch64')
url='https://github.com/ghostunnel/ghostunnel'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e422caf02e8fc2082f749f56b37dd64133da0e288cebdfdde52be8537ead69a')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=vendor -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.version=v${pkgver}" -o ghostunnel .
  ./ghostunnel --help-custom-man > ghostunnel.1
  ./ghostunnel --completion-script-bash > ghostunnel.bash
  ./ghostunnel --completion-script-zsh > ghostunnel.zsh
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=vendor -modcacherw'
  # The ACME tests write certmagic storage to XDG_DATA_HOME, ~/.local/share by default
  export XDG_DATA_HOME="${srcdir}/xdg-data"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ghostunnel -t "${pkgdir}/usr/bin"
  install -Dm644 ghostunnel.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 ghostunnel.bash "${pkgdir}/usr/share/bash-completion/completions/ghostunnel"
  install -Dm644 ghostunnel.zsh "${pkgdir}/usr/share/zsh/site-functions/_ghostunnel"
}
