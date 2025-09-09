# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-bin
pkgver=4.5.3
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (with packaged libraries and python3.11)"
arch=('x86_64')
url="https://blender.org"
license=(
  Apache-2.0
  Bitstream-Vera
  BSD-2-Clause
  BSD-3-Clause
  BSL-1.0
  bzip2-1.0.6
  FTL
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
  libpng-2.0
  libtiff
  MIT-Khronos-old
  MIT
  MPL-2.0
  NCSA
  OFL-1.1
  Python-2.0
  SGI-B-2.0
  Zlib
  LicenseRef-Arev-Fonts
  LicenseRef-ICS
  LicenseRef-LLVM-exception
  LicenseRef-TOST-1.0
)
depends=('glibc' 'bash' 'hicolor-icon-theme'
'libxkbcommon'
'libxi'
'libglvnd'
'libxt'
'libxfixes'
'libxxf86vm'
'libsm'
'libice'
'mesa'
'libxcrypt-compat'
'libxext'
'zstd'
'libxrender'
'libxcb'
'util-linux-libs'
'libdrm'
'ncurses'
'libx11'
'gcc-libs'
'zlib'
'opengl-driver'
'vulkan-driver')
optdepends=('cuda: Cycles renderer CUDA support'
            'intel-compute-runtime: Cycles renderer Intel OneAPI support'
	    'level-zero-loader: Cycles rrender Intel OneAPI support'
            'libdecor: wayland support'
	    'hip-runtime-amd: HIP renderer AMD support')
provides=('blender')
conflicts=('blender')
source=("https://download.blender.org/release/Blender${pkgver:0:3}/blender-${pkgver}-linux-x64.tar.xz"
	"x-blender.xml")
sha256sums=('975c58fcb244273838534bba771e64ad87739216b0f9b39a888531a49a72d845'
            '230fc11e49d647215f4735117761d887756823ee1c8fab08987218fd037de75c')
validpgpkeys=()

package() {
	cd "$srcdir/blender-$pkgver-linux-x64"
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
	install -Dm755 {blender,blender-thumbnailer} "${pkgdir}/usr/lib/blender-bin/"
	install -Dm644 blender-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-symbolic.svg"
	install -Dm644 blender.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender.svg"
	install -Dm644 copyright.txt "${pkgdir}/usr/share/licenses/$pkgname/copyright.txt"
	install -Dm644 readme.html "${pkgdir}/usr/share/doc/$pkgname/readme.html"
	install -Dm644 blender.desktop "${pkgdir}/usr/share/applications/blender.desktop"
	install -Dm644 "$srcdir/x-blender.xml" "${pkgdir}/usr/share/mime/application/x-blender.xml"
	
	cp -a -r "${pkgver:0:3}" {lib,textures,usd} "${pkgdir}/usr/lib/${pkgname}"
	cp -a -r -T license "${pkgdir}/usr/share/licenses/${pkgname}"
	pushd "${pkgdir}/usr/lib/${pkgname}/lib"
	for file in *.so*;
	do
		chmod 755 "$file"
	done
	popd
	pushd "${pkgdir}/usr/lib/${pkgname}/lib/mesa"
	for file in *.so*;
	do
		chmod 755 "$file"
	done
	popd

	install -Dm755 blender-launcher "$pkgdir/usr/bin/blender"
	install -Dm755 blender-softwaregl "$pkgdir/usr/bin/blender-softwaregl"
	install -Dm755 blender-system-info.sh "$pkgdir/usr/bin/blender-system-info"
	ln -s "/usr/lib/$pkgname/blender-thumbnailer" "$pkgdir/usr/bin/blender-thumbnailer"
	sed -i 's/\$(dirname "\$(readlink -f "\$0")")/\/usr\/lib\/blender-bin/g' "$pkgdir/usr/bin/blender"
	sed -i 's/BF_DIST_BIN=\$(dirname "\$0")/BF_DIST_BIN=\/usr\/lib\/blender-bin/g' "$pkgdir/usr/bin/blender-softwaregl"
	sed -i 's/BASE_DIR=\$(dirname "\$0")/BASE_DIR=\/usr\/lib\/blender-bin/g' "$pkgdir/usr/bin/blender-system-info"
}
