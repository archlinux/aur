# Maintainer: Mr.Wizard <process-pylon-62 at icloud.com>
pkgname=arculator_gcc15
pkgver=2.2_gcc15
pkgrel=1
pkgdesc="Arculator (Acorn Archimedes emulator), patched to compile under modern GCC"
arch=('x86_64')
url="https://github.com/Venomtek/arculator_gcc15"
license=('GPL2')
depends=('sdl2' 'wxwidgets-gtk3' 'zlib' 'alsa-lib' 'libx11' 'glibc')
makedepends=('git')
provides=('arculator')
conflicts=('arculator')
source=("$pkgname-$pkgver::git+https://github.com/Venomtek/arculator-gcc15.git#tag=v$pkgver"
        "arculator.sh")
sha256sums=('110d096f35ed3554c29adc38f06abebc30a56f3cb164cfa231b35a6108af80e6'
            '14770655c50ae0a560ac47c1bbee64569516f6ad557a8aa6c2ef14caba2a1432')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	touch aclocal.m4
	touch configure
	find . -name 'Makefile.in' -exec touch {} \;

	./configure --prefix=/usr --enable-release-build
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 arculator "$pkgdir/usr/share/arculator/arculator"

	for so in podules/*/*.so; do
		[ -e "$so" ] || continue
		name="$(basename "$(dirname "$so")")"
		install -Dm755 "$so" "$pkgdir/usr/share/arculator/podules/$name/$(basename "$so")"
	done

	cp -a roms "$pkgdir/usr/share/arculator/roms"
	cp -a configs "$pkgdir/usr/share/arculator/configs"
	cp -a cmos "$pkgdir/usr/share/arculator/cmos"
	cp -a ddnoise "$pkgdir/usr/share/arculator/ddnoise"

	find "$pkgdir/usr/share/arculator/roms" "$pkgdir/usr/share/arculator/configs" \
	     "$pkgdir/usr/share/arculator/cmos" "$pkgdir/usr/share/arculator/ddnoise" \
	     -type d -exec chmod 755 {} \;
	find "$pkgdir/usr/share/arculator/roms" "$pkgdir/usr/share/arculator/configs" \
	     "$pkgdir/usr/share/arculator/cmos" "$pkgdir/usr/share/arculator/ddnoise" \
	     -type f -exec chmod 644 {} \;

	install -Dm755 "$srcdir/arculator.sh" "$pkgdir/usr/bin/arculator"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
