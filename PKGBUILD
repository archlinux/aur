# Maintainer: Hauke Stieler <mail@hauke-stieler.d>

pkgname=wiki2book
pkgver=0.6.1
pkgrel=3
pkgdesc="Wiki2book is a CLI tool to convert one or multiple Wikipedia articles into an eBook."
arch=("any")
url="https://github.com/hauke96/wiki2book"
license=("GPL-3.0")
depends=("pandoc")
optdepends=(
	"imagemagick: Default but optional tool to convert and process images"
	"ttf-dejavu: Font used in the default style"
	"librsvg: Default but optional tool used to convert SVGs into raster images")
makedepends=("go>=1.24")
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

  # Go into source code folder inside repo and download dependencies with read
  # and write permissions in the cache (write permissions are important for
  # cleanup after package creation).
  cd "wiki2book/src"
  go mod download -modcacherw
  cd ..
  
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

  install -d "${pkgdir}"/usr/share/doc/wiki2book/doc/
  install -d "${pkgdir}"/usr/share/doc/wiki2book/projects/astronomie/
  install -Dm644 wiki2book/README.md "${pkgdir}"/usr/share/doc/wiki2book/
  install -Dm644 wiki2book/LICENSE "${pkgdir}"/usr/share/doc/wiki2book/
  # TODO: Enable this when the changelog file exists: install -Dm644 wiki2book/CHANGELOG.md "${pkgdir}"/usr/share/doc/wiki2book/
  install -Dm644 wiki2book/doc/* "${pkgdir}"/usr/share/doc/wiki2book/doc/
  install -Dm644 wiki2book/projects/de/astronomie/* "${pkgdir}"/usr/share/doc/wiki2book/projects/astronomie/ # Just to provide a real world project

  install -Dm644 wiki2book/wiki2book-completion-bash "${pkgdir}"/usr/share/bash-completion/completions/wiki2book
  install -Dm644 wiki2book/wiki2book-completion-fish "${pkgdir}"/usr/share/fish/vendor_completions.d/wiki2book.fish
  install -Dm644 wiki2book/wiki2book-completion-zsh "${pkgdir}"/usr/share/zsh/site-functions/_wiki2book
}
