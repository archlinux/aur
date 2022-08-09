# Maintainer: Sebastian Tobie <archlinux@sebastian-tobie.de>
# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# based on the PKGBUILD of sulis

pkgname=sulis-git
pkgver=0.6.0.20220330
pkgrel=1
pkgdesc='Turn based tactical RPG with several campaigns, written in Rust.'
arch=('x86_64')
url='https://www.sulisgame.com/'
license=('GPL3')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'gendesk')
source=(
	"sulis::git+https://github.com/Grokmoo/sulis.git"
	'sulis.png'
)
sha256sums=(
	'SKIP'
	'7bffe4886ea6dc139135790f8711611a1cccdc8d3b318ae18ff3227e915c604d'
)
options=('!lto')
conflicts=(
    'sulis'
    'sulis-bin'
)

pkgver() {
	cd sulis
	git log -1 HEAD --format='%(describe:tags,abbrev=0).%cs' |  sed 's/\([^-]*-g\)/r\1/;s/-//g'
}

prepare() {
    gendesk -f -n --pkgname "sulis" --name "Sulis" --pkgdesc "${pkgdesc}s" --exec="/opt/sulis/sulis" --categories=Game --icon sulis --path=/opt/sulis
    gendesk -f -n --pkgname "sulis-editor" --name 'Sulis Editor' --pkgdesc "${pkgdesc}s" --exec="/opt/sulis/sulis-editor" --categories=Game --icon sulis --path=/opt/sulis
}

build() {
	_srcdir="$PWD"
	cd "sulis"
	RUSTUP_TOOLCHAIN=stable cargo build --release --workspace --locked --all-features --target-dir="${_srcdir}/target"
}

package() {
	install -Dm755 'target/release/main' -T "${pkgdir}/opt/sulis/sulis"
	install -Dm755 'target/release/editor' -T "${pkgdir}/opt/sulis/editor"
	
	install -Dm644 'sulis.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'sulis-editor.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'sulis.png' -t "${pkgdir}/usr/share/pixmaps"

	cd "sulis"
	install -Dm644 'config.sample.yml' -t "${pkgdir}/opt/sulis"
	cp -r 'data' "${pkgdir}/opt/sulis/"
	cp -r 'campaigns' "${pkgdir}/opt/sulis/"
	cp -r 'mods' "${pkgdir}/opt/sulis/"
	
	install -Dm644 'docs/GPLv3-LICENSE' "${pkgdir}/usr/share/licenses/sulis/LICENSE"
}
