# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-lite-git
pkgver=1.4.0
pkgrel=1
pkgdesc="Feature rich Discord TUI client. Lite version without terminal media player."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('GPL-3.0-only')
provides=('endcord-lite')
conflicts=('endcord-lite')
depends=()
makedepends=('python>=3.12' 'uv' 'git' 'clang' 'patchelf')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player'
            'imagemagick: make notification images round')
source=("git+$url.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
  cd "endcord"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "endcord"
	
	# setup python 3.13
	if uv python list --only-installed | grep -q '3.13'; then
        echo "Python 3.13 is already installed"
        PY_ALREADY_INSTALLED=true
    else
        uv python install 3.13
        PY_ALREADY_INSTALLED=false
    fi
	
	uv sync --all-groups
}

build() {
	cd "endcord"
	uv run build.py --lite --nuitka --clang
	
	# remove python 3.13
	if [ "$PY_ALREADY_INSTALLED" != "true" ]; then
        uv python uninstall 3.13  # Or exact version from 'uv python list'
    fi
}

package() {
	cd "endcord"
	install -Dm755 ./dist/endcord-lite "$pkgdir/usr/bin/endcord-lite"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/endcord-lite/README.md"
	install -Dm644 ./docs/commands.md "$pkgdir/usr/share/doc/endcord/commands.md"
	install -Dm644 ./docs/configuration.md "$pkgdir/usr/share/doc/endcord/configuration.md"
	install -Dm644 ./docs/extensions.md "$pkgdir/usr/share/doc/endcord/extensions.md"
	install -Dm644 ./docs/keybindings.md "$pkgdir/usr/share/doc/endcord/keybindings.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/endcord-lite/LICENSE"
	# install -Dm644 endcord.desktop "$pkgdir/usr/share/applications/endcord-lite.desktop"
    # install -Dm644 endcord.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/endcord-lite.svg"
}
