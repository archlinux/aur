# Maintainer: Ronan Pigott <ronan@rjp.ie>

pkgname=preserve-dscp-git
_pkgname=preserve-dscp
pkgver=0.1
pkgrel=1
pkgdesc='Preserve DSCP marking outside of a wireguard tunnel'
arch=('x86_64')
url='https://github.com/xdp-project/bpf-examples'
license=('GPL2')
makedepends=('git' 'clang' 'llvm' 'bpf' 'libmnl' 'lib32-glibc')
depends=('libbpf')
source=(
	"git+https://github.com/xdp-project/bpf-examples"
	"preserve-dscp@.service"
)
sha256sums=('SKIP'
            '8070158ae5a3ad5e9e694954d03e0e15ceb33ded57e9a35a6f5070499ae5f101')

build() {
	cd bpf-examples
	FORCE_SYSTEM_LIBBPF=1 ./configure --prefix=/usr
	make preserve-dscp
}

package() {
	mkdir -p $pkgdir/opt/$_pkgname
	install -Dm755 bpf-examples/preserve-dscp/preserve-dscp $pkgdir/opt/$_pkgname/
	install -Dm755 bpf-examples/preserve-dscp/preserve_dscp_kern.o $pkgdir/opt/$_pkgname/
	mkdir -p $pkgdir/usr/lib/systemd/system
	install -Dm644 preserve-dscp@.service $pkgdir/usr/lib/systemd/system/
}
