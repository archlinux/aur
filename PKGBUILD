# Maintainer: azerty-xmpp
pkgname=dwl-azerty
pkgver=0.7
pkgrel=1
pkgdesc="Custom minimal build of dwl with custom defaults"
arch=('x86_64')
url="https://codeberg.org/dwl/dwl"
license=('GPL')
depends=('wlroots0.18')
makedepends=('wayland-protocols')
source=("https://codeberg.org/dwl/dwl/releases/download/v$pkgver/dwl-v$pkgver.tar.gz"
        "config.h")
sha256sums=('16e1412385f5fecaea997f734cb290f2bc412929da5b523c7c5180c6bd9402ea'
            'SKIP')

prepare() {
	cd "$srcdir/dwl-v$pkgver"
	
	# 1. Pull in your custom config
	cp -f "$srcdir/config.h" config.h

	# 3. Ensure XWAYLAND is absolutely disabled (comment out the block)
	sed -i 's/^XWAYLAND = -DXWAYLAND/#XWAYLAND = -DXWAYLAND/' config.mk
	sed -i 's/^XLIBS = xcb xcb-icccm/#XLIBS = xcb xcb-icccm/' config.mk

	# 4. Inject Maximum Compiler Optimizations (O3, native architecture, Link-Time Optimization)
	sed -i 's/^CFLAGS   = .*/CFLAGS   = -O3 -march=native -flto -pipe -pedantic -Wall -Wextra -Wdeclaration-after-statement -Wno-unused-parameter -Wno-sign-compare -Wshadow -Wno-missing-field-initializers -Werror=strict-prototypes -Werror=implicit -Werror=return-type -Werror=incompatible-pointer-types ${INCS} ${CPPFLAGS}/' config.mk
	sed -i 's/^LDFLAGS  = .*/LDFLAGS  = -flto -Wl,-O1,--as-needed,-z,pack-relative-relocs ${LIBS}/' config.mk
}

build() {
	cd "$srcdir/dwl-v$pkgver"
	make
}

package() {
	cd "$srcdir/dwl-v$pkgver"
	
	# Install the stripped binary as 'dwlvm'
	install -s -Dm755 dwl "$pkgdir/usr/bin/dwlvm"
	
	# Install man page and license
	install -Dm644 dwl.1 "$pkgdir/usr/share/man/man1/dwlvm.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
