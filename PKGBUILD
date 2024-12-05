# Maintainer: HeliumAnt <lesgoets@gmail.com>
pkgname="cortexcommand"
pkgver=6.2.2
pkgrel=3
pkgdesc="Cortex Command Community Project"
arch=('x86_64')
url="https://cortex-command-community.github.io/"
license=('AGPL-3.0-only WITH GPL-3.0-linking-exception' 'LicenseRef-FMOD-EULA')
provides=('cortexcommand')
conflicts=('cortexcommand-git')
depends=('bash' 'sdl2' 'sdl2_image' 'tbb' 'luajit' 'minizip' 'lz4' 'libpng' 'hicolor-icon-theme')
makedepends=('meson' 'ninja' 'git' 'flac')
source=("$pkgname::git+https://github.com/cortex-command-community/Cortex-Command-Community-Project.git#tag=v$pkgver"
"runner.patch::https://github.com/cortex-command-community/Cortex-Command-Community-Project/pull/128.patch"
"luabind-error-check.patch"
"FMOD EULA::https://www.fmod.com/legal")
sha256sums=('77ee053b20b089911c1328156eb3443312b8e080847fb806c40012d9cf4131f4'
            '9945be7b1f4b977bb5d11acd6b876b156e6212bfbd4b78c1889e9847d6cdf66e'
            '934ea12c3e221507e6cc15ad72f4c35145efda407033392c6a31c64b35828589'
            'SKIP')

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/runner.patch"
	patch -p1 -i "$srcdir/luabind-error-check.patch"
}

build() {
	arch-meson --prefix=/usr/ -Dtracy_enable=true -Dtracy_on_demand=true -Dcpp_args="['-DTRACY_ONLY_LOCALHOST']" "$srcdir/$pkgname" "$srcdir/$pkgname/build"
	meson compile -C "$srcdir/$pkgname/build"
}

package() {
	meson install -C "$srcdir/$pkgname/build" --destdir "$pkgdir"
	install -Dm644 "$srcdir/$pkgname/Licences/FMOD.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/FMOD.txt"
}
