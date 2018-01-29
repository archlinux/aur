# MAintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: Jguer <joaogg3@gmail.com>
VCS="git"
pkgname="yay-git"
pkgver=99
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Jguer/yay"
license=('GPL')
options=('!strip' '!emptydirs')
depends=('sudo')
makedepends=("${VCS}" 'go')
conflicts=('yay-bin' 'yay')
provides=('yay')
source=("git+https://github.com/Jguer/yay/")
md5sums=("SKIP")

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  mkdir -p "$GOPATH"
  rm -rf "$GOPATH/src"
  ln -sf "$srcdir/${pkgname%-${VCS}}/vendor" "$GOPATH/src"
}

build() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir/${pkgname%-${VCS}}"
  go build -v -o ${pkgname%-${VCS}} -ldflags "-s -w -X main.version=${pkgver}"
}

package() {
  _output="${srcdir}/${pkgname%-${VCS}}"
  install -Dm755 "${_output}/${pkgname%-${VCS}}" "${pkgdir}/usr/bin/${pkgname%-${VCS}}"

  # Install manpage
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Install bash completion
  install -Dm644 "${_output}/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/yay"

  # Install zsh completion
  install -Dm644 "${_output}/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_yay"

  # Install fish completion
  install -Dm644 "${_output}/yay.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"
}
