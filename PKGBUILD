# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=hugetracker-git
pkgver=1.0b9.r74.043fcaa
pkgrel=2
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
depends=('fontconfig' 'gtk2' 'pango' 'rgbds>=0.5.0' 'sdl2')
optdepends=('ffmpeg: "Export song" functionality')
source=('hugetracker::git+https://github.com/SuperDisk/hUGETracker'
        'git+https://github.com/ev1313/Pascal-SDL-2-Headers'
        'git+https://github.com/bgrabitmap/bgrabitmap'
        'git+https://github.com/SuperDisk/hUGEDriver'
        'git+https://github.com/olivluca/rackctls'
        'non-portable.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' '85b9d753bb88bd1999f8cdccf98130315b530a44f96e0bbb55c657f73ffa3ee6')


## CONFIGURATION
# These can be overridden from the environment if desired.

# Lazarus base directory
# Required since `~/.lazarus/environmentoptions.xml` may not contain a `LazarusDirectory` entry.
_lazdir="${LAZDIR:-/usr/lib/lazarus}"


# These modules, and only them, are required to build hUGETracker.
# For example, hUGEDriver is only required at runtime, so we only need its sources for `package()`,
# but not submodule'd for building.
_srcmods="Pascal-SDL-2-Headers bgrabitmap rackctls"

pkgver() {
	cd "$srcdir/hugetracker"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	# TODO: apply patch to pass `ld` flags
	cd "$srcdir/hugetracker"

	git submodule init
	# Intentionally not protecting the expansions of `_srcmods`, we want to iterate on each
	# module, not run this once!
	for module in $_srcmods; do
		git config submodule.$module.url "$srcdir/$module"
	done
	# Same as above
	git submodule update $_srcmods

	# Copy the "dedicated to the public domain" line as a makeshift license file
	grep 'public domain' README.md >LICENSE

	patch -p1 -i "$srcdir/non-portable.patch"
}

build() {
	cd "$srcdir/hugetracker"

	lazbuild --lazarusdir="${_lazdir}" --add-package-link rackctls/RackCtlsPkg.lpk
	lazbuild --lazarusdir="${_lazdir}" --add-package-link bgrabitmap/bgrabitmap/bgrabitmappack.lpk
	lazbuild --lazarusdir="${_lazdir}" hUGETracker.lpi --build-mode="Production Linux" --ws=gtk2

	rgbasm -i "$srcdir/hUGEDriver/include" -o - halt.asm | rgblink -o - -n halt.sym - | rgbfix -vp 0xFF >halt.gb
}

package() {
	cd "$srcdir/hugetracker"

	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dvsm 755 Release/hUGETracker "$pkgdir/usr/bin/hugetracker"

	install -Dvm 644 Resources/Fonts/PixeliteTTF.ttf "$pkgdir/usr/share/hugetracker/PixeliteTTF.ttf"
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/" halt.{gb,sym}
	env -C "$srcdir/hUGEDriver" bash -c "git ls-files -z | grep -zEv '^(\.git|README|doc/|[^/]+_example/|tools/)' | xargs -0 -I '{}' install -Dvm 644 '{}' '$pkgdir/usr/share/hugetracker/hUGEDriver/{}'"
	find "Resources/Sample Songs" -maxdepth 1 -type f -exec install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/Sample Songs/" '{}' +
}
