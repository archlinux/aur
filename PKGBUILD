# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=amethyst-player-git
pkgver=v1.9.16.r29.g1e8a644
pkgrel=1
pkgdesc="Amethyst is an Electron-based cross-platform audio player with a node-based audio routing system."
arch=('x86_64' 'aarch64')
url="https://github.com/Geoxor/amethyst"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat' 'libvips' 'node-gyp')
source=("git+https://github.com/Geoxor/amethyst.git"
        "git+https://github.com/Geoxor/amethyst.discord.git")
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "amethyst"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "amethyst"
	gendesk -n -f --pkgname "amethyst" --pkgdesc "$pkgdesc" --exec="/opt/amethyst/amethyst"
	git submodule init
	git config submodule.src/plugins/amethyst.discord.url "$srcdir/amethyst.discord"
	git -c protocol.file.allow=always submodule update
	yarn
}

build() {
	cd "amethyst"
	yarn build && yarn electron-builder --linux dir --publish never
}

package() {
	cd "amethyst"
	install -Dm644 "amethyst.desktop" "$pkgdir/usr/share/applications/amethyst.desktop"
	install -d "$pkgdir/opt/amethyst" && cp -r release/build/linux-unpacked/* "$pkgdir/opt/amethyst"
	install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/amethyst.svg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/amethyst"
}
