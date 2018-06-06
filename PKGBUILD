# Maintainer: Wei Li <wei@hyper.sh>
pkgname=runv-git
pkgver=v0.4.0.r1229.565496c
pkgrel=1
pkgdesc="Hypervisor-based Runtime for OCI"
arch=('x86_64' 'i686')
url="https://github.com/hyperhq/runv"
license=('Apache')
depends=('qemu' 'hyperstart')
makedepends=('git' 'libvirt' 'device-mapper' 'automake' 'autoconf' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export GOPATH="${srcdir}/go"
	local _srcpath="src/github.com/hyperhq/"
	install -d "$GOPATH/$_srcpath"
	ln -sf "$(pwd)" "$GOPATH/$_srcpath/${pkgname%-git}"
	cd "$GOPATH/$_srcpath/${pkgname%-git}"

	./autogen.sh
	./configure --prefix=/usr --without-xen
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D runv "$pkgdir/usr/bin/runv"
}
