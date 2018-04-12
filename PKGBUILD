# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=geneconv
pkgver=1.81a
pkgrel=1
pkgdesc="Statistical Tests for Detecting Gene Conversion"
arch=("i686" "x86_64")
url="https://www.math.wustl.edu/~sawyer/geneconv"
source=("$url/unix.source.tar.gz"
        "$url/unix.examples.tar.gz"
		"$url/gconvdoc.pdf"
		"disable-logging.patch")
sha256sums=("9423bad39fc729ac8150d0630c82ca3452d30ba0f5da862a76a7358c06d0831c"
	"58e26a065c4ddf055cad403a30c2482db500e19de6ff6a2116b2d91aaee6b7a1"
	"14f91fe7437e115241cad83b1c0587791998498d085e58b8699186edb6735cd2"
	"d61c5ef686cd47a8f2bb6e894535ce78cb47b2b7c2a53c4a3d6ec1c6a153a068")

prepare() {
	cd "$srcdir"/unix.source
	patch -p0 -i ../disable-logging.patch
	sed -i 's/getline/getline2/g' geneconv_helper.c
	sed -i 's/-O3/$CFLAGS/' makgconv.csh
}

build() {
	cd "$srcdir"/unix.source
	sh makgconv.csh
}

package() {
	install -Dm 644 gconvdoc.pdf "$pkgdir"/usr/share/doc/$pkgname/documentation.pdf

	cd "$srcdir"/unix.source
	mkdir -p "$pkgdir"/usr/bin
	install -m 755 geneconv geneconv_helper "$pkgdir"/usr/bin/

	mkdir -p "$pkgdir"/usr/share/$pkgname/examples
	cp "$srcdir"/unix.examples/* "$pkgdir"/usr/share/$pkgname/examples
	chmod +x "$pkgdir"/usr/share/$pkgname/examples/dosamps.csh
}
