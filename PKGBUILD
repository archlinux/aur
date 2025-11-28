# Maintainer: Alois <aloisianer@proton.me>
pkgname=tensamin-git
_pkgname=tensamin
pkgver=9468f3
pkgrel=1
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64')
url="https://tensamin.net"
license=('custom')
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         libpulse libpulse.so
         nss # libnss3.so
         zlib libz.so
		 libxss)
makedepends=('git' 'npm' 'dpkg' 'fakeroot')
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
	debfile=$(find "$PWD" -path '*.deb' -print -quit)
	ar x "${debfile}"
	tar -xf data.tar.xz -C "${pkgdir}"
}
