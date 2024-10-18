# Maintainer: SelfRef <arch@selfref.dev>

_basename=overlayed
pkgname=${_basename}-git
pkgver=r1014.4e92603
pkgrel=1
pkgdesc="A modern, open-source, and free voice chat overlay for Discord (git version)"
arch=('x86_64')
url="https://overlayed.dev"
license=('AGPL-3.0')
depends=('webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'librsvg')
makedepends=('git' 'pnpm' 'nvm' 'cargo')
optdepends=('discord: Needed for overlay to work')
provides=("$_basename")
conflicts=("$_basename")
source=(
	"$_basename::git+https://github.com/overlayeddev/overlayed.git"
	'overlayed.desktop'
)
sha256sums=('SKIP'
            '30ad415ebf2124f6fe4697ba915194c0aa76002aa70b17ecfeac966b158a5f33')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

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
	export CFLAGS="$CFLAGS -ffat-lto-objects" # prevent linker error

	pnpm build:desktop --no-bundle
}

package() {
	install -Dm644 ../overlayed.desktop $pkgdir/usr/share/applications/overlayed.desktop

	cd $_basename
	install -Dm755 apps/desktop/src-tauri/target/release/overlayed $pkgdir/usr/bin/overlayed
	install -Dm644 apps/desktop/src-tauri/icons/stable/32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/overlayed.png
	install -Dm644 apps/desktop/src-tauri/icons/stable/128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/overlayed.png
	install -Dm644 apps/desktop/src-tauri/icons/stable/128x128@2x.png $pkgdir/usr/share/icons/hicolor/256x256@2/apps/overlayed.png
}
