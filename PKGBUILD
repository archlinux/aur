# Maintainer: n0yd (AUR)

pkgname=takedawn-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Native port of Burnout 3: Takedown for the original Xbox (requires your own disc)'
arch=('x86_64')
url='https://github.com/xenophobentx/takedawn'
license=('MIT' 'LGPL-2.1-or-later' 'LGPL-3.0-only' 'BSD-3-Clause' 'Zlib' 'OFL-1.1' 'Apache-2.0' 'custom')
depends=('glibc' 'libgcc' 'libstdc++' 'libgomp' 'zlib' 'vulkan-icd-loader'
         'vulkan-driver' 'dbus' 'fontconfig' 'freetype2' 'libice' 'libsm'
         'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
makedepends=('squashfs-tools')
provides=("takedawn=$pkgver")
conflicts=('takedawn')
options=('!strip')
_appimage="Takedawn-${pkgver}-linux-x86_64.AppImage"
source=("$url/releases/download/v$pkgver/$_appimage")
noextract=("$_appimage")
sha256sums=('605ad3047c011bdd25d234b8b033959afff57162bc30f32d0ae8c4f86a271729')

prepare() {
    # SquashFS byte offset in the checksum-pinned 0.3.1 AppImage.
    unsquashfs -no-progress -force -offset 944632 -dest appdir "$_appimage"
}

package() {
    cd "$srcdir/appdir"

    install -d "$pkgdir/opt/takedawn" "$pkgdir/usr/bin"
    install -Dm755 AppRun "$pkgdir/opt/takedawn/AppRun"
    cp -a --no-preserve=ownership usr "$pkgdir/opt/takedawn/"
    # AppRun resolves its own symlink to locate the private runtime.
    ln -s ../../opt/takedawn/AppRun "$pkgdir/usr/bin/takedawn"

    install -d "$pkgdir/usr/share"
    mv "$pkgdir/opt/takedawn/usr/share/"{applications,icons} "$pkgdir/usr/share/"
    install -d "$pkgdir/usr/share/licenses"
    mv "$pkgdir/opt/takedawn/usr/share/licenses/takedawn" "$pkgdir/usr/share/licenses/$pkgname"
    rmdir "$pkgdir/opt/takedawn/usr/share/licenses"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
