# Maintainer: Nicklas Botö <bruski@nicklasbotö.se>
pkgname=bruski-git
pkgver=1.1.r236.0506501
pkgrel=1
pkgdesc="The BruSKI language compiler and platform"
arch=(x86_64)
url="https://github.com/NicklasBoto/BruSKI.git"
license=('GPL')
depends=()
makedepends=(git make stack)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/BruSKI"
	printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/BruSKI"

	install -d "${pkgdir}/usr/lib/bruski"
	install -D src/Prelude/*.bru "${pkgdir}/usr/lib/bruski/"
	
	echo "-- Path to standard library" >> src/Config.hs
	echo 'preludePath = "/usr/lib/bruski/"' >> src/Config.hs
	
	stack install --local-bin-path "${pkgdir}/usr/bin"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	make DESTDIR="$pkgdir/" install
}
