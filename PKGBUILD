# Maintainer: Bartek Laskowski <bartek at undg dot dev>

pkgname=pulse-remote-git
pkgver=0.11.1.r0.gd361e33
pkgrel=1
pkgdesc="Audio mixer for PulseAudio and PipeWire — local desktop app and web UI accessible from any device on your network"
arch=('x86_64')
url="https://github.com/undg/pulse-remote"
license=('MIT')
depends=('libpulse' 'electron')
makedepends=('go' 'git')
install=pulse-remote-git.install
options=(!debug)

source=("$pkgname::git+https://github.com/undg/pulse-remote.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	mkdir -p build/
}

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	make build
}

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
