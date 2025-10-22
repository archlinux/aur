# Maintainer: Aleksey Stepanov <blueingreen@bluig.space>

_pkgname=inhibit-bridge
pkgname="${_pkgname}-git"
pkgver=v1.0.0.r14.g962b658
pkgrel=1
pkgdesc='A bridge from dbus ScreenSaver inhibit to systemd/logind idle inhibit.'
arch=('x86_64')
url="https://github.com/bdwalton/inhibit-bridge"
license=('BSD-2-Clause')
makedepends=('go' 'git')
source=("${_pkgname}::git+https://github.com/bdwalton/inhibit-bridge")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "${_pkgname}"
	go build \
		-buildmode pie \
		-ldflags "-linkmode external -extldflags '-Wl,-z,relro,-z,now'" \
		-o inhibit-bridge \
		inhibit-bridge.go
}

package() {
	cd "${_pkgname}"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/$_pkgname"
}
