# Maintainer: HaroldLoui<Riven970309@gmail.com>
pkgname=minesweeper-tauri-git
base=minesweeper-tauri
pkgver=v0.2.0.r3.g8f84694
pkgrel=1
pkgdesc="A minesweeper game follow windowsXP style based on tauri."
arch=('x86_64' 'aarch64')
url="https://github.com/HaroldLoui/minesweeper-tauri"
license=('custom')
depends=('git' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('cargo-tauri' 'jq' 'rust' 'moreutils')
optdepends=('appmenu-gtk-module: Application Menu GTK+ Module')
source=(
    "${base}-${pkgver}-git::git+${url}"
    "${base}.desktop"
)

sha256sums=(
    'SKIP'
    '5608145f8050f7794bfd32c9016d2d2f6e0c39cf90e2f244feead154ceca3e60'
)

pkgver() {
	cd $srcdir/${base}-${pkgver}-git
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd $srcdir/${base}-${pkgver}-git

	cd src-tauri
	# only build the excutable
	jq '.tauri.bundle.active = false' tauri.conf.json|sponge tauri.conf.json
	# disable updater
	jq '.tauri.updater.active = false' tauri.conf.json|sponge tauri.conf.json
}

build(){
	cd $srcdir/${base}-${pkgver}-git
	cargo-tauri build
}

package(){
	cd $srcdir/${base}-${pkgver}-git
	install -Dm755 src-tauri/target/release/minesweeper -t ${pkgdir}/usr/bin/
	mv ${pkgdir}/usr/bin/minesweeper ${pkgdir}/usr/bin/minesweeper-tauri

	# Icons
	install -Dm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/${base}.png
	for i in 32x32 128x128; do
		install -Dm644 src-tauri/icons/${i}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/${base}.png
	done

	install -Dm644 ${srcdir}/${base}.desktop -t ${pkgdir}/usr/share/applications
}