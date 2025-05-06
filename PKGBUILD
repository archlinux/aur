# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

_appname='freetz-ng-tools'
pkgname="${_appname}-git"
pkgver=r25426.d3f49c296
pkgrel=1
pkgdesc="Development tools of the Freetz-NG project"
arch=('x86_64')
url='https://freetz-ng.github.io/freetz-ng/'
license=('GPL-2.0-only')
depends=('sed' 'libz.so=1-64')
makedepends=('git' 'python' 'svn' 'unzip' 'wget' 'lib32-glibc' 'lib32-gcc-libs')
# 2024-04-18 dreieck@aur.archlinux.org says build fails if the system
# has link-time optimization enabled by default in its build configuration
options+=('!lto')
conflicts=("$_appname" 'freetz-tools' 'freetz-tools-git')
provides=("$_appname" 'freetz-tools')
replaces=('freetz-tools-git')
source=("${_appname}::git+https://github.com/Freetz-NG/freetz-ng.git")
sha384sums=('SKIP')

pkgver() {

	cd -- "$srcdir"/"$_appname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

	cd -- "$srcdir"/"$_appname" || return 1
	make tools
}

package() {
	local binaries=()

	# Make a haphazard list of various binaries and scripts that look
	# useful
	#binaries+=(avm-rle-decode)
	#binaries+=(avm-rle-stream-length)
	binaries+=(bzimage2eva)
	binaries+=(eva2bzimage)
	binaries+=(eva2lzma)
	#binaries+=(imagename2id)
	binaries+=(lzma2eva)
	binaries+=(mksquashfs2-lzma)
	binaries+=(mksquashfs3-multi)
	binaries+=(mksquashfs4-avm-be)
	binaries+=(mksquashfs4-avm-le)
	binaries+=(remove-nmi-vector)
	#binaries+=(sfk)
	binaries+=(unsquashfs3-multi)
	binaries+=(unsquashfs4-avm-be)
	binaries+=(unsquashfs4-avm-le)

	cd -- "$srcdir"/"$_appname"/tools || return 1

	# Copy the binaries to /usr/bin
	mkdir --parents -- "${pkgdir}/usr/bin"
	cp --target "${pkgdir}/usr/bin" --no-dereference --preserve=links -- "${binaries[@]}"

	# Set the file permissions
	cd -- "${pkgdir}/usr/bin" || return 1
	chmod u=rwx,go=rx -- "${binaries[@]}"
}
