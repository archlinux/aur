# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=hugetracker-git
pkgver=1.0b9.r113.44d6246
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
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' '931d0cbac169a7c25a3ac575e54ed7d334379759e04014115ee87dee1fdecbaa')


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
	git submodule update

	# Copy the "dedicated to the public domain" line as a makeshift license file
	grep 'public domain' README.md >LICENSE

	patch -p1 -i "$srcdir/non-portable.patch"
}

build() {
	cd "$srcdir/hugetracker"

	lazbuild --lazarusdir="${_lazdir}" --add-package-link rackctls/RackCtlsPkg.lpk
	lazbuild --lazarusdir="${_lazdir}" --add-package-link bgrabitmap/bgrabitmap/bgrabitmappack.lpk
	lazbuild --lazarusdir="${_lazdir}" hUGETracker.lpi --build-mode="Production Linux" --ws=gtk2

	rgblink <(rgbasm -E -i hUGEDriver hUGEDriver/hUGEDriver.asm -o -) \
	        <(rgbasm -i hUGEDriver/include halt.asm -o -) \
                -n halt.sym -o - | rgbfix -vp 0xFF >halt.gb
}

package() {
	cd "$srcdir/hugetracker"

	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dvsm 755 Release/hUGETracker "$pkgdir/usr/bin/hugetracker"

	install -Dvm 644 Resources/Fonts/PixeliteTTF.ttf "$pkgdir/usr/share/hugetracker/PixeliteTTF.ttf"
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/" halt.{gb,sym}
	env -C "hUGEDriver" bash -c "git ls-files -z | grep -zEv '^(\.git|README|doc/|[^/]+_example/|tools/)' | xargs -0 -I '{}' install -Dvm 644 '{}' '$pkgdir/usr/share/hugetracker/hUGEDriver/{}'"
	find "Resources/Sample Songs" -maxdepth 1 -type f -exec install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/Sample Songs/" '{}' +
}
