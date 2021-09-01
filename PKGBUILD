# Maintainer:
# Contributor: FabioLolix
# COntributor: squitch

pkgname=tess-git
pkgver=0.4.2.r1.g12ee207
pkgrel=1
epoch=1
pkgdesc="Hackable, simple, rapid and beautiful terminal for the new era"
arch=(x86_64)
url="https://github.com/SquitchYT/Tess"
license=(MPL2)
depends=(gtk3 nss)
makedepends=(git npm)
source=("git+https://github.com/SquitchYT/Tess.git")
sha256sums=('SKIP')

pkgver() {
  cd "Tess"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "Tess"

	install -D Tess.desktop "${pkgdir}/usr/share/applications/Tess.desktop"
	install -D tesshere.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/tesshere.desktop"

	if type "$kbuildsycoca5" > /dev/null; then
		kbuildsycoca5
	fi

	mkdir -p "${pkgdir}/opt/tess-cli"
	mkdir -p "${pkgdir}/usr/bin"

    cp "./src/img/Tess.png" "${pkgdir}/usr/bin/Tess.png"

	cd "cli"
	g++ main.cpp Class/*.cpp Utils/*.cpp Lib/*.cpp Lib/external/cpr/cpr/*.cpp -lpthread -lcurl -std=c++17 -o tess-cli

	cp -r -f tess-cli "${pkgdir}/opt/tess-cli/tess-cli" 
	ln -s "/opt/tess-cli/tess-cli" "${pkgdir}/usr/bin/tess-cli"

	cd ../

	mkdir -p "${pkgdir}/opt/tess"

	npm install
	npm run build

	cd "dist/linux-unpacked"

	cp -r -f * "${pkgdir}/opt/tess/"
	ln -s "/opt/tess/tess" "${pkgdir}/usr/bin/tess"
}
