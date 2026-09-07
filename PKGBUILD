# Maintainer: Sebastian Ruziczka <aur@sebastianruziczka.de>
pkgname=looksyk-desktop
_pkgnameshort=looksyk
pkgver=1.42.0
pkgrel=1
pkgdesc="A markdown centric, fast and local personal knowledge platform"
arch=("x86_64")
url="https://sebastianrzk.codeberg.page/looksyk"
license=('AGPL-3.0-or-later')
groups=()
depends=(glibc bash gcc-libs git curl openssl glib2 gtk3 libsoup3 webkit2gtk-4.1)
makedepends=(git nodejs-lts-jod npm cargo glibc bash gcc-libs pkgconf gettext glib2 gtk3 libsoup3 webkit2gtk-4.1)
checkdepends=(cargo glibc gcc-libs)
provides=(looksyk looksyk-backend)
changelog=
source=("git+https://codeberg.org/sebastianrzk/looksyk#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgnameshort" || cd Looksyk
	cd frontend/looksyk
	npm install
	cd ../..
	cargo install tauri-cli --version "^2.0.0" --locked
}

build() {
	cd "$_pkgnameshort" || cd Looksyk
	cd backend/src-tauri
	CFLAGS+=' -ffat-lto-objects' cargo tauri build --bundles
	cd ../..
}

check() {
	cd "$_pkgnameshort" || cd Looksyk
	cd backend/core
	CFLAGS+=' -ffat-lto-objects' cargo test --features web-backend
}

package() {
	cd "$_pkgnameshort" || cd Looksyk
	mkdir -p "${pkgdir}/usr/share/${_pkgnameshort}"
	install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgnameshort}/LICENSE"

	install -D -m644 "icon/Looksyk_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/de.sebastianruziczka.looksyk.png"

	install -D -m644 "application-wrapper/Looksyk.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -D -m755 "backend/target/release/src-tauri" "${pkgdir}/usr/lib/${_pkgnameshort}/looksyk"
	
	ln -s "/usr/lib/${_pkgnameshort}/looksyk-tauri" "${pkgdir}/usr/bin/looksyk"
}
