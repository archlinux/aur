# Maintainer: Kimiblock Moe
pkgname=clash-nyanpasu-git
_pkgname=clash-nyanpasu
pkgver=r1348.7768255
pkgrel=1
pkgdesc="A Clash GUI based on tauri."
arch=('any')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL-3.0-or-later')
depends=('webkit2gtk' 'clash-geoip' 'libayatana-appindicator' "clash-meta-is-mihomo")
makedepends=('yarn' 'cargo-tauri' 'jq' 'moreutils' 'rust' 'quickjs' 'git' 'pnpm' 'clang')
optdepends=('clash' 'clash-rs')
source=("git+https://github.com/LibNyanpasu/clash-nyanpasu.git"
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
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
