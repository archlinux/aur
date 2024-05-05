# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite"
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
	
	rsync -a -r "${pkgver:0:3}" "${pkgdir}/usr/lib/${pkgname}"

	cd "$srcdir/blender-$pkgver-linux-x64/lib"
	rsync -a -r materialx mesa usd "${pkgdir}/usr/lib/$pkgname/lib/"
	for file in *.so*;
	do
		install -Dm755 $file "${pkgdir}/usr/lib/$pkgname/lib/"
	done
	cd "$srcdir/blender-$pkgver-linux-x64/license"
	for file in *;
	do
		install -Dm644 $file "${pkgdir}/usr/share/licenses/$pkgname/"
	done

	mkdir -p "${pkgdir}/usr/bin"

	cat >> "${pkgdir}/usr/bin/blender" <<-EOF
#!/bin/sh
BF_DIST_BIN="/usr/lib/blender-bin"
BF_PROGRAM="blender"

# Add own lib folder first, because Steam or other environments may set an
# LD_LIBRARY_PATH that has priority over the runpath in the Blender excutable,
# but contains incompatible libraries.
LD_LIBRARY_PATH=\${BF_DIST_BIN}/lib:\${LD_LIBRARY_PATH}

export LD_LIBRARY_PATH

exec "\$BF_DIST_BIN/\$BF_PROGRAM" "\$@"
EOF

	chmod 755 "${pkgdir}/usr/bin/blender"
	chown -R root:root "${pkgdir}/usr"
}
