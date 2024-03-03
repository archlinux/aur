# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Brett Cornwall <ainola@archlinux.org>

pkgname=keyd-git
pkgver=2.4.3.r46.5832c75
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="A key remapping daemon for linux"
url="https://github.com/rvaiya/keyd"
license=('MIT')
makedepends=(git)
optdepends=(
	"python: Required for use with keyd-application-mapper utility"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'git+https://github.com/rvaiya/keyd.git'
	keyd.sysusers
)
sha256sums=('SKIP'
            'b3fa546c31f61be824a84a33af5c723692e2cedd4e5f87ff655e90f33227395d')

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
	make DESTDIR="$pkgdir" PREFIX='/usr'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
	install -Dm644 ../keyd.sysusers "$pkgdir/usr/lib/sysusers.d/keyd.conf"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/keyd"
	install -Dm644 keyd.service -t "$pkgdir/usr/lib/systemd/system/"
}
