pkgname=clash-nyanpasu-git
_pkgname=clash-nyanpasu
pkgver=r1065.ae8197b
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64' 'aarch64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk' 'clash-geoip' 'libayatana-appindicator' 'clash-meta')
makedepends=('yarn' 'cargo-tauri' 'clash-meta'  'jq' 'moreutils' 'rust' 'quickjs')
optdepends=()
source=("git+https://github.com/keiko233/clash-nyanpasu.git"
	"${_pkgname}.desktop"
)
provides=(clash-nyanpasu-git clash-nyanpasu)
conflicts=(clash-nyanpasu)

sha512sums=('SKIP' 'SKIP')
options=(!lto)

function pkgver() {
	cd "${srcdir}/clash-nyanpasu"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function prepare(){
	cd "${srcdir}/clash-nyanpasu"

	install -d src-tauri/sidecar
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-meta-${CARCH}-unknown-linux-gnu

	install -d src-tauri/resources
	ln -sf /etc/clash/Country.mmdb src-tauri/resources/Country.mmdb
	jq 'del(.scripts.prepare)' package.json|sponge package.json

	cd src-tauri
	# only build the excutable
	jq '.tauri.bundle.active = false' tauri.conf.json|sponge tauri.conf.json
	# disable updater
	jq '.tauri.updater.active = false' tauri.conf.json|sponge tauri.conf.json
}

function build(){
	cd "${srcdir}/clash-nyanpasu"
	# export HOME=$srcdir
	export RUSTFLAGS="-L /usr/lib/quickjs"
	yarn install
	yarn run check
	cargo-tauri build
}
package(){
	cd "${srcdir}/clash-nyanpasu"
	install -Dm755 "src-tauri/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"

	install -d "${pkgdir}/usr/lib/${_pkgname}/resources"
	ln -sf /etc/clash/Country.mmdb -t "${pkgdir}/usr/lib/${_pkgname}/resources"

	install -Dm644 src/assets/image/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

}
