# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=dalligi-git
_pkgname=dalligi
pkgver=r41.5d31808115fd
pkgrel=2
pkgdesc='A CI bridge from GitLab to SourceHut'
arch=('x86_64')
url='https://git.sr.ht/~emersion/dalligi'
license=('AGPL3')
makedepends=('git' 'go')
provides=('dalligi')
conflicts=('dalligi')
source=(
	"git+https://git.sr.ht/~emersion/dalligi"
	"dalligi@.service"
	"dalligi.sysusers"
	"dalligi.tmpfiles"
)
sha256sums=(
	'SKIP'
	'a3a5b0753b2c67f66729a3002435290635755ddefde0a963c0353a14ddc9e151'
	'e1f34a7f32c50944da6bec83a1f610ba4423b9cbf8d253769deedf6c8f325d02'
	'00e79e26f1d4c88e1e805c49aed47b6d3367450f42be49239e5445aae51cd224'
)

pkgver() {
	cd "$srcdir/dalligi"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/dalligi"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "$srcdir/dalligi"
	install -D dalligi "$pkgdir/usr/bin/dalligi"
	install -d "$pkgdir/etc/dalligi"
	install -Dm644 "$srcdir/dalligi.sysusers" "$pkgdir/usr/lib/sysusers.d/dalligi.conf"
	install -Dm644 "$srcdir/dalligi@.service" "$pkgdir/usr/lib/systemd/system/dalligi@.service"
	install -Dm644 "$srcdir/dalligi.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dalligi.conf"
}
