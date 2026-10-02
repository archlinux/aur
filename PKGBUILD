# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sshtron-git
pkgver=r120.39632dd
pkgrel=1
pkgdesc="Multiplayer lightcycle game that runs through SSH"
arch=('x86_64' 'aarch64')
url="https://github.com/zachlatta/sshtron"
license=('MIT')
depends=('glibc' 'openssh')
makedepends=('go>=1.20' 'git')
options=('!lto')
provides=('sshtron')
conflicts=('sshtron')
source=("git+$url.git" 'sshtron.service')
sha256sums=('SKIP'
            '0a989de90c09e34306b27404a3ab0466e970dfd6195dc53e2aebaa0613e02554')

pkgver() {
	cd sshtron
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd sshtron
	sed -i 's|http.Dir("./static/")|http.Dir("/usr/share/sshtron/static/")|' main.go
	go mod download
}

build() {
	cd sshtron
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/sshtron-build" .
}

package() {
	cd sshtron
	install -Dm755 "$srcdir/sshtron-build" "$pkgdir/usr/bin/sshtron"
	install -d "$pkgdir/usr/share/sshtron"
	cp -a static "$pkgdir/usr/share/sshtron/"
	install -Dm644 "$srcdir/sshtron.service" "$pkgdir/usr/lib/systemd/system/sshtron.service"
	install -Dm644 README.md "$pkgdir/usr/share/doc/sshtron/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
