# Maintainer: SelfRef <arch@selfref.dev>

_basename=overlayed
pkgname=${_basename}
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern, open-source, and free voice chat overlay for Discord (git version)"
arch=('x86_64')
url="https://overlayed.dev"
license=('AGPL-3.0')
depends=()
makedepends=('git' 'pnpm' 'nvm' cargo)
optdepends=('discord: Needed for overlay to work')
source=(
	"$_basename::git+https://github.com/overlayeddev/overlayed.git#tag=v$pkgver"
	'overlayed.desktop'
)
sha256sums=('SKIP'
            '30ad415ebf2124f6fe4697ba915194c0aa76002aa70b17ecfeac966b158a5f33')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd $_basename/apps/desktop

	_ensure_local_nvm
	nvm install 20
	pnpm install
}

build() {
	cd $_basename/apps/desktop

	_ensure_local_nvm
	export TURBO_UI=0

	# Use different methods to disable bundle for Tauri V1 or V2
	if tauri_version=$(pnpm tauri -V | grep -oP 'tauri-cli \K[0-9.]+') && [[ $tauri_version == 1* ]]; then
		pnpm build:desktop --config='{"tauri":{"bundle":{"active":false}}}'
	else
		pnpm build:desktop --no-bundle
	fi
}

package() {
	install -Dm644 ../overlayed.desktop $pkgdir/usr/share/applications/overlayed.desktop

	cd $_basename
	install -Dm755 apps/desktop/src-tauri/target/release/overlayed $pkgdir/usr/bin/overlayed

	# Directory name is gonna change in new version
	icons_dir=$( [[ -d apps/desktop/src-tauri/icons/stable ]] && echo stable || echo normal )

	install -Dm644 apps/desktop/src-tauri/icons/$icons_dir/32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/overlayed.png
	install -Dm644 apps/desktop/src-tauri/icons/$icons_dir/128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/overlayed.png
	install -Dm644 apps/desktop/src-tauri/icons/$icons_dir/128x128@2x.png $pkgdir/usr/share/icons/hicolor/256x256@2/apps/overlayed.png
}
