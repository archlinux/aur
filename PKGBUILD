# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainer: Xenhat Hex (me@xenh.at)


pkgname=alchemy-next-viewer
pkgver=6.4.23.47436
pkgrel=1
pkgdesc="This is the next generation of Alchemy Viewer!"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'freealut: for OpenAL support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
makedepends=('cmake' 'gcc' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz' 'ninja')
conflicts=('alchemy')
provides=('alchemy-next')

source=("$pkgname"::'git+https://git.alchemyviewer.org/alchemy/alchemy-next.git' 'alchemy-next.desktop')
pkgver() {
	cat "$pkgname/build-linux-64/newview/viewer_version.txt"
}

prepare() {
	cd "$pkgname" || exit 1
	virtualenv ".venv" -p python3
	source ".venv/bin/activate"
	if command -v autobuild; then
		abver="$(autobuild --version)"
		echo "Found $abver"
		if [[ "${abver}" != "autobuild 2.1.0" ]]; then
			echo "Reinstalling autobuild to work around some bugs"
			pip3 uninstall --yes autobuild
		fi
	fi
	pip3 install --upgrade autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
	git reset --hard 52025a7c
	autobuild configure -A 64 -c ReleaseOS -- -DLL_TESTS:BOOL=OFF -DDISABLE_FATAL_WARNINGS=ON -DUSE_LTO:BOOL=ON
}

build() {
	cd "$pkgname/build-linux-64" || exit 1
	ninja -j$(nproc)
}

package() {
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/share/applications"

	mv "${pkgname}/build-linux-64/newview/packaged" "$pkgdir/opt/alchemy-next"

	install -Dm644 "alchemy-next.desktop" "$pkgdir/usr/share/applications/alchemy-next.desktop"
}
sha256sums=('SKIP'
            'd4eb1a048c26a17d5ab64c8961c1340007ba82502b88638cdf89f0af32ee3d50')
b2sums=('SKIP'
        '479bfaa80a807e81bda2a27fc44a330feb996272e5b99f4581ef516946d7d67fc20be8eb5f2ae41a2dc5afbf3dd448cb582c5fa3e123e83c92945aa35f2f009f')
md5sums=('SKIP'
         '6d65e849f37a05b8684d99185feaa07c')
