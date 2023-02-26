# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-ssh
pkgver='0.2'
pkgrel=1
pkgdesc='Himitsu integration for SSH'
arch=(x86_64)
url='https://git.sr.ht/~sircmpwn/himitsu-ssh'
license=(GPL3)
depends=(himitsu)
makedepends=(hare hare-ssh scdoc)
install=himitsu-ssh.install
_extracted="$pkgname-$pkgver"
source=(
	"$_extracted.tar.gz::https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz"
	'hissh-agent.service'
)
sha256sums=(
	'5878abdb312467067cd77fd1f3edec8163abf877b7411d363b3d92a67a462dc1'
	'cff7c70946d9d06f06588e3a3b8c833eb67204a7c936f3f77ee3c8b18974a2ff'
)

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	make
}

check() {
	cd "$srcdir/$_extracted"
	make check
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	cd "$srcdir"
	install -Dm644 hissh-agent.service \
		"$pkgdir/usr/lib/systemd/user/hissh-agent.service"
}
