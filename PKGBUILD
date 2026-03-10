# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ironclad-rivet-bin
pkgver=1.11.3
pkgrel=8
pkgdesc="IDE for creating complex AI agents and prompt chaining"
arch=('x86_64')
url="https://github.com/Ironclad/rivet"
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'webkit2gtk')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Ironclad/rivet/main/LICENSE")
sha256sums=('d15b6086fd49f82079be457e0c6ee07c8ea1fcfc2ea97ad42e53710e3096960c')
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/Ironclad/rivet/releases/download/app-v${pkgver}/rivet_${pkgver}_amd64.deb")
sha256sums_x86_64=('f631a75af5507fdb8c41efc288a8a7331d71cedda44bb086aec4b12f471bba45')

latestver() {
	curl -fsSL 'https://api.github.com/repos/Ironclad/rivet/releases/latest' | jq -r '.assets[]?.name' |
	sed -nE '/^rivet_[0-9.]+_amd64\.deb$/{s/^rivet_//; s/_amd64\.deb$//; p;}'
}

package() {
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# Relocate binaries to /opt so Tauri sidecars (pnpm, app-executor)
	# don't pollute /usr/bin
	install -dm755 "${pkgdir}/opt/ironclad-rivet"
	mv "${pkgdir}/usr/bin/"* "${pkgdir}/opt/ironclad-rivet/"
	rmdir "${pkgdir}/usr/bin"

	# Symlink only the main binary
	install -dm755 "${pkgdir}/usr/bin"
	ln -s /opt/ironclad-rivet/rivet "${pkgdir}/usr/bin/rivet"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
