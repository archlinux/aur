# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=blender-bin
pkgver=4.2.3
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
'libxkbcommon'
'libxi'
'libglvnd'
'libxt'
'libxfixes'
'libxxf86vm'
'level-zero-loader'
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
'zlib')
optdepends=('cuda: Cycles renderer CUDA support'
            'intel-compute-runtime: Cycles renderer Intel OneAPI support'
            'libdecor: wayland support'
	    'rocm-hip-runtime: HIP renderer AMD support'
	    'libdecor: Wayland Support')
provides=('blender')
conflicts=('blender')
install=$pkgname.install
source=("https://download.blender.org/release/Blender${pkgver:0:3}/blender-${pkgver}-linux-x64.tar.xz")
sha256sums=('3a64efd1982465395abab4259b4091d5c8c56054c7267e9633e4f702a71ea3f4')
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
	
	cp -a -r "${pkgver:0:3}" {lib,textures,usd} "${pkgdir}/usr/lib/${pkgname}"
	pushd "$srcdir/blender-$pkgver-linux-x64/license/"
	for file in *.txt;
	do
		install -Dm644 $file "$pkgdir/usr/share/licenses/${pkgname}/$file"
	done
	popd
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
	ln -s "/usr/lib/$pkgname/blender-thumbnailer" "$pkgdir/usr/bin/blender-thumbnailer"
	sed -i 's/\$(dirname "\$(readlink -f "\$0")")/\/usr\/lib\/blender-bin/g' "$pkgdir/usr/bin/blender"
	sed -i 's/BF_DIST_BIN=\$(dirname "\$0")/BF_DIST_BIN=\/usr\/lib\/blender-bin/g' "$pkgdir/usr/bin/blender-softwaregl"
}
