# Maintainer: Aleksander Mietinen <aleksander at mietinen dot net>

pkgname=seclists
pkgver=2021.2
pkgrel=1
pkgdesc="A collection of multiple types of lists used during security assessments, collected in one place."
arch=('any')
url="https://github.com/danielmiessler/SecLists"
license=('MIT')
makedepends=('findutils' 'coreutils' 'tar')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0dd338665be3d29b7f6194bc59831ce7a42b7c9552e430c1bf1d605f7f33ba76')

prepare() {
	cd "$srcdir/SecLists-$pkgver"
	find . -iname "rockyou*.tar.gz" -exec sh -c 'tar zxf {} -C $(dirname {}); rm {}' \;
}

package() {
	cd "$srcdir/SecLists-$pkgver"

	# Install to /usr/share/seclists
	find . \( ! -iname "*.md" -a ! -iname ".git*" -a ! -name "LICENSE"  \) -type f \
		-exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/{}" \;

	# Install all *.md files to /usr/share/doc/seclists
	find . -iname "*.md" -type f \
		-exec install -Dm644 {} "$pkgdir/usr/share/doc/$pkgname/{}" \;

	# Install LICENSE to /usr/share/licenses/seclists
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
