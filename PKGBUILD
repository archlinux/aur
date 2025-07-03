# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=dwgrep
pkgver=0.4
pkgrel=2
pkgdesc='Tool and library for querying Dwarf (debuginfo) graphs.'
url=http://pmachata.github.io/dwgrep/
arch=('i686' 'x86_64')
makedepends=(cmake flex bison)
license=(GPL-3.0-or-later LGPL-3.0-or-later)
depends=(libelf)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pmachata/dwgrep/archive/$pkgver.tar.gz"
        dwgrep-fix-cmake.patch)
sha512sums=('46d1ce472acb40dda46ac7fefcf9ed301f96208ed1eb0403c87793a10575d961772a8920e21bfbc672dc9c834d9c664aa675282f16a9e7a7b4c64fecc0fd855f'
            '1c8b77e7e575e409fc2d4be6069ac3efe92d32a16bd89876e170958d3a6a4a76e4f2040fa3d8c0c69a98ef90edca34ba4c7382413b988adcd96471de6bbc4e9d')

prepare () {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/dwgrep-fix-cmake.patch"
}

# TODO: Build documentation
build () {
	cd "$pkgname-$pkgver"
	cmake -B _build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM='3.5'
	make -C _build
}

package () {
	cd "$pkgname-$pkgver"
	make -C _build DESTDIR="$pkgdir" install

	# Fix library directory name in 64-bit targets.
	if [[ -d $pkgdir/usr/lib64 ]] ; then
		mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	fi
}
