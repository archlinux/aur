# Maintainer: bnema <b at bnema dot dev>
pkgname=bnetctl-git
pkgver=1.1.0.r0.g16b1719
pkgrel=1
pkgdesc='CLI to install, manage, and run Battle.net on Linux via Wine (git version)'
arch=('x86_64' 'aarch64')
url='https://git.bnema.dev/bnetctl'
license=('MIT')
makedepends=('go>=2:1.26.0' 'git')
optdepends=('wine-staging: Wine runtime (>= 11.19 for Wayland)'
	'wine: alternative Wine runtime'
	'wine-cachyos-opt: fallback Wine runtime'
	'dxvk-mingw-git: Direct3D 8/9/10/11 translation to Vulkan'
	'vkd3d-proton-mingw-git: Direct3D 12 translation to Vulkan'
	'icoutils: Battle.net icon for the .desktop entry')
provides=('bnetctl')
conflicts=('bnetctl' 'bnetctl-bin')
source=('git+https://git.bnema.dev/bnetctl.git')
sha256sums=('SKIP')

pkgver() {
	cd bnetctl
	git describe --long --tags --abbrev=7 --exclude='*-*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd bnetctl
	export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
	export GOFLAGS='-mod=readonly -modcacherw'
	go mod download
}

build() {
	cd bnetctl
	export GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOTOOLCHAIN=local
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	go build -ldflags "-X github.com/bnema/bnetctl/cmd.version=$pkgver -X github.com/bnema/bnetctl/cmd.commit=$(git rev-parse --short HEAD)" -o bnetctl .
}

check() {
	cd bnetctl
	./bnetctl --version
}

package() {
	cd bnetctl
	install -Dm755 bnetctl "$pkgdir/usr/bin/bnetctl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
