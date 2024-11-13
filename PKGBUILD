# Maintainer: Kimiblock Moe
pkgname=clash-nyanpasu-git
_pkgname=clash-nyanpasu
pkgver=1.6.1
pkgrel=1
epoch=1
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64' 'aarch64')
url="https://github.com/keiko233/clash-nyanpasu"
license=('GPL-3.0-or-later')
depends=('webkit2gtk' 'clash-geoip' 'libayatana-appindicator' "clash-meta-is-mihomo")
makedepends=('yarn' 'cargo-tauri' 'jq' 'moreutils' 'rust-nightly' 'cargo-nightly' 'git' 'pnpm' 'clang' 'nodejs')
optdepends=('clash' 'clash-rs')
source=("git+https://github.com/keiko233/clash-nyanpasu.git"
	"${_pkgname}.desktop"
)
provides=(clash-nyanpasu)
conflicts=(clash-nyanpasu)

md5sums=('SKIP'
         'dd4941019472522f508039a0b649d77d')
options=(strip !debug !lto !debug)

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
	# jq '.tauri.updater.active = false' tauri.conf.json|sponge tauri.conf.json
	pnpm i
	pnpm check
	cd "${srcdir}/clash-nyanpasu/backend/tauri"
	cd "${srcdir}/clash-nyanpasu"
	pnpm -r build
}

function build(){
	cd "${srcdir}/clash-nyanpasu"
	pnpm build
}
package(){
	cd "${srcdir}/clash-nyanpasu"
	install -Dm755 "${srcdir}/clash-nyanpasu/backend/target/release/${_pkgname}" -t "${pkgdir}/usr/bin"

	install -d "${pkgdir}/usr/lib/${_pkgname}/resources"
	ln -sf /etc/clash/Country.mmdb -t "${pkgdir}/usr/lib/${_pkgname}/resources"

	if [ -f frontend/nyanpasu/src/assets/image/logo.svg ]; then
		install -Dm644 frontend/nyanpasu/src/assets/image/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	else
		install -Dm644 src/assets/image/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	fi

	install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

function pkgver() {
	cd "${srcdir}/clash-nyanpasu"
	git describe --long --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
