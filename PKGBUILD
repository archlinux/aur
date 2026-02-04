# Maintainer: wallabra <gr.wallabra@proton.me>
pkgbase="xcc-git"
pkgname=("xcc-git" "xcc-wcc-git" "xcc-common-git")
pkgver=0.1.6.r5.13987d67
pkgrel=1
arch=(x86_64)
url="https://github.com/tyfkda/xcc"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'npm' 'llvm')
replaces=()
backup=()
options=()
install=
source=('xcc::git+https://github.com/tyfkda/xcc' 'xcc-wrapper.sh' 'wcc-wrapper.sh')
noextract=()
sha256sums=('SKIP'
            'daaddbbe0fde9dcf65ad78616ba0ee484c9fb909bb764500595f72d8a0402b48'
            'b3f9ae61914b6e60e0a1a377f0cce721f5a69ee291354b2dffce958c612e987c')

pkgver() {
	cd "$srcdir/xcc"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/xcc"

	# Make xcc
	make

	# Make wcc
	npm ci
	make wcc
}

check() {
	cd "$srcdir/xcc"
	make -k test
}

package_xcc-common-git() {
	pkgdesc="Libraries and headers used by xcc, a very tiny, very fast C compiler, assembler, linker, and libc suite, which can target x86-64, aarch64, riscv64, and WASM."
	provides=("xcc-common")
	conflicts=("xcc-common")
	
	cd "$srcdir/xcc"

    install -d "$pkgdir/usr/lib/xcc/bin/lib"
    install -m644 lib/*.a "$pkgdir/usr/lib/xcc/bin/lib" # PLEASE FORGIVE ME!

    install -d "$pkgdir/usr/lib/xcc/bin/include"
    cp -a include/. "$pkgdir/usr/lib/xcc/bin/include/" # Again, I beg for your forgiveness

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_xcc-git() {
	pkgdesc="A very tiny, very fast C compiler, assembler, linker, and libc, which can target x86-64, aarch64, riscv64."
	provides=("xcc")
	conflicts=("xcc")
	depends=("xcc-common" "glibc"
		"sh") # due to wrapper script

	cd "$srcdir/xcc"

    install -d "$pkgdir/usr/lib/xcc/bin"
	install -m755 cc1 "$pkgdir/usr/lib/xcc/bin/cc1"
    install -m755 cpp "$pkgdir/usr/lib/xcc/bin/cpp"
    install -m755 as  "$pkgdir/usr/lib/xcc/bin/as"
    install -m755 ld  "$pkgdir/usr/lib/xcc/bin/ld"
	install -m755 xcc "$pkgdir/usr/lib/xcc/bin/xcc"
	
    install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/xcc-wrapper.sh" "$pkgdir/usr/bin/xcc"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_xcc-wcc-git(){
	pkgdesc="A very tiny, very fast C compiler, assembler, linker, and libc, which can directly output wasm files."
	provides=("wcc")
	conflicts=("wcc")
	depends=("xcc-common" "glibc"
		"sh") # due to wrapper script

	cd "$srcdir/xcc"

    install -d "$pkgdir/usr/lib/xcc/bin"
	install -m755 wcc "$pkgdir/usr/lib/xcc/bin/wcc"

	install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/wcc-wrapper.sh" "$pkgdir/usr/bin/wcc"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
