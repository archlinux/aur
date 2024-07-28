# Maintainer: Hauke Stieler <mail@hauke-stieler.d>

pkgname=wiki2book
pkgver=0.2.0
pkgrel=1
pkgdesc="Wiki2book is a CLI tool to convert one or multiple Wikipedia articles into an eBook."
arch=("any")
url="https://github.com/hauke96/wiki2book"
license=("GPL-3.0")
depends=("imagemagick")
optdepends=(
	"ttf-dejavu: Font used in the default style"
	"pandoc: Used as one possible way to create EPUB files")
makedepends=("go>=1.21")
backup=()
conflicts=()
provides=("wiki2book=${pkgver}")
source=("git+https://github.com/hauke96/wiki2book#tag=v${pkgver}")
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
}

package() {
  cd "${srcdir}/"

  install -Dm755 wiki2book/wiki2book-bin "${pkgdir}"/usr/bin/wiki2book

  install -d "${pkgdir}"/usr/share/wiki2book/configs/
  install -D -Dm644 wiki2book/configs/* "${pkgdir}"/usr/share/wiki2book/configs/
  install -Dm644 wiki2book/projects/style.css "${pkgdir}"/usr/share/wiki2book/style.css
}
