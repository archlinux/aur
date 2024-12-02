# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=spotify-player-full
_pkgname=spotify-player
pkgver=0.20.3
pkgrel=1
pkgdesc="A command driven spotify player with all options enabled"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'dbus' 'libsixel' 'libpulse' 'glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${pkgname}-git")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('44ab12a9dd3b905e7285ce6eaee36be51f5f20045673b959f90c992feba4fc6a277ce4a4915d7d0fcd49cd244289dd6a7bdd7d3dbc1ae27fed54d8bec6fb8cef')
options=('!lto')

build() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --no-default-features \
		 --features lyric-finder,notify,pulseaudio-backend,media-control,daemon,image,sixel,fzf
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
