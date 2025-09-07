# Maintainer: Hauke Stieler <mail@hauke-stieler.d>

pkgname=wiki2book
pkgver=0.5.0
pkgrel=1
pkgdesc="Wiki2book is a CLI tool to convert one or multiple Wikipedia articles into an eBook."
arch=("any")
url="https://github.com/hauke96/wiki2book"
license=("GPL-3.0")
depends=("imagemagick" "pandoc")
optdepends=(
	"ttf-dejavu: Font used in the default style"
	"librsvg: Tool used to convert SVGs into raster images")
makedepends=("go>=1.23")
backup=()
conflicts=()
provides=("wiki2book=${pkgver}")
source=("git+https://github.com/hauke96/wiki2book#tag=v${pkgver}")
options=(!debug !lto)
sha256sums=("SKIP")

build() {
  cd ${srcdir}

  # Make go work
  export GOPATH="$srcdir"/gopath
  export GOBIN="$GOPATH"/bin

  # Go into repo folder
  cd "wiki2book"
  
  # Build wiki2book and place it into the current working dir.
  ./build.sh -o linux -a $CARCH -f wiki2book-bin

  ./wiki2book-bin completion bash > wiki2book-completion-bash
  ./wiki2book-bin completion fish > wiki2book-completion-fish
  ./wiki2book-bin completion zsh > wiki2book-completion-zsh
}

package() {
  cd "${srcdir}/"

  install -Dm755 wiki2book/wiki2book-bin "${pkgdir}"/usr/bin/wiki2book

  install -d "${pkgdir}"/usr/share/wiki2book/
  install -Dm644 wiki2book/configs/* "${pkgdir}"/usr/share/wiki2book/

  install -Dm644 wiki2book/wiki2book-completion-bash "${pkgdir}"/usr/share/bash-completion/completions/wiki2book
  install -Dm644 wiki2book/wiki2book-completion-fish "${pkgdir}"/usr/share/fish/vendor_completions.d/wiki2book.fish
  install -Dm644 wiki2book/wiki2book-completion-zsh "${pkgdir}"/usr/share/zsh/site-functions/_wiki2book
}
