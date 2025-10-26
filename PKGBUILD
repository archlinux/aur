# Maintainer: Byron Torres <b@torresjrjr.com>
# Project: https://sr.ht/~sircmpwn/himitsu

pkgname=himitsu
pkgver='0.9'
pkgrel=1
pkgdesc='Secret storage manager (passwords, credentials, miscellaneous)'
arch=(x86_64)
url='https://himitsustore.org/'
license=(GPL3)
depends=()
makedepends=(hare scdoc)
install=himitsu.install
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
_extracted="$pkgname-$pkgver"
source=(
	"$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz"
	'himitsud.service'
)
sha256sums=(
	'369e65b7a6fcfd90078a12abc25e25c1d161eb33f9eda01a6ed8d4ade74fbbcc'
	'0d84a1ceb17b6be53066f9f617ee35f233ada2283c3f9b3cbea5f2c8b6c7001e'
)

build() {
	cd "$srcdir/$_extracted"
	unset HAREPATH
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	export HARECACHE="$srcdir/.harecache"
	make PREFIX=/usr
}

check() {
	cd "$srcdir/$_extracted"
	unset HAREPATH
	make PREFIX=/usr check
}

package() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cd "$srcdir"
	install -Dm644 himitsud.service \
		"$pkgdir/usr/lib/systemd/user/himitsud.service"
}
