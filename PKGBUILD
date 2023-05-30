# Maintainer: Nixuge

pkgname=theseus-gui-git
_pkgname=theseus
pkgver=r135.9ea548c
pkgrel=1
pkgdesc='Official Modrinth launcher. Open-source, built by the community, for the community.'
url=https://github.com/modrinth/theseus
arch=(x86_64)
license=(GPL3)
conflicts=('theseus-gui')
provides=('theseus-gui')
makedepends=('cargo-tauri' 'yarn')
source=("git+https://github.com/modrinth/theseus")
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/theseus_gui/"

	# Bundle the deb only as it takes no time (unlike the appimage)
	# & contains every folder at their right place ready to go
	sed -i -E \
		"s|\"targets\": \"all\"|\"targets\": \"deb\"|" \
		"src-tauri/tauri.conf.json"

	yarn install
	cargo tauri build
}

package() {
	# Just copy everything from the deb bundle folder
	# Pretty convinient isn't it?
	# TODO: generate the "modrinth-app_0.0.1_amd64" automatically
	cp -r "${srcdir}/theseus/target/release/bundle/deb/modrinth-app_0.0.1_amd64/data/usr/" \
		"${pkgdir}"
}
