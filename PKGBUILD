# Maintainer: bnema <b at bnema dot dev>
# The release workflow sets pkgver and publishes this file to the AUR on every
# release tag, so the AUR version never falls behind the latest tag.
pkgname=nefervox-git
pkgver=0.1.0.r0.g893bcd8
pkgrel=1
pkgdesc='Push-to-talk dictation for Wayland: speak, then the transcript is typed into the focused window (git version)'
arch=('x86_64' 'aarch64')
url='https://git.bnema.dev/nefervox'
license=('AGPL-3.0-only')
# Loaded or run at runtime (purego, no cgo): not seen by makepkg's library scan.
depends=('glibc' 'vulkan-icd-loader' 'vulkan-driver'
	'pipewire-audio' # pw-record
	'ttf-dejavu')    # overlay text (DejaVu Sans)
makedepends=('go>=2:1.27' 'git')
optdepends=('wl-clipboard: clipboard output and fallback when typing fails'
	'xdg-utils: open the browser for nefervox login chatgpt')
provides=('nefervox')
conflicts=('nefervox' 'nefervox-bin')
source=('git+https://git.bnema.dev/nefervox.git')
sha256sums=('SKIP')

pkgver() {
	cd nefervox
	# v0.2.0-5-gabc1234 -> 0.2.0.r5.gabc1234. Pre-release tags (v0.3.0-rc1)
	# are skipped: pacman sorts 0.3.0.rc1 after 0.3.0.
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd nefervox
	export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw' GOTOOLCHAIN=local
	go mod download
}

build() {
	cd nefervox
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local GOPROXY=off
	export GOFLAGS='-mod=readonly -modcacherw -trimpath -buildvcs=false -buildmode=pie'
	go build -ldflags "-X main.version=$pkgver" -o nefervox ./cmd/nefervox
}

check() {
	cd nefervox
	./nefervox version
}

package() {
	cd nefervox
	install -Dm755 nefervox "$pkgdir/usr/bin/nefervox"
	install -Dm644 README.md "$pkgdir/usr/share/doc/nefervox/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
