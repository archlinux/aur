# Maintainer: Kimiblock Moe
pkgname=clash-nyanpasu
_pkgname=clash-nyanpasu
pkgver=1.4.2
_tag=517e16645abdf3f969d682522693342a883265ad
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('any')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL-3.0')
depends=('webkit2gtk' 'clash-geoip' 'libayatana-appindicator' "clash-meta-is-mihomo")
makedepends=('yarn' 'cargo-tauri' 'jq' 'moreutils' 'rust' 'quickjs' 'git' 'pnpm' 'clang')
optdepends=('clash' 'clash-rs')
source=("git+https://github.com/keiko233/clash-nyanpasu.git#tag=${_tag}"
	"${_pkgname}.desktop"
)
provides=(clash-nyanpasu)
conflicts=()

sha512sums=('SKIP' 'SKIP')
options=(!lto)

function prepare(){
	cd "${srcdir}/clash-nyanpasu"
	ln -sf backend/tauri/ src-tauri

	install -d src-tauri/sidecar
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-meta-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-meta-alpha-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/mihomo-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/mihomo-alpha-${CARCH}-unknown-linux-gnu
	ln -sf /usr/bin/clash-meta src-tauri/sidecar/clash-rs-${CARCH}-unknown-linux-gnu

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
	#export RUSTFLAGS="-L /usr/lib/quickjs"
	#yarn install
	#yarn run check
	#cargo-tauri build
	pnpm i
	pnpm check
	#pnpm dev
	pnpm build
}
package(){
	cd "${srcdir}/clash-nyanpasu"
	install -Dm755 "${srcdir}/clash-nyanpasu/backend/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"

	install -d "${pkgdir}/usr/lib/${_pkgname}/resources"
	ln -sf /etc/clash/Country.mmdb -t "${pkgdir}/usr/lib/${_pkgname}/resources"

	install -Dm644 src/assets/image/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
