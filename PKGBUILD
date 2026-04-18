# Maintainers: let <let@notlet.dev>, EnumDev <enumdev@enumerated.dev>

pkgbase=stormfetch
pkgname=(stormfetch stormfetch-monitor-detection)
pkgver=8.0
pkgrel=2
pkgdesc='A linux fetch program written in go'
arch=('any')
url='https://github.com/EnumeratedDev/stormfetch'
license=('MIT')

makedepends=('bash' 'git' 'go' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd' 'make')

backup=(etc/stormfetch/config.yml)
install=stormfetch.install

source=("git+https://github.com/EnumeratedDev/stormfetch.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/stormfetch"

	# Expects Go LDFLAGS
	unset LDFLAGS

	make PREFIX=/usr LIBEXECDIR=/usr/lib SYSCONFDIR=/etc
}

package_stormfetch() {
	depends=('bash')
	optdepends=('stormfetch-monitor-detection: Detect monitor resolution and refresh rate')

	cd "$srcdir/stormfetch"
	make DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib SYSCONFDIR=/etc install-stormfetch
	make DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib SYSCONFDIR=/etc install-config

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_stormfetch-monitor-detection() {
	pkgdesc='Monitor detection utility for stormfetch'
	depends=('stormfetch' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')

	cd "$srcdir/stormfetch"
	make DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib SYSCONFDIR=/etc install-stormfetch-monitor-detection

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
