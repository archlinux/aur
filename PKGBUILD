# Maintainer: HeliumAnt <lesgoets@gmail.com>
pkgname="cortexcommand"
pkgver=6.2.2
pkgrel=2
pkgdesc="Cortex Command Community Project"
arch=('x86_64')
url="https://cortex-command-community.github.io/"
license=('AGPL-3.0-only' 'LicenseRef-FMOD-EULA')
provides=('cortexcommand')
conflicts=('cortexcommand-git')
depends=('bash' 'sdl2' 'sdl2_image' 'tbb' 'luajit' 'minizip' 'lz4' 'libpng' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'git' 'flac')
source=("$pkgname::git+https://github.com/cortex-command-community/Cortex-Command-Community-Project.git#tag=v$pkgver"
"runner.patch::https://github.com/cortex-command-community/Cortex-Command-Community-Project/pull/128.patch"
"FMOD EULA::https://www.fmod.com/legal")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/runner.patch"
}

build() {
	arch-meson --prefix=/usr/ -Dtracy_enable=true -Dtracy_on_demand=true -Dcpp_args="['-DTRACY_ONLY_LOCALHOST']" "$srcdir/$pkgname" "$srcdir/$pkgname/build"
	meson compile -C "$srcdir/$pkgname/build"
}

package() {
	meson install -C "$srcdir/$pkgname/build" --destdir "$pkgdir"
	install -Dm644 "$srcdir/$pkgname/Licences/FMOD.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/FMOD.txt"
}
