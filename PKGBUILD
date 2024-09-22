# Maintainer: Titouan (Stalone) S. <stalone@boxph.one>
# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Mark (yochananmarqos) Wagie <mark.wagie@proton.me>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.5.0
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL3')
depends=('gst-plugins-bad' 'gst-plugin-pipewire' 'libadwaita' 'libsecret' 'pipewire' 'zbar')
makedepends=('cargo' 'clang' 'git' 'meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('195d61084f41a90b3ef5dfa433309a5b86beef76ea6cd36e3329b72181eb23a1')
options=('!lto')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	arch-meson $_pkgname-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || :
}

package() {
	meson install -C build --destdir "$pkgdir"
}
