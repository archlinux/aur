# Maintainer: 3x071c <dev ατ 3x071c δοτ com>

_author='evilsocket'
_base='opensnitch'
_url="https://github.com/$_author/$_base"
_kver='5.8'
pkgname="$_base-ebpf-module"
pkgver=1.4.0
pkgrel=1
pkgdesc="eBPF process monitor module for $_base"
arch=('any')
url="$_url/tree/master/ebpf_prog"
license=('GPL3')
depends=("$_base=$pkgver")
makedepends=('clang' 'llvm' 'bc' 'rsync')
source=("$pkgname-${pkgver}_$_base-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz"
		"$pkgname-${pkgver}_linux-$_kver.tar.gz::https://github.com/torvalds/linux/archive/v$_kver.tar.gz")
b2sums=('cce63863957e01cedb4e202412e0806f21f39a8c22fca3cda5ef21a97a024a56cee88ae0b9e517277d0d4fae56e122600fa7fb1be860e6803c172feb68dba666'
		'71bdb39b5477d244cfc735e98387f74bffd7d35f32faf7db6097d2d51d5ee9af644c1ad6a9d1a8f58713689e66ca8f881e0728031a0903e2ef5f82b209e516da')

#pkgver() {
#	curl --silent "https://api.github.com/repos/$_author/$_base/releases/latest" | grep '"tag_name":' | perl -ne '/(?<="tag_name":).*"v(.+?)"/; print $1' # Incompatible with checksums and bumping _kver :(
#}

prepare() {
  	cd "$srcdir/linux-$_kver"
  		patch "$srcdir/linux-$_kver/tools/lib/bpf/bpf_helpers.h" < "$srcdir/$_base-$pkgver/ebpf_prog/file.patch"
  		cp "$srcdir/$_base-$pkgver/ebpf_prog/opensnitch.c" "$srcdir/$_base-$pkgver/ebpf_prog/Makefile" "$srcdir/linux-$_kver/samples/bpf"
  		yes "" | make oldconfig
  		make prepare
}

build() {
  	cd "$srcdir/linux-$_kver"
  		make headers_install
  		cd "$srcdir/linux-$_kver/samples/bpf"
  		make
  		llvm-strip -g "$srcdir/linux-$_kver/samples/bpf/opensnitch.o"
}

package() {
  	install -Dm644 "$srcdir/linux-$_kver/samples/bpf/opensnitch.o" -t "$pkgdir/etc/opensnitchd"
}

# vim: set noet ci pi sts=0 sw=4 ts=4 syntax=bash:
