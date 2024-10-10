# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=yojo-git
_pkgname=yojo
pkgver=r45.57321884506c
pkgrel=1
pkgdesc='A CI bridge from Forgejo/Gitea to SourceHut'
arch=('x86_64')
url='https://codeberg.org/emersion/yojo'
license=('MIT')
depends=('sqlite')
makedepends=('git' 'go')
provides=('yojo')
conflicts=('yojo')
backup=(etc/yojo/config)
source=(
	"git+https://codeberg.org/emersion/yojo.git"
	"yojo.service"
	"yojo.sysusers"
	"yojo.tmpfiles"
	"config"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/yojo"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/yojo"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -tags=libsqlite3 .
}

package() {
	cd "$srcdir/yojo"
	install -Dm755 yojo "$pkgdir/usr/bin/yojo"
	install -Dm600 "$srcdir/config" "$pkgdir/etc/yojo/config"
	install -Dm644 "$srcdir/yojo.service" "$pkgdir/usr/lib/systemd/system/yojo.service"
	install -Dm644 "$srcdir/yojo.sysusers" "$pkgdir/usr/lib/sysusers.d/yojo.conf"
	install -Dm644 "$srcdir/yojo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/yojo.conf"
}
