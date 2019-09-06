# Maintainer: Bradley Cicenas <bradley@vektor.nyc>
pkgname=tcolors
_pkgname=tcolors
pkgver=0.3.1
pkgrel=1
pkgdesc="Commandline color picker and palette builder"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/bcicen/tcolors'
depends=()
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/bcicen/tcolors.git#tag=v${pkgver}"
)

md5sums=('SKIP')
backup=()

pkgbuild() {
	git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
	cd "$srcdir/$pkgname"

	echo "Running 'gzip ./docs/man1/${pkgname}.1'..."
	gzip -f -k ./docs/man1/${pkgname}.1

	echo "Running 'go mod download'..."
	go mod download

	echo "Running 'go build'..."
	go build -ldflags "-w -X main.version=${pkgver}-${pkgrel} -X main.build=$(pkgbuild)" -o tcolors
}

package() {
	target="${srcdir}/${pkgname}"
	install -DT ${target}/tcolors "${pkgdir}/usr/bin/tcolors"
	install -DTm644 ${target}/docs/man1/${pkgname}.1.gz "$pkgdir/usr/share/man/man1/${pkgname}.1.gz"
	install -Dm644 ${target}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
