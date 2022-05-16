# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sulis
pkgver=0.6.0
pkgrel=2
pkgdesc='Turn based tactical RPG with several campaigns, written in Rust.'
arch=('x86_64')
url='https://www.sulisgame.com/'
license=('GPL3')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'gendesk')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/Grokmoo/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	'sulis'
	'sulis-editor'
	'sulis.png'
)
sha256sums=(
	'2901ac87c2692020d0224a980b1558d92d12ce3217986063a77f3049171bb1f6'
	'e13df3c55b585ec4c9d5d6709e8600dae69311257b51f112aa1382dd4e3fbbd5'
	'e75d53f449b05542dbf39a8db3f300693955586a5e80a21de93fdeba25639658'
	'7bffe4886ea6dc139135790f8711611a1cccdc8d3b318ae18ff3227e915c604d'
)
options=('!lto')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	gendesk -f -n --pkgname "sulis" --pkgdesc "${pkgdesc}" --exec="sulis" --categories=Game --icon sulis
	gendesk -f -n --pkgname "sulis editor" --pkgdesc "Editor for Sulis." --exec="sulis-editor" --categories=Game --icon sulis
}

build() {
	cd "${_srcdir}"
	RUSTUP_TOOLCHAIN=stable cargo build --release --workspace --locked --all-features --target-dir="../target"
}

package() {
	install -Dm755 'sulis' -t "${pkgdir}/usr/bin"
	install -Dm755 'sulis-editor' -t "${pkgdir}/usr/bin"
	install -Dm755 'target/release/main' -t "${pkgdir}/opt/${pkgname}"
	install -Dm755 'target/release/editor' -t "${pkgdir}/opt/${pkgname}/editor"
	
	install -Dm644 'sulis.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'sulis editor.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'sulis.png' -t "${pkgdir}/usr/share/pixmaps"
	
	cd "${_srcdir}"
	install -Dm644 'config.sample.yml' -t "${pkgdir}/opt/${pkgname}"
	cp -r 'data' "${pkgdir}/opt/${pkgname}/"
	cp -r 'campaigns' "${pkgdir}/opt/${pkgname}/"
	cp -r 'mods' "${pkgdir}/opt/${pkgname}/"
	
	install -Dm644 'docs/GPLv3-LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	#cargo install --no-track --locked --all-features --target-dir="../target" --root "$pkgdir/usr/" --path "${_srcdir}"
}
