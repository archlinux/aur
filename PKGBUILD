# Maintainer: Maki <maki@hotmilk.space>
# Maintainer: SuicideCatt <fr7g31@gmail.com>

pkgname=msdfgen-git
pkgver=1.11.r8.g937f31f
pkgrel=1
pkgdesc="Multi-channel signed distance field generator binary and library"
url=https://github.com/Chlumsky/msdfgen
arch=(x86_64)
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib)
makedepends=(git cmake gcc make)
provides=(msdfgen=$pkgver)
conflicts=(msdfgen)

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver()
{
	cd $pkgname/
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd $pkgname/
	cmake -B build -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
	-DMSDFGEN_USE_SKIA=OFF -DMSDFGEN_USE_VCPKG=OFF \
	-DMSDFGEN_INSTALL=ON -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package()
{
	cd $pkgname/
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}
