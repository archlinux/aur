# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Feature rich Discord TUI client."
arch=('any')
url="https://github.com/mzivic7/$pkgname"
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

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	uv sync --all-groups
}

build() {
	cd "$pkgname"
	uv run build.py --nuitka --clang
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./commands.md "$pkgdir/usr/share/doc/$pkgname/commands.md"
	install -Dm644 ./configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
