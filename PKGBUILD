# Maintainer: FabioLolix
# Maintainer: squitch

pkgname=tess-git
pkgver=0.4.3.r1.g4911a38
pkgrel=1
epoch=1
pkgdesc="Hackable, simple, rapid and beautiful terminal for the new era"
arch=(x86_64)
url="https://github.com/SquitchYT/Tess"
license=(MPL2)
depends=(gtk3 nss)
makedepends=(git npm cmake)
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
	install -D appintess.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/appintess.desktop"
    install -D src/img/Tess.png "${pkgdir}/usr/share/pixmaps/tess.png"

	if type "$kbuildsycoca5" > /dev/null; then
		kbuildsycoca5
	fi

    cd cli
	mkdir -p build
    cmake -S . -B build
    make -C build
    install -Dm755 build/tess-cli -t "${pkgdir}/usr/bin/"

	npm install
	npm run build

	mkdir -p "${pkgdir}/opt/tess"
    cd ../dist/linux-unpacked
	cp -r -f * "${pkgdir}/opt/tess/"
	ln -s "/opt/tess/tess" "${pkgdir}/usr/bin/tess"
}
