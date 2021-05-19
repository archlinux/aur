# Maintainer: eomanis at web dot de

_appname='freetz-ng-tools'
pkgname="${_appname}-git"
pkgver=r17445.bbc243477
pkgrel=1
pkgdesc="Development tools of the Freetz-NG project"
arch=('x86_64')
url='https://freetz-ng.github.io/freetz-ng/'
license=('GPL2')
depends=('sed')
makedepends=('git' 'python' 'svn' 'unzip' 'wget' 'lib32-glibc' 'lib32-gcc-libs')
conflicts=("$_appname" 'freetz-tools' 'freetz-tools-git')
provides=("$_appname" 'freetz-tools')
replaces=('freetz-tools-git')
source=("${_appname}::git+https://github.com/Freetz-NG/freetz-ng.git")
sha384sums=('SKIP')

pkgver() {

	cd "$srcdir"/"$_appname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

	cd "$srcdir"/"$_appname"
	make tools
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
