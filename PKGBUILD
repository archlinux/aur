# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=librespot-raspotify-git
_pkgname=librespot
pkgver=r1628.8b7147a
pkgrel=1
pkgdesc='Open source client library for Spotify'
arch=('x86_64' 'aarch64')
url='https://github.com/JasonLG1979/librespot'
license=('MIT')
depends=(
	'alsa-lib'
	'libpulse')
makedepends=('cargo' 'git')
provides=('librespot')
conflicts=('librespot')
source=("${pkgname}::git+$url#branch=raspotify")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
	cd "${pkgname}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "${pkgname}"
	cargo build --profile raspotify --no-default-features --features "alsa-backend pulseaudio-backend"
}

package() {
	cd "${pkgname}"
	install -Dv "target/raspotify/${_pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dvm644 "contrib/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dvm644 "contrib/${_pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
	install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

