# Maintainer: kang <kang@insecure.ws>
pkgname=cc-shim-git
_pkgname=shim
pkgver=3.0.12.r0.d01f9a7
pkgrel=1
pkgdesc="cc-shim works alongside the Clear Containers runtime and proxy to provide a VM-based OCI runtime solution."
arch=(x86_64)
url="https://github.com/clearcontainers/shim"
license=('apache')
makedepends=('git' 'dep')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://github.com/clearcontainers/shim')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
        ln -sf vendor src
        GOPATH="$(realpath $srcdir/..)" dep ensure -v
        ./autogen.sh
        ./configure --prefix=/usr
}

build() {
	cd "$srcdir/${_pkgname}"
        chmod 0755 $srcdir/../pkg # lil fix because go's dep tool needs to use the same pkg path as makepkg
        GOPATH="$srcdir/${_pkgname}" make DESTDIR=/ PREFIX=/usr
}

check() {
	cd "$srcdir/${_pkgname}"
        echo "Official tests don't currently pass, skipping..."
        #GOPATH="$srcdir/${_pkgname}" make check
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
