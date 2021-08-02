pkgname=tess-nightly
pkgver=1.2r267.4f45f99
pkgrel=1
pkgdesc="Tess hackable, simple, rapid and beautiful terminal for the new era"
arch=(x86_64)
url="https://github.com/SquitchYT/Tess.git"
license=('unknown')
depends=('glib2' 'glibc')
makedepends=('git' 'npm')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "Tess"
  printf "1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "Tess"

	mkdir -p "${pkgdir}/usr/share/applications"
	cp -r -f Tess.desktop "${pkgdir}/usr/share/applications/Tess.desktop"

	mkdir -p "${pkgdir}/usr/share/kservices5/ServiceMenus/"
	cp -r -f tesshere.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/tesshere.desktop"

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
