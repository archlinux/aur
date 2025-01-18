# Maintainer: Eldred Habert <arch@eldred.fr>
pkgname=hugetracker
pkgver=1.0.11
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
	 libatk-1.0.so libcairo.so glibc libx11)
optdepends=('ffmpeg: "Export song" functionality')
source=("hUGETracker-${pkgver}.tar.gz::https://github.com/SuperDisk/hUGETracker/archive/refs/tags/v${pkgver}.tar.gz"
        'Pascal-SDL-2-Headers.tar.gz::https://github.com/ev1313/Pascal-SDL-2-Headers/archive/088eeb3af8b680898d9fcaff390eddce9744ee51.tar.gz'
        'bgrabitmap.tar.gz::https://github.com/bgrabitmap/bgrabitmap/archive/2814b069d55f726b9f3b4774d85d00dd72be9c05.tar.gz'
        'hUGEDriver.tar.gz::https://github.com/SuperDisk/hUGEDriver/archive/a3cbd0cea48e6784d7f625066d0300f7cb075926.tar.gz'
        'rackctls.tar.gz::https://github.com/olivluca/rackctls/archive/15c50fb5dd398875a274b3aa2c36aa769d145a11.tar.gz'
        'default_runtime_dir.patch')
sha256sums=('00c42903bf5fb7cd9302c12c0a66a6cfff51a743984bc1cc15ef758ec1ea95bc'
            '70a6b029365b9cb3c52628ea1419c5f2e379a2d960510560e6e730c8c5f907dc'
            'd9daea6027be28f6b2c30ee0fdd1c7fca8cc715d1bbb972403e844a42fa0f07c'
            '809a05d60fe3c81f50e497aeb83c32f43ffcde54f489388172086ad1579f91a6'
            'f069ba10fa267564a0bd88488e4d4ad31d013b07edadbf760f8b1197fba04042'
            '59e64986a039fc6dece071b94930f5855ff2d0c1a9a5740ad7af13d9d74b023f')


## CONFIGURATION
# These can be overridden from the environment if desired.

# Lazarus base directory
# Required since `~/.lazarus/environmentoptions.xml` may not contain a `LazarusDirectory` entry.
_lazdir="${LAZDIR:-/usr/lib/lazarus}"


prepare() {
	# TODO: apply patch to pass `ld` flags
	cd "$srcdir/hUGETracker-$pkgver"

	for _archive in ../*.tar.gz; do
		[[ "$_archive" != ../hUGETracker-*.tar.gz ]] || continue

		local _module=$(basename "${_archive%.tar.gz}")
		local _submodule=$(sed -E "/$_module/ ! d; s/^\s*path\s*=\s*(.+)$/\1/; t; d" .gitmodules)
		rmdir "$_submodule"
		local _target=$(tar tf "$_archive" | head -n 1)
		if ! [ -d "../$_target" ]; then # Sanity check, to print a user-friendly error message instead of cryptic "No such file or directory" error in build().
			printf 'The packager messed up: "%s" does not exist!\n' "$_target"
			false
		fi
		local _link=$(realpath --relative-to "$(dirname "$_submodule")" "../$_target")
		ln -svT "$_link" "$_submodule"
	done

	# Copy the "dedicated to the public domain" line as a makeshift license file.
	grep 'public domain' README.md >LICENSE

	patch -p1 -N <"$srcdir/default_runtime_dir.patch"
}

build() {
	cd "$srcdir/hUGETracker-$pkgver"

	lazbuild --lazarusdir="${_lazdir}" --add-package-link src/rackctls/RackCtlsPkg.lpk
	lazbuild --lazarusdir="${_lazdir}" --add-package-link src/bgrabitmap/bgrabitmap/bgrabitmappack.lpk
	lazbuild --lazarusdir="${_lazdir}" src/hUGETracker.lpi --build-mode="Production Linux" --ws=gtk2

	rgbasm -E -i src/hUGEDriver src/hUGEDriver/hUGEDriver.asm -o hUGEDriver.o
	rgbasm -i src/hUGEDriver/include src/halt.asm -o halt.o
	rgblink hUGEDriver.o halt.o -n halt.sym -o - | rgbfix -vp 0xFF - >halt.gb

	lazbuild --lazarusdir="${_lazdir}" src/uge2source/uge2source.lpi --build-mode="Default"
}

package() {
	cd "$srcdir/hUGETracker-$pkgver"

	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dvsm 755 src/Release/hUGETracker "$pkgdir/usr/bin/hugetracker"

	install -Dvm 644 fonts/PixeliteTTF.ttf "$pkgdir/usr/share/hugetracker/PixeliteTTF.ttf"
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/" halt.{gb,sym}
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/hUGEDriver" src/hUGEDriver/*.asm
	install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/hUGEDriver/include" src/hUGEDriver/include/*
	find sample-songs -maxdepth 1 -type f -exec install -Dvm 644 -t "$pkgdir/usr/share/hugetracker/Sample Songs/" '{}' +

	install -Dvsm 755 src/uge2source/uge2source "$pkgdir/usr/bin/uge2source"
}
