# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-git
pkgver=1.1.2
pkgrel=1
pkgdesc="Feature rich Discord TUI client."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('GPL-3.0-only')
provides=('endcord')
conflicts=('endcord')
depends=()
makedepends=('python>=3.12' 'uv' 'git' 'clang' 'patchelf')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player')
source=("git+$url.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd endcord
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd endcord
	uv sync --all-groups
}

build() {
	cd endcord
	uv run build.py --nuitka --clang
}

package() {
	cd endcord
	install -Dm755 ./dist/endcord "$pkgdir/usr/bin/endcord"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/endcord/README.md"
	install -Dm644 ./commands.md "$pkgdir/usr/share/doc/endcord/commands.md"
	install -Dm644 ./configuration.md "$pkgdir/usr/share/doc/endcord/configuration.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/endcord/LICENSE"
}
