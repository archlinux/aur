# Maintainer: eNV25 <env252525@gmail.com>

pkgname=keyd
pkgver=1.3.0
pkgrel=4
arch=('x86_64' 'aarch64')
pkgdesc="A key remapping daemon for linux. "
url="https://github.com/rvaiya/$pkgname"
license=('MIT')
depends=('libudev.so')
source=("git+$url.git#tag=v$pkgver")
install=keyd.install
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname/"
	make
}

package() {
	cd "$srcdir/$pkgname/"
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/keyd/libinput/local-overrides.quirks" <<-'EOF'
		# /etc/libinput/local-overrides.quirks (/usr/share/keyd/libinput/local-overrides.quirks)
		[keyd virtual keyboard]
		MatchUdevType=keyboard
		MatchName=keyd virtual keyboard
		AttrKeyboardIntegration=internal
	EOF
	install -Dm644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname%-git}/examples/"
	install -Dm644 man.md CHANGELOG.md README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
