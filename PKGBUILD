# Maintainer: bnema <b at bnema dot dev>
# The release workflow sets pkgver and publishes this file to the AUR on every
# release tag, so the AUR version never falls behind the latest tag.
pkgname=nefercap-git
pkgver=0.3.0.r0.gea9abc7
pkgrel=1
pkgdesc='Screenshots and silent screen recording for Wayland, from one shortcut (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/bnema/nefercap'
license=('GPL-3.0-only')
# Loaded at runtime (purego, no cgo): not seen by makepkg's library scan.
depends=('glibc' 'wayland' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('go>=2:1.27' 'git')
optdepends=('ffmpeg: screen recording (libx264)'
	'wl-clipboard: copy screenshots to the clipboard'
	'neferwl: hidden-workspace capture, HUD exclusion and capture indicator')
provides=('nefercap')
conflicts=('nefercap' 'nefercap-bin')
source=('git+https://github.com/bnema/nefercap.git')
sha256sums=('SKIP')

pkgver() {
	cd nefercap
	# v0.2.0-5-gabc1234 -> 0.2.0.r5.gabc1234. Pre-release tags (v0.3.0-rc1)
	# are skipped: pacman sorts 0.3.0.rc1 after 0.3.0.
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd nefercap
	export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw' GOTOOLCHAIN=local
	go mod download
}

build() {
	cd nefercap
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOPROXY=off
	export GOFLAGS='-mod=readonly -modcacherw -trimpath -buildvcs=false -buildmode=pie'
	go build -ldflags "-X main.version=$pkgver" -o nefercap ./cmd/nefercap
}

check() {
	cd nefercap
	./nefercap version
}

package() {
	cd nefercap
	install -Dm755 nefercap "$pkgdir/usr/bin/nefercap"
	install -Dm644 README.md "$pkgdir/usr/share/doc/nefercap/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
