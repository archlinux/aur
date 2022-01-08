# Maintainer: eNV25 <env252525@gmail.com>

pkgname=keyd-git
pkgver=2.1.0.beta.r2.1551abe
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="A key remapping daemon for linux. "
url="https://github.com/rvaiya/keyd"
license=('MIT')
depends=('libudev.so')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rvaiya/keyd.git')
install=keyd.install
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="${pkgdir}" PREFIX='/usr' install
	echo 'g keyd' | install -Dm644 /dev/stdin ""${pkgdir}"/usr/lib/sysusers.d/${pkgname%-git}.conf"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/doc/keyd/libinput/local-overrides.quirks" <<-'EOF'
		# /etc/libinput/local-overrides.quirks (/usr/share/keyd/libinput/local-overrides.quirks)
		[keyd virtual keyboard]
		MatchUdevType=keyboard
		MatchName=keyd virtual keyboard
		AttrKeyboardIntegration=internal
	EOF

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
