# Maintainer: bnema <b at bnema dot dev>
# The release workflow sets pkgver and publishes this file to the AUR on every
# release tag, so the AUR version never falls behind the latest tag.
pkgname=neferbar-git
pkgver=0.3.0.r0.gda0887c
pkgrel=1
pkgdesc='One-cell-high, terminal-style status bar for Wayland, driven by scripts (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/bnema/neferbar'
license=('MIT')
# Loaded at runtime (purego, no cgo): not seen by makepkg's library scan.
# fontconfig provides fc-match, which finds the font files.
depends=('glibc' 'fontconfig' 'libxkbcommon' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('go>=2:1.27' 'git')
optdepends=('ttf-jetbrains-mono-nerd: default font, with the icons modules print')
provides=('neferbar')
conflicts=('neferbar' 'neferbar-bin')
source=('git+https://github.com/bnema/neferbar.git')
sha256sums=('SKIP')

pkgver() {
	cd neferbar
	# v0.2.0-5-gabc1234 -> 0.2.0.r5.gabc1234. Pre-release tags (v0.3.0-rc1)
	# are skipped: pacman sorts 0.3.0.rc1 after 0.3.0.
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd neferbar
	export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw' GOTOOLCHAIN=local
	go mod download
}

build() {
	cd neferbar
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOPROXY=off
	export GOFLAGS='-mod=readonly -modcacherw -trimpath -buildvcs=false -buildmode=pie'
	go build -ldflags "-X main.version=$pkgver" -o neferbar ./cmd/neferbar
}

check() {
	cd neferbar
	./neferbar version
}

package() {
	cd neferbar
	install -Dm755 neferbar "$pkgdir/usr/bin/neferbar"
	install -Dm644 README.md "$pkgdir/usr/share/doc/neferbar/README.md"
	cp -r examples "$pkgdir/usr/share/doc/neferbar/examples"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
