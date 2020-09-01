# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Ben Morgan <neembi@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: bartus <arch-user-repo\at\bartus.33mail.com>

pkgname=repoctl-git
pkgver=0.21.r0.g92ed55f
pkgrel=1
pkgdesc="An AUR helper that also simplifies managing local Pacman repositories (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cassava/repoctl"
license=('MIT')
depends=('pacman')
makedepends=('go' 'xz' 'git')
conflicts=('repoctl')
provides=('repoctl')
source=("$pkgname::git+https://github.com/cassava/repoctl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname}"

  # Respect system build options
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  # Build the binary
  go build -v -o "${pkgname%-git}"

  # Generate the completion files
  ./repoctl completion zsh > completion.zsh
  ./repoctl completion bash > completion.bash
  ./repoctl completion fish > completion.fish
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"

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

