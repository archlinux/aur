# Maintainer: n0vella <n0vella@outlook.com>
# This PKGBUILD compiles and installs the latest tag of the git repository
pkgname=cardo
pkgver=1.8.0
pkgrel=1
pkgdesc="Cardo podcast client"
arch=('x86_64')
url="https://github.com/cardo-podcast/cardo/"
license=('GPL-3.0-or-later')
groups=()
depends=('gtk3' 'webkit2gtk' 'sqlite')
makedepends=('git' 'cargo' 'pnpm' 'nodejs')
options=('!lto') # https://github.com/toeverything/AFFiNE/issues/6280#issuecomment-2041484627
provides=("cardo")
conflicts=("cardo")
source=("git+$url")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname}"
	git tag -l --sort=-creatordate | head -n 1
}

prepare() {
	cd "$srcdir/${pkgname}"
	git checkout $pkgver
	pnpm i
}

build() {
	cd "$srcdir/${pkgname}"
	pnpm run tauri build -b 'deb'
}


package() {
 	cp -rT "$srcdir/${pkgname}/src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data" "$pkgdir"
}
