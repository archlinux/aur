# Maintainer: Alois <aloisianer@proton.me>
pkgname=tensamin-git
pkgver=3336ea
pkgrel=1
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64')
url="https://tensamin.net"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
makedepends=('git' 'npm')
provides=('tensamin')
conflicts=('tensamin' 'tensamin-bin')
source=("git+https://github.com/Tensamin/Frontend.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Frontend"
	git rev-parse HEAD | cut -c1-6
}

build() {
	command -v bun >/dev/null 2>&1 || sudo npm i -g bun

	cd "$srcdir/Frontend"
	bun install
	bun run build
	
	cd desktop
	bun install
	bun run build:git
}

package() {
	cd "$srcdir/Frontend/desktop/out"

	zipfile=$(find "$PWD" -path '*zip/linux/x64/*.zip' -print -quit)
	[[ -n "$zipfile" ]] || { echo "tensamin zip artifact not found"; exit 1; }

	extracted_dir=$(bsdtar -tf "$zipfile" | head -1 | cut -d/ -f1)

	install -dm755 "${pkgdir}/usr/lib"
	bsdtar -xf "$zipfile" -C "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/lib/${extracted_dir}" "${pkgdir}/usr/lib/tensamin"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s /usr/lib/tensamin/tensamin "${pkgdir}/usr/bin/tensamin"
}
