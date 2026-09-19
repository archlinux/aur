# Maintainer: ushineko <https://github.com/ushineko>
#
# The AUR copy of packaging/arch/PKGBUILD: the same build, package() and
# dependency list, but with `source=` pointing at the GitHub repository so the
# AUR can build it from nothing. The CI `publish-aur` job copies this file and
# regenerates .SRCINFO with `makepkg --printsrcinfo` on every release tag.
# Keep the two PKGBUILDs in step by hand; the AUR one is what users see.
pkgname=clockwork-orange-git
pkgver=4.2.3
pkgrel=1
pkgdesc="Wallpaper manager and downloader with plugin support (Wallhaven, DuckDuckGo Images) for KDE Plasma 6"
arch=('x86_64' 'aarch64')
url="https://github.com/ushineko/clockwork-orange"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxxf86vm' 'libxkbcommon' 'wayland' 'qt6-tools' 'kconfig')
makedepends=('go' 'git' 'gcc' 'pkgconf' 'mesa' 'wayland-protocols')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!debug')
install=clockwork-orange.install
source=("${pkgname}::git+https://github.com/ushineko/clockwork-orange.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local _tag
	_tag="$(tr -d '[:space:]' < .tag 2>/dev/null || echo v0.0.0)"
	printf "%s.r%s.g%s" "${_tag#v}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	export GOFLAGS="-buildvcs=false -mod=readonly"
	export CGO_ENABLED=1
	make build build-gui
}

check() {
	cd "${srcdir}/${pkgname}"
	GOFLAGS="-buildvcs=false" go test -tags parity ./cmd/... ./internal/... ./tests/...
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 bin/clockwork-orange "${pkgdir}/usr/bin/clockwork-orange"
	install -Dm755 bin/clockwork-orange-gui "${pkgdir}/usr/bin/clockwork-orange-gui"
	install -Dm644 packaging/io.ushineko.clockwork-orange.desktop \
		"${pkgdir}/usr/share/applications/io.ushineko.clockwork-orange.desktop"
	for res in 16 32 48 64 128 256 512; do
		install -Dm644 "packaging/icons/clockwork-orange-${res}x${res}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/clockwork-orange.png"
	done
	install -Dm644 internal/platform/clockwork-orange.service \
		"${pkgdir}/usr/lib/systemd/user/clockwork-orange.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
