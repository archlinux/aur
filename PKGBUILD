# Maintainer: bnema <b at bnema dot dev>
# The release workflow sets pkgver and publishes this file to the AUR on every
# release tag, so the AUR version never falls behind the latest tag.
pkgname=neferafk-git
pkgver=0.3.1.r0.g4e89021
pkgrel=1
pkgdesc='Idle daemon for Wayland: fade, session lock, screens off and suspend (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/bnema/neferafk'
license=('GPL-3.0-only')
# Loaded at runtime (purego, no cgo): not seen by makepkg's library scan.
depends=('glibc' 'pam' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver' 'systemd'
	'ttf-dejavu') # lock screen monospace font (DejaVu Sans Mono)
makedepends=('go>=2:1.27' 'git')
optdepends=('pass: PIN source for auth.mode = pin')
provides=('neferafk')
conflicts=('neferafk' 'neferafk-bin')
backup=('etc/pam.d/neferafk')
source=('git+https://github.com/bnema/neferafk.git')
sha256sums=('SKIP')

pkgver() {
	cd neferafk
	# v0.2.0-5-gabc1234 -> 0.2.0.r5.gabc1234. Pre-release tags (v0.3.0-rc1)
	# are skipped: pacman sorts 0.3.0.rc1 after 0.3.0.
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd neferafk
	export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw' GOTOOLCHAIN=local
	go mod download
}

build() {
	cd neferafk
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOPROXY=off
	export GOFLAGS='-mod=readonly -modcacherw -trimpath -buildvcs=false -buildmode=pie'
	go build -ldflags "-X main.version=$pkgver" -o neferafk ./cmd/neferafk
}

check() {
	cd neferafk
	./neferafk version
	./neferafk validate-config examples/config
}

package() {
	cd neferafk
	install -Dm755 neferafk "$pkgdir/usr/bin/neferafk"
	install -Dm644 packaging/neferafk.pam "$pkgdir/etc/pam.d/neferafk"
	install -Dm644 examples/config "$pkgdir/usr/share/doc/neferafk/config.example"
	install -Dm644 README.md "$pkgdir/usr/share/doc/neferafk/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
