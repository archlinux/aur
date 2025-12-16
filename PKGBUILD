# Maintainer: Sebastian Ruziczka <aur@sebastianruziczka.de>
pkgname=budgetbutlerweb-desktop
_pkgnameshort=budgetbutlerweb
pkgver=4.3.7
pkgrel=1
pkgdesc="Simple and fast household book with offline and online functionality in German."
arch=("x86_64")
url="https://sebastianrzk.github.io/BudgetButlerWeb/"
license=('AGPL-3.0-or-later')
groups=()
depends=(electron glibc bash gcc-libs openssl)
makedepends=(git nodejs-lts-jod npm cargo glibc bash gcc-libs openssl)
checkdepends=(cargo  glibc bash gcc-libs openssl)
provides=(budgetbutlerweb budgetbutlerweb-backend)
changelog=
source=("git+https://github.com/sebastianrzk/budgetbutlerweb#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgnameshort"
	cd application-wrapper/BudgetButlerWeb
	npm install
	cd ../..
}

build() {
	cd "$_pkgnameshort"
	cd butler_offline
	CFLAGS+=' -ffat-lto-objects' cargo build --release
	cd ..
	cd application-wrapper/BudgetButlerWeb
	npm run package
	cd ..
}

check() {
	cd "$_pkgnameshort"
	cd butler_offline
	CFLAGS+=' -ffat-lto-objects' cargo test
}

package() {
	cd "$_pkgnameshort"
	mkdir -p "${pkgdir}/usr/share/${_pkgnameshort}"
	install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/lib/"

	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgnameshort}/LICENSE"
	install -D -m644 "application-wrapper/BudgetButlerWeb/out/budgetbutlerweb-linux-x64/resources/app.asar" "${pkgdir}/usr/share/${_pkgnameshort}/app.asar"
	install -D -m644 "application-wrapper/BudgetButlerWeb/src/BBFav.png" "${pkgdir}/usr/share/${_pkgnameshort}/icon.png"

	install -D -m644 "application-wrapper/BudgetButlerWeb.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -D -m755 "butler_offline/target/release/budgetbutlerweboffline" "${pkgdir}/usr/lib/${_pkgnameshort}/budgetbutlerweb-backend"
	install -D -m755 "application-wrapper/budgetbutlerweb" "${pkgdir}/usr/lib/${_pkgnameshort}/budgetbutlerweb"

	cp -r "butler_offline/static" "${pkgdir}/usr/share/${_pkgnameshort}/"

	ln -s "/usr/lib/${_pkgnameshort}/budgetbutlerweb-backend" "${pkgdir}/usr/bin/budgetbutlerweb-backend"
	ln -s "/usr/lib/${_pkgnameshort}/budgetbutlerweb" "${pkgdir}/usr/bin/budgetbutlerweb"
}
