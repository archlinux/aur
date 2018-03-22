# MAintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: Jguer <joaogg3@gmail.com>
pkgname="yay-git"
_pkgname="yay"
pkgver=4.505.r63.g82124c1
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Jguer/yay"
license=('GPL')
options=('!strip' '!emptydirs')
depends=('sudo')
optdepends=('git: devel update support')
makedepends=('git' 'go')
conflicts=('yay-bin' 'yay')
provides=('yay')
source=("yay::git+https://github.com/Jguer/yay.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  mkdir -p "$GOPATH"
  rm -rf "$GOPATH/src"
  ln -sf "$srcdir/$_pkgname/vendor" "$GOPATH/src"
}

build() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir/$_pkgname"
  go build -v -o $_pkgname -ldflags "-s -w -X main.version=${pkgver}"
}

package() {
  _output="${srcdir}/$_pkgname"
  install -Dm755 "${_output}/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"

  # Install manpage
  install -Dm644 "${_output}/doc/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Install bash completion
  install -Dm644 "${_output}/completions/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"

  # Install zsh completion
  install -Dm644 "${_output}/completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"

  # Install fish completion
  install -Dm644 "${_output}/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"
}
