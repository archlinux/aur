# Maintainer: Markus Sommer <markus@splork.de>

_gopkgname='github.com/dtn7/dtn7-go'

pkgname=dtn7
pkgver=0.5.2
pkgrel=2
pkgdesc="Delay tolerant routing daemon - Implements Bundle Protocol Version 7"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://dtn7.github.io/"
license=('GPL3')
depends=("glibc")
makedepends=("go")
provides=('dtnd' "dtncat")
conflicts=('dtnd')
backup=("etc/dtn7/configuration.toml" "usr/lib/systemd/system/dtn7.service")
install="install.bash"
source=("https://$_gopkgname/archive/v$pkgver.tar.gz"
	    "configuration.toml"
	    "dtn7.service"
	    "dtn7.ufw"
	    "dtn7.sysusers")
sha512sums=("df31171525a76cce4ae1025de17539612a7b172187b29fe3d6662887f77fdc8850e3caccefaa405171753dccc98b7fc1d333ae023a0b886a8eec8c166767ac27"
	        "315d44f8dcd8bde5d37f578781a8eea79d762851f2fc793a5f6ece5b8f893f98a16fbca1f311f785683bad55a73752ea140519d6ac985262bc634b075d788b6b"
	        "85b2bdef9d98723752f8f000f922cda92a6583df5604789946794a9517d1cf05886612e4f4dd91befcadc6f199c68c10e154117424eaabf08cf2e104a668b5e5"
	        "1b92950439b61f2447cea5cc941bf148c0b17fd15236540dfeea4a845a4f6e985ec3ff9b92814027b0f13cc1517d1f143200b18d1ba25e4f67135f0cccafc9ab"
	        "535ed9a4a0fd25e41906f0cdf16c4ae55bd2d1549a687319f13b2f4a0d0ad7847dc92a0c6ef9a8485688507d44ebdcaec5a509b6de725f0b072d4c2fc938c55f")

build() {
	cd "$srcdir/$pkgname-go-$pkgver"
	go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtnd
	go build -trimpath -ldflags "-extldflags $LDFLAGS" ./cmd/dtncat
}


package() {
	mkdir -p "$pkgdir/var/lib/$pkgname"

	cd "$srcdir"
	install -D -m 0644 "configuration.toml" "$pkgdir/etc/dtn7/configuration.toml"
	install -D -m 0644 "dtn7.service" "$pkgdir/usr/lib/systemd/system/dtn7.service"
	install -D -m 0644 "dtn7.ufw" "$pkgdir/etc/ufw/applications.d/dtn7"
	install -D -m 0644 "dtn7.sysusers" "$pkgdir/usr/lib/sysusers.d/dtn7.conf"

	cd "$pkgname-go-$pkgver"
	install -D -m 0755 dtnd "$pkgdir/usr/bin/dtnd"
	install -D -m 0755 dtncat "$pkgdir/usr/bin/dtncat"
}
