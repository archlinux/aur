# Maintainer: Titouan (Stalone) S. <stalone@boxph.one>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Mark (yochananmarqos) Wagie <mark.wagie@proton.me>

pkgname=authenticator
_pkgname=Authenticator
pkgver=4.4.0
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL3')
depends=('gst-plugins-bad' 'libadwaita' 'libsecret' 'pipewire' 'zbar')
makedepends=('cargo' 'clang' 'git' 'meson')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('d1349ddc195ca173b64780d153864e3f8613986e6c0504d613c9331e83efab5d')
options=('!lto')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
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
