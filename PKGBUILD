# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=pushgarden-git
_pkgname=pushgarden
pkgver=r46.211319289b88
pkgrel=1
pkgdesc='A Web Push gateway to proprietary services'
arch=('x86_64')
url='https://codeberg.org/emersion/pushgarden'
license=('AGPLv3')
makedepends=('git' 'go')
provides=('pushgarden')
conflicts=('pushgarden')
backup=(etc/pushgarden/params)
source=(
	"git+https://codeberg.org/emersion/pushgarden.git"
	"pushgarden.service"
	"pushgarden.sysusers"
	"pushgarden.tmpfiles"
	"params"
)
sha256sums=(
	'SKIP'
	'719749193fb165fd254ac53c7e82ac800db8a6c2613ccc2b38144dcb720a75d7'
	'5cef488aa00aeaaaedea87dcffd26dd22203cdcec159e30c0cdc29ccc87ee30c'
	'fcb114468a97a1b07e827dd1ff9d4789072a1c73db7f859a3b54b118cd622283'
	'474304ccb5dca9e297d606db16ab371d913d88edccebd378ee1e5059423b438f'
)

pkgver() {
	cd "$srcdir/pushgarden"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pushgarden"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build .
}

package() {
	cd "$srcdir/pushgarden"
	install -D pushgarden "$pkgdir/usr/bin/pushgarden"
	install -Dm644 "$srcdir/params" "$pkgdir/etc/pushgarden/params"
	install -Dm644 "$srcdir/pushgarden.sysusers" "$pkgdir/usr/lib/sysusers.d/pushgarden.conf"
	install -Dm644 "$srcdir/pushgarden.service" "$pkgdir/usr/lib/systemd/system/pushgarden.service"
	install -Dm644 "$srcdir/pushgarden.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/pushgarden.conf"
}
