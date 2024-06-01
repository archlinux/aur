# Maintainer: Nixuge

pkgname=modrinth-app-git
_gitname=theseus
pkgver=r241.7394fdc
pkgrel=1
pkgdesc='Official Modrinth launcher. Open-source, built by the community, for the community.'
url=https://github.com/modrinth/theseus
arch=(x86_64)
license=(GPL3)
conflicts=('modrinth-app')
provides=('modrinth-app')
depends=('webkit2gtk')
makedepends=('cargo-tauri' 'pnpm' 'git')
options=(!lto !debug) # !lto = Enable devtools (thanks @FabioLolix)
source=("git+https://github.com/modrinth/theseus")
sha256sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/theseus_gui/"

	# Bundle the deb only as it takes no time (unlike the appimage)
	# & contains every folder at their right place ready to go
	sed -i -E \
		"s|\"targets\": \"all\"|\"targets\": \"deb\"|" \
		"src-tauri/tauri.conf.json"

	# Allow using other pnpm versions as this doesn't seem to cause errors
	# & doesn't require to install another pnpm version for no reason
	# (excepted = 8.6.0, current = 9.1.4)
	export COREPACK_ENABLE_STRICT=0
	pnpm install

	cargo tauri build
}

package() {
	# Grab the folder name (has the version embeeded in it)
	folder=$(find . -type d -name "modrinth-app*") 2>/dev/null

	# Then just copy everything from the deb bundle folder
	cp -r "${folder}/data/usr/" \
		"${pkgdir}"
}
