# Maintainer: Alois <aloisianer@proton.me>
pkgname=tensamin-git
pkgver=9d4d8a
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
	bun run build
}

package() {
	cd "$srcdir/Frontend/desktop/out/tensamin-linux-x64"
	
	install -dm755 "${pkgdir}/usr/lib/tensamin"
	cp -r . "${pkgdir}/usr/lib/tensamin/"
	
	install -dm755 "${pkgdir}/usr/bin"
	ln -s /usr/lib/tensamin/tensamin "${pkgdir}/usr/bin/tensamin"
}
