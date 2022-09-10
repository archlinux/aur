# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=tokidoki-git
_pkgname=tokidoki
pkgver=r49.228384530e2b
pkgrel=1
pkgdesc='A small and robust calendar & contacts server'
arch=('x86_64')
url='https://sr.ht/~sircmpwn/tokidoki'
license=('AGPLv3')
makedepends=('git' 'go')
provides=('tokidoki')
conflicts=('tokidoki')
backup=(etc/tokidoki/params)
source=(
	"git+https://git.sr.ht/~sircmpwn/tokidoki"
	"tokidoki.service"
	"tokidoki.sysusers"
	"tokidoki.tmpfiles"
	"params"
)
sha256sums=(
	'SKIP'
	'02bbefe5c14536ddb290b951f564a0cbb0fdad987f943ef05e806cf42984d05e'
	'49b39eec9da49f0db45c8e88c2c0e4c82e1cb7d8efe29c27bb4c19f1e7865ef5'
	'ae2bbb3839beec5358be4ab0b933f20a68cf4b994271a30fa15921a7d8e15cb8'
	'8bd5832f12c7930ab73011c35ebe16f5b5da624898802c8c927368b7c687a35f'
)

pkgver() {
	cd "$srcdir/tokidoki"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/tokidoki"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build ./cmd/tokidoki
}

package() {
	cd "$srcdir/tokidoki"
	install -D tokidoki "$pkgdir/usr/bin/tokidoki"
	install -Dm644 "$srcdir/params" "$pkgdir/etc/tokidoki/params"
	install -Dm644 "$srcdir/tokidoki.sysusers" "$pkgdir/usr/lib/sysusers.d/tokidoki.conf"
	install -Dm644 "$srcdir/tokidoki.service" "$pkgdir/usr/lib/systemd/system/tokidoki.service"
	install -Dm644 "$srcdir/tokidoki.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/tokidoki.conf"
}
