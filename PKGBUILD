# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-bin
pkgver=4.1.1
pkgrel=2
pkgdesc="A fully integrated 3D graphics creation suite (with packaged libraries and python3.11)"
arch=('x86_64')
url="https://blender.org"
license=(
  Apache-2.0
  BSD-2-Clause
  BSD-3-Clause
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
  MIT
  MPL-2.0
  Zlib
)
depends=('glibc' 'bash' 'hicolor-icon-theme'
'zlib'
'openal'
'libpng'
'libjpeg-turbo'
'blosc'
'libdeflate'
'freetype2'
'libepoxy'
'alembic'
'opencollada'
'minizip'
'llvm'
'openmp'
'openimageio'
'fmt'
'robin-map'
'libtiff'
'openshadinglanguage'
'openpgl'
'lame'
'libogg'
'libvorbis'
'libtheora'
'flac'
'libvpx'
'x264'
'openjpeg2'
'ffmpeg'
'fftw'
'libiconv'
'libsndfile'
'libwebp'
'jemalloc'
'libxml2'
'yaml-cpp'
'expat'
'pugixml'
'flex'
'openssl'
'sqlite'
'usd'
'glu'
'mesa'
'nasm'
'openxr'
'wayland-protocols'
'wayland'
'libdecor'
'gmp'
'potrace'
'libharu'
'zstd'
'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
'intel-oneapi-compiler-shared-runtime-libs'
)
optdepends=('cuda: Cycles renderer CUDA support'
            'intel-compute-runtime: Cycles renderer Intel OneAPI support'
            'libdecor: wayland support'
	    'rocm-hip-runtime: HIP renderer AMD support')
provides=('blender')
conflicts=('blender')
source=("https://download.blender.org/release/Blender${pkgver:0:3}/blender-${pkgver}-linux-x64.tar.xz")
sha256sums=('ab2ea3fe991601a5e6bd2cda786ecaa919c0b39e0550e59978b5d40270c260d3')
validpgpkeys=()

package() {
	cd "$srcdir/blender-$pkgver-linux-x64"
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/lib"
	install -Dm755 {blender,blender-softwaregl,blender-thumbnailer} "${pkgdir}/usr/lib/blender-bin/"
	install -Dm644 blender-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-symbolic.svg"
	install -Dm644 blender.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender.svg"
	install -Dm644 copyright.txt "${pkgdir}/usr/share/licenses/$pkgname/copyright.txt"
	install -Dm644 blender.desktop "${pkgdir}/usr/share/applications/blender.desktop"
	
	rsync -a -r "${pkgver:0:3}" lib "${pkgdir}/usr/lib/${pkgname}"
	rsync -a -r license/* "${pkgdir}/usr/share/licenses/${pkgname}/"
	cd "${pkgdir}/usr/lib/${pkgname}/lib"
	for file in *.so*;
	do
		chmod 755 "$file"
	done
	cd "$srcdir/blender-$pkgver-linux-x64"

	install -Dm755 blender-launcher "$pkgdir/usr/bin/blender"
	install -Dm755 blender-softwaregl "$pkgdir/usr/bin/blender-softwaregl"
	sed -i 's/BF_DIST_BIN=\$(dirname "\$0")/BF_DIST_BIN=\/usr\/lib\/blender-bin\//g' "$pkgdir/usr/bin/blender"
	sed -i 's/BF_DIST_BIN=\$(dirname "\$0")/BF_DIST_BIN=\/usr\/lib\/blender-lib\//g' "$pkgdir/usr/bin/blender-softwaregl"
}
