# Maintainer: eomanis at web dot de

_appname='freetz-tools'
pkgname="${_appname}-git"
pkgver=r14389.b8cb05c9e
pkgrel=1
pkgdesc="Development tools of the Freetz project"
arch=('x86_64')
url='https://freetz.github.io/'
license=('GPL2')
depends=('sed')
makedepends=('git')
conflicts=("$_appname")
provides=("$_appname")
source=("${_appname}::git+https://github.com/Freetz/freetz.git")
sha384sums=('SKIP')

build() {
	
	cd "$srcdir"/"$_appname"
	make tools
}

pkgver() {
	
	cd "$srcdir"/"$_appname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	local binaries=()
	
	# Make a haphazard list of various binaries and scripts that look
	# useful
	binaries+=(avm-rle-decode)
	binaries+=(avm-rle-stream-length)
	binaries+=(bzimage2eva)
	binaries+=(eva2bzimage)
	binaries+=(eva2lzma)
	binaries+=(imagename2id)
	binaries+=(lzma2eva)
	binaries+=(mksquashfs2-lzma)
	binaries+=(mksquashfs3-multi)
	binaries+=(mksquashfs4-avm-be)
	binaries+=(mksquashfs4-avm-le)
	binaries+=(remove-nmi-vector)
	binaries+=(sfk)
	binaries+=(unsquashfs3-multi)
	binaries+=(unsquashfs4-avm-be)
	binaries+=(unsquashfs4-avm-le)
	
	cd -- "$srcdir"/"$_appname"/tools
	
	# Copy the binaries to /usr/bin
	mkdir --parents -- "${pkgdir}/usr/bin"
	cp --target "${pkgdir}/usr/bin" --no-dereference --preserve=links -- "${binaries[@]}"
	
	# Set the file permissions
	cd -- "${pkgdir}/usr/bin"
	chmod u=rwx,go=rx -- "${binaries[@]}"
}
