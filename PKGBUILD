# Maintainer: Byron Torres <b@torresjrjr.com>
# Project: https://sr.ht/~sircmpwn/himitsu

pkgname=himitsu
pkgver='0.3'
pkgrel=1
pkgdesc='Secret storage manager'
arch=(x86_64)
url='https://himitsustore.org/'
license=(GPL3)
depends=()
makedepends=(hare scdoc)
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
_extracted="$pkgname-$pkgver"
source=(
	"$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz"
	'himitsud.service'
)
sha256sums=(
	'920a1e06dfc5a385a213e5c93015d2b4beeb3ebc6963c6b36d344d38b5389a81'
	'0d84a1ceb17b6be53066f9f617ee35f233ada2283c3f9b3cbea5f2c8b6c7001e'
)

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	export HARECACHE="$srcdir/.harecache"
	make PREFIX=/usr
}

check() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr check
}

package() {
	cd "$srcdir/$_extracted"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cd "$srcdir"
	install -Dm644 himitsud.service \
		"$pkgdir/usr/lib/systemd/user/himitsud.service"
}
