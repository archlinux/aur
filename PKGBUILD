# Maintainer: Ben Morgan <cassava@iexu.de>
# vim: set ts=2 sw=2:
pkgname=repoctl
pkgver=0.21
pkgrel=3
pkgdesc="An AUR helper that also simplifies managing local Pacman repositories"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'xz')
options=('!strip')
source=(https://github.com/cassava/repoctl/releases/download/v${pkgver}/repoctl-${pkgver}.tar.gz)
md5sums=('99e172a3734a0269435710adaf449f3e')

build() {
  cd "${pkgname}-${pkgver}"

  # Respect system build options
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  # Build the binary
  go build -v -o "${pkgname}"

  # Generate the completion files
  ./repoctl completion zsh > completion.zsh
  ./repoctl completion bash > completion.bash
  ./repoctl completion fish > completion.fish
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install repoctl program
  install -Dm755 repoctl "${pkgdir}/usr/bin/repoctl"

  # Install documentation files
  install -d "${pkgdir}/usr/share/doc/repoctl"
  install -m644 README.md NEWS.md "${pkgdir}/usr/share/doc/repoctl/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/repoctl/LICENSE"

  # Install completion files
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_repoctl"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/repoctl"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/repoctl.fish"
}

