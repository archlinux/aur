# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: SpaghettiCat <d_the_m101 at yahoo dot co dot uk>
# Based on "gargoyle" package maintained by:
#     Beej <beej@beej.us>
#     Michael Smith <michael at diglumi dot com>
#     Marcin Skory <armitage at q84fh dot net>
#     with Contribution of Eric Forgeot < http://ifiction.free.fr >
pkgname=gargoyle-git
pkgver=2022.1.r697.gbe5d331d
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats (development version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/garglk/garglk"
license=('GPL-2.0-only' 'GPL-2.0-or-later' 'Artistic-2.0' 'GPL-3.0-only' 'MIT' 'BSD-3-Clause' 'OFL-1.1')
depends=('sdl2_mixer' 'sdl2' 'freetype2' 'qt6-base' 'fontconfig' 'libjpeg' 'libpng' 'zlib' 'hicolor-icon-theme' 'fmt')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils' 'git')
optdepends=('speech-dispatcher: text-to-speech support')
provides=('gargoyle')
conflicts=('gargoyle-mod' 'gargoyle')
replaces=('gargoyle-mod' 'gargoyle')
backup=('etc/garglk.ini')
source=("$pkgname::git+https://github.com/garglk/garglk.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${pkgname}" -B "build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBEXECDIR=lib -DWITH_TTS=DYNAMIC -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build "build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
	cd "gargoyle-git"
	sed -n '/Copyright (c)/,/DEALINGS IN THE SOFTWARE\./p' \
        terps/git/README.txt > terps/git/LICENSE
	local license_dir="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/$pkgname/License.txt" "$license_dir/LICENSE"
    install -Dm644 "$srcdir/$pkgname/licenses/BSD-2-Clause.txt" "$license_dir/BSD-2-Clause.txt"
    install -Dm644 "$srcdir/$pkgname/licenses/Go Mono.txt" "$license_dir/BSD-3-Clause-Go-Mono.txt"
    install -Dm644 "$srcdir/$pkgname/terps/advsys/LICENSE" "$license_dir/BSD-3-Clause-AdvSys.txt"
    install -Dm644 "$srcdir/$pkgname/terps/git/LICENSE" "$license_dir/MIT-Git.txt"
    install -Dm644 "$srcdir/$pkgname/terps/glulxe/LICENSE" "$license_dir/MIT-Glulxe.txt"
    install -Dm644 "$srcdir/$pkgname/licenses/Charis SIL.txt" "$license_dir/OFL-1.1.txt"
    install -Dm644 "$srcdir/$pkgname/garglk/garglk.ini" -t "$pkgdir/etc/"
}
