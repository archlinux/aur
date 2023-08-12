# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app
pkgver=0.4.0
pkgrel=2
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=('webkit2gtk' 'openssl-1.1')
conflicts=('modrinth-app-bin' 'modrinth-app-git')
makedepends=('rust' 'pnpm')
source=("theseus.tar.gz::https://github.com/modrinth/theseus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ef378704702216a60e1bc7c3f804edc04a6bba9cd7d07db1a366a0f3782033a')

build() {
	cd "${srcdir}/theseus-${pkgver}/theseus_gui/"

	sed -i -E \
		"s|\"targets\": \"all\"|\"targets\": \"deb\"|" \
		"src-tauri/tauri.conf.json"

	pnpm install
	pnpm tauri build
}

package() {
	folder=$(find . -type d -name "modrinth-app*") 2>/dev/null

	cp -r "${folder}/data/usr/" \
		"${pkgdir}"
}
