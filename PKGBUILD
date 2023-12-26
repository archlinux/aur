# Maintainer: SuicideCatt <fr7g31@gmail.com>

pkgname=msdf-atlas-gen-git
pkgver=1.2.2.r12.g3cf874b
pkgrel=1
pkgdesc="MSDF font atlas generator"
url=https://github.com/Chlumsky/msdf-atlas-gen
arch=(x86_64)
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib)
makedepends=(git cmake ninja msdfgen-git2)
provides=(msdf-atlas-gen=$pkgver)
conflicts=(msdf-atlas-gen)

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
	cmake -B build -GNinja -DCMAKE_BUILD_TYPE=Release \
	-DMSDF_ATLAS_NO_ARTERY_FONT=ON \
	-DMSDF_ATLAS_USE_SKIA=OFF -DMSDF_ATLAS_USE_VCPKG=OFF \
	-DMSDF_ATLAS_MSDFGEN_EXTERNAL=ON \
	-DMSDF_ATLAS_INSTALL=ON -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package()
{
	cd $pkgname
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cmake --install build --prefix $pkgdir/usr
}
