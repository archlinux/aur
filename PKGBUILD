# Maintainer: nezu <nezu@nezu.cc>

pkgname=wch-ch56x-isp
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple WCH MCU tool to flash over usb (compatible with WCH CH569 & CH565)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/hydrausb3/wch-ch56x-isp"
license=('custom: none')
depends=('libusb')
source=(
	"${pkgname}::git+https://github.com/hydrausb3/wch-ch56x-isp.git#tag=v${pkgver}"
	"cargs::git+https://github.com/likle/cargs.git#commit=5949a20a926e902931de4a32adaad9f19c76f251"
	"69-wch-ch56x-isp.rules"
)
sha256sums=('22fe733384d7480ed7ee65e13240e2b50799c5c2a7a3c2b007d450c1ec3c97fa'
            '6153f3866d6589486656fcfda1b415df0e5012e2fbeacaf0ef59ddad76ee5f6c'
            'f66025433686b5220155edf7b9f8e6c5649ee8ce27e2ac1bb633ffbf02c3fb77')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.cargs.url "$srcdir/cargs"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -Dm644 "$srcdir/69-wch-ch56x-isp.rules" "$pkgdir/usr/lib/udev/rules.d/69-wch-ch56x-isp.rules"
}
