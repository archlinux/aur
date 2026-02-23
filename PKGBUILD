# Maintainer: Byron Torres <b@torresjrjr.com>

pkgname=himitsu-ssh
pkgver='0.10.0'
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
	'9c787d5f185876e3442ddd22338f769b2f24cca33525d9278ee6d70327e18a58'
	'cff7c70946d9d06f06588e3a3b8c833eb67204a7c936f3f77ee3c8b18974a2ff'
)

export HAREPATH='/usr/src/hare/stdlib:/usr/src/hare/third-party'

build() {
	cd "$srcdir/$_extracted"
	export LDFLAGS=${LDFLAGS#'-Wl,'}
	make HARE=/usr/bin/hare SCDOC=/usr/bin/scdoc
}

check() {
	cd "$srcdir/$_extracted"
	make HARE=/usr/bin/hare SCDOC=/usr/bin/scdoc check
}

package() {
	cd "$srcdir/$_extracted"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	cd "$srcdir"
	install -Dm644 hissh-agent.service \
		"$pkgdir/usr/lib/systemd/user/hissh-agent.service"
}
