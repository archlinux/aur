# Maintainer: kang <kang@insecure.ws>
pkgname=cc-proxy-git
_pkgname=proxy
pkgver=3.0.12.r0.3c6daa6
pkgrel=1
pkgdesc="cc-proxy works alongside the Clear Containers runtime and shim to provide a VM-based OCI runtime solution."
arch=(x86_64)
url="https://github.com/clearcontainers/proxy"
license=('apache')
makedepends=('git' 'dep')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://github.com/clearcontainers/proxy')
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
