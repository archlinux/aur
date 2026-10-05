# Maintainer: bnema <b at bnema dot dev>
# The release workflow sets pkgver and publishes this file to the AUR on every
# release tag, so the AUR version never falls behind the latest tag.
pkgname=neferwl-git
pkgver=0.5.0.r0.gccce658
pkgrel=1
pkgdesc='A Wayland compositor that spends its frames on your apps, not on itself (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/bnema/neferwl'
license=('GPL-3.0-only')
# Loaded at runtime (purego, no cgo): not seen by makepkg's library scan.
depends=('glibc' 'libinput' 'libxkbcommon' 'seatd' 'systemd-libs' 'vulkan-icd-loader'
	'vulkan-driver' 'wayland' 'dbus' 'libcap')
makedepends=('go>=2:1.27' 'git')
optdepends=('xwayland-satellite>=0.7: X11 apps'
	'foot: default terminal'
	'fuzzel: launcher'
	'xdg-desktop-portal-gtk: file pickers and settings for apps'
	'xdg-desktop-portal-wlr: screen sharing and screenshots through the portal'
	'nefercap: screenshots and screen recording')
provides=('neferwl')
conflicts=('neferwl' 'neferwl-bin')
install=neferwl.install
source=('git+https://github.com/bnema/neferwl.git')
sha256sums=('SKIP')

pkgver() {
	cd neferwl
	# v0.2.0-5-gabc1234 -> 0.2.0.r5.gabc1234. Pre-release tags (v0.3.0-rc1)
	# are skipped: pacman sorts 0.3.0.rc1 after 0.3.0.
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd neferwl
	export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw' GOTOOLCHAIN=local
	go mod download
}

build() {
	cd neferwl
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOPROXY=off
	export GOFLAGS='-mod=readonly -modcacherw -trimpath -buildvcs=false -buildmode=pie'
	go build -ldflags "-X main.version=$pkgver" -o neferwl ./cmd/neferwl
}

check() {
	cd neferwl
	./neferwl version
	./neferwl validate-config examples/config
}

package() {
	cd neferwl
	install -Dm755 neferwl "$pkgdir/usr/bin/neferwl"
	install -Dm755 packaging/neferwl-session "$pkgdir/usr/bin/neferwl-session"
	install -Dm644 packaging/neferwl.service "$pkgdir/usr/lib/systemd/user/neferwl.service"
	install -Dm644 packaging/neferwl-shutdown.target "$pkgdir/usr/lib/systemd/user/neferwl-shutdown.target"
	install -Dm644 packaging/neferwl.desktop "$pkgdir/usr/share/wayland-sessions/neferwl.desktop"
	install -Dm644 packaging/neferwl-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/neferwl-portals.conf"
	install -Dm644 examples/config "$pkgdir/usr/share/doc/neferwl/config.example"
	install -Dm644 examples/capture-allow "$pkgdir/usr/share/doc/neferwl/capture-allow.example"
	install -Dm644 README.md "$pkgdir/usr/share/doc/neferwl/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
