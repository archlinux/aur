# Maintainer: Sebastian Ruziczka <aur@sebastianruziczka.de>
pkgname=looksyk-desktop
_pkgnameshort=looksyk
pkgver=1.16.2
pkgrel=1
pkgdesc="A markdown centric, fast and local personal knowledge platform"
arch=("x86_64")
url="https://sebastianrzk.github.io/Looksyk"
license=('AGPL-3.0-or-later')
groups=()
depends=(electron glibc bash gcc-libs git)
makedepends=(git nodejs-lts-jod npm cargo glibc bash gcc-libs)
checkdepends=(cargo glibc gcc-libs)
provides=(looksyk looksyk-backend)
changelog=
source=("git+https://github.com/sebastianrzk/looksyk#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgnameshort"
	cd frontend/looksyk
	npm install
	cd ../..
	cd application-wrapper/Looksyk
	npm install
	cd ../..
}

build() {
	cd "$_pkgnameshort"
	cd backend
	CFLAGS+=' -ffat-lto-objects' cargo build --release
	cd ..
	cd frontend/looksyk
	npm run build --configuration=production
	cd ../..
	cd application-wrapper/Looksyk
	npm run package
	cd ..
}

check() {
	cd "$_pkgnameshort"
	cd backend
	CFLAGS+=' -ffat-lto-objects' cargo test
}

package() {
	cd "$_pkgnameshort"
	mkdir -p "${pkgdir}/usr/share/${_pkgnameshort}"
	install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgnameshort}/LICENSE"

	cp -r "frontend/looksyk/dist/looksyk/browser/" "${pkgdir}/usr/share/${_pkgnameshort}/static/"
	install -D -m644 "application-wrapper/Looksyk/out/looksyk-linux-x64/resources/app.asar" "${pkgdir}/usr/share/${_pkgnameshort}/app.asar"
	install -D -m644 "icon/Looksyk_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/de.sebastianruziczka.looksyk.png"

	install -D -m644 "application-wrapper/Looksyk.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -D -m755 "backend/target/release/looksyk" "${pkgdir}/usr/lib/${_pkgnameshort}/looksyk-backend"
	install -D -m755 "application-wrapper/looksyk" "${pkgdir}/usr/lib/${_pkgnameshort}/looksyk"
	
	ln -s "/usr/lib/${_pkgnameshort}/looksyk-backend" "${pkgdir}/usr/bin/looksyk-backend"
	ln -s "/usr/lib/${_pkgnameshort}/looksyk" "${pkgdir}/usr/bin/looksyk"
}
