# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
# Maintainer: Jake <aur@ja-ke.tech>
pkgname=earlyoom
pkgver=1.2
pkgrel=2
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
backup=("etc/default/earlyoom")
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
	"earlyoom.1.gz"
)
sha512sums=('45edc7064f227fce3ed6fdc9e524a8a117f8a9de50d98c9e75f31c193a1820804df8d9fac02c4ee1daabd3c2018bbeb422611ca29971e1c11f86446de8c96bc1'
            '768cae91fb74e5b06abb9c90ae9220c8809cb53d75d90d81483725a13aa99e617933bb030e970ceb078a1dcba3e4d2c22f96ed3958762115969c11154af63afd')

build() {
	cd "$pkgname-$pkgver"

	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver earlyoom
}

package() {
        # install the pregenerated manpage, to avoid the pandoc makedepends
	install -Dm644 earlyoom.1.gz "${pkgdir}/usr/share/man/man1/earlyoom.1.gz"
	
	cd "$pkgname-$pkgver"	
	make install DESTDIR="${pkgdir}" PREFIX="/usr" SYSTEMDDIR="/usr/lib/systemd"
}
