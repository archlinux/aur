# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=hugetracker-git
pkgver=v1.0.1.r5.9e31f80
pkgrel=1
pkgdesc='The music composition suite for the Nintendo Game Boy'
arch=('x86_64')
url='https://nickfa.ro/index.php?title=HUGETracker'
license=('custom:public domain')
provides=('hugetracker')
conflicts=('hugetracker')
makedepends=('fpc' 'git' 'lazarus')
# `rgbds` is shelled out to at runtime, but namcap doesn't know that.
# The program also explicitly makes calls to `fontconfig` and `pango`, so mark them
# explicitly, despite namcap's complaints.
depends=(fontconfig gdk-pixbuf2 glib2 gtk2 pango 'rgbds>=0.5.0' sdl2
	 libatk-1.0.so libcairo.so)
optdepends=('ffmpeg: "Export song" functionality')
source=('hugetracker::git+https://github.com/SuperDisk/hUGETracker'
        'git+https://github.com/ev1313/Pascal-SDL-2-Headers'
        'git+https://github.com/bgrabitmap/bgrabitmap'
        'git+https://github.com/SuperDisk/hUGEDriver'
        'git+https://github.com/olivluca/rackctls'
        'default_runtime_dir.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' '59e64986a039fc6dece071b94930f5855ff2d0c1a9a5740ad7af13d9d74b023f')


## CONFIGURATION
# These can be overridden from the environment if desired.

# Lazarus base directory
# Required since `~/.lazarus/environmentoptions.xml` may not contain a `LazarusDirectory` entry.
_lazdir="${LAZDIR:-/usr/lib/lazarus}"


pkgver() {
	cd "$srcdir/hugetracker"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	# TODO: apply patch to pass `ld` flags
	cd "$srcdir/hugetracker"

	git submodule init
	for module in Pascal-SDL-2-Headers bgrabitmap hUGEDriver rackctls; do
		git config submodule.$module.url "$srcdir/$module"
	done
	git -c protocol.file.allow=always submodule update

	# Copy the "dedicated to the public domain" line as a makeshift license file
	grep 'public domain' README.md >LICENSE

	patch -p1 -N <"$srcdir/default_runtime_dir.patch"
}

build() {
	cd "$srcdir/hugetracker"

	lazbuild --lazarusdir="${_lazdir}" --add-package-link src/rackctls/RackCtlsPkg.lpk
	lazbuild --lazarusdir="${_lazdir}" --add-package-link src/bgrabitmap/bgrabitmap/bgrabitmappack.lpk
	lazbuild --lazarusdir="${_lazdir}" src/hUGETracker.lpi --build-mode="Production Linux" --ws=gtk2

	rgblink <(rgbasm -E -i src/hUGEDriver src/hUGEDriver/hUGEDriver.asm -o -) \
	        <(rgbasm -i src/hUGEDriver/include src/halt.asm -o -) \
	        -n halt.sym -o - | rgbfix -vp 0xFF >halt.gb

	lazbuild --lazarusdir="${_lazdir}" src/uge2source/uge2source.lpi --build-mode="Default"
}

package() {
	cd "$srcdir/hugetracker"

	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dvsm 755 src/Release/hUGETracker "$pkgdir/usr/bin/hugetracker"

	install -Dvm 644 fonts/PixeliteTTF.ttf "$pkgdir/usr/share/hugetracker/PixeliteTTF.ttf"
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/" halt.{gb,sym}
	env -C src/hUGEDriver bash -c "git ls-files -z | grep -zEv '^(\.git|README|doc/|[^/]+_example/|tools/)' | xargs -0 -I '{}' install -Dvm 644 '{}' '$pkgdir/usr/share/hugetracker/hUGEDriver/{}'"
	find sample-songs -maxdepth 1 -type f -exec install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/Sample Songs/" '{}' +

	install -Dvsm 755 src/uge2source/uge2source "$pkgdir/usr/bin/uge2source"
}
