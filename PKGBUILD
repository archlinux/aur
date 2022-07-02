# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=hottub-git
_pkgname=hottub
pkgver=r29.bcc2fb9027a6
pkgrel=2
pkgdesc='A CI bridge from GitHub to SourceHut'
arch=('x86_64')
url='https://git.sr.ht/~emersion/hottub'
license=('MIT')
makedepends=('git' 'go')
provides=('hottub')
conflicts=('hottub')
backup=(etc/hottub/params)
source=(
	"git+https://git.sr.ht/~emersion/hottub"
	"hottub.service"
	"hottub.sysusers"
	"hottub.tmpfiles"
	"params"
)
sha256sums=(
	'SKIP'
	'a10cde06155cd8a70f14ce6e2898d9743ea8a07f122ef59ace0ac781dce42f04'
	'37ad30b17c564b43331a390405a34bdd35f2139e1de220f7374b46ceac6707c1'
	'38313409f2f1c974473f42b2f8e00c836033afe5fffa7677bfb932480ef989c3'
	'854056e63276c1418ff1ba832fe4ebf14e31b957f754db778062f63b8f83f0e0'
)

pkgver() {
	cd "$srcdir/hottub"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/hottub"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/hottub"
	make PREFIX=/usr DESTDIR=$pkgdir install
	install -Dm644 "$srcdir/params" "$pkgdir/etc/hottub/params"
	install -Dm644 "$srcdir/hottub.sysusers" "$pkgdir/usr/lib/sysusers.d/hottub.conf"
	install -Dm644 "$srcdir/hottub.service" "$pkgdir/usr/lib/systemd/system/hottub.service"
	install -Dm644 "$srcdir/hottub.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/hottub.conf"
}
