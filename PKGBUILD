# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord-gui-git
pkgver=1.5.4
pkgrel=1
pkgdesc="Feature rich Discord 'TUI' client. Windowed 'GUI' version using GTK3."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('LicenseRef-SparkLost')
provides=('endcord-gui')
conflicts=('endcord-gui')
depends=('gtk3')
makedepends=('python>=3.12' 'uv' 'git' 'clang' 'patchelf' 'wget' 'libgirepository')
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

build() {
	cd endcord
	python build.py --toggle-windowed
	python build.py --clean-uv --level=FULL --nuitka --custom-python
}

package() {
	cd endcord
	install -Dm755 ./dist/endcord "$pkgdir/usr/bin/endcord"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/endcord/README.md"
	install -Dm644 ./docs/commands.md "$pkgdir/usr/share/doc/endcord/commands.md"
	install -Dm644 ./docs/configuration.md "$pkgdir/usr/share/doc/endcord/configuration.md"
	install -Dm644 ./docs/extensions.md "$pkgdir/usr/share/doc/endcord/extensions.md"
	install -Dm644 ./docs/keybindings.md "$pkgdir/usr/share/doc/endcord/keybindings.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/endcord/LICENSE"
	install -Dm644 ./tools/com.sparklost.endcord.desktop "$pkgdir/usr/share/applications/com.sparklost.endcord.desktop"
    install -Dm644 ./tools/icons/endcord.svg "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.sparklost.endcord.svg"
}
