pkgname=openbor-bin
pkgrlname=openbor
pkgver=4.0.7533
pkgrel=2
pkgdesc="OpenBOR, a royalty free sprite-based side scrolling gaming engine."
arch=('x86_64' 'aarch64')
url="https://github.com/DCurrent/openbor"
license=('GPL')
depends=('unzip' 'sdl2' 'sdl2_gfx' 'libpng' 'libvorbis' 'libvpx')
makedepends=('unzip')
sha256sums=('c7725c4f3c9fa75fef18180665eb93fe47e1ce159f2fe996ba2f6cb408da6da6')
source=(https://github.com/DCurrent/openbor/releases/download/v7533/OpenBOR-Linux-x64-v4.0.Build.7533.AppImage)

prepare() {
    cd "$srcdir"
    for f in *.AppImage; do
    if [ ! -e "$pkgrlname.AppImage" ]; then
        mv -v "$f" "$pkgrlname.AppImage"
    else
        echo "File $pkgrlname.AppImage already exists, skipping."
    fi
    done
    chmod +x ./$pkgrlname.AppImage
    "./$pkgrlname.AppImage" --appimage-extract   
}
package() {
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/bin"

#Removing files and symlinks not needed from extraction.
    cd "$srcdir/squashfs-root"
    rm -rf .DirIcon AppRun openbor.desktop openbor.png
    
#Stripping out libs and other files
    if [ "$(uname -m)" = "aarch64" ]; then
      install -dm755 "$pkgdir/usr/lib/x86_64-linux-gnu/OpenBor"
      cp -r "$srcdir/squashfs-root/usr/lib/libSDL2_gfx-1.0.so.0" "$pkgdir/usr/lib/x86_64-linux-gnu/OpenBor"
      ln -sfn "/usr/lib/x86_64-linux-gnu/OpenBor/libSDL2_gfx-1.0.so.0" "$pkgdir/usr/lib/x86_64-linux-gnu/libSDL2_gfx-1.0.so.0"
    fi
    cd "$srcdir/squashfs-root/usr/lib"
    rm -rf libselinux.so.1 libwayland-cursor.so.0 libXau.so.6 libSDL2-2.0.so.0 libSDL2_gfx-1.0.so.0 libSDL2_gfx-1.0.so.0 libXcursor.so.1 libXdmcp.so.6 libXext.so.6 libXfixes.so.3 libXi.so.6 libXinerama.so.1 libXrandr.so.2 libXrender.so.1 libXss.so.1 libXxf86vm.so.1 libapparmor.so.1 libasyncns.so.0 libbsd.so.0 libdbus-1.so.3 libgcrypt.so.20 liblzma.so.5 libnsl.so.1 libogg.so.0 libpulse.so.0 libsndfile.so.1 libsystemd.so.0 libvorbis.so.0 libvorbisenc.so.2 libvorbisfile.so.3 libvpx.so.3 libvpx.so.3 libwayland-client.so.0 libwayland-egl.so.1 libxkbcommon.so.0 liblz4.so.1 libpng16.so.16
    rm -rf "$srcdir/squashfs-root/OpenBOR.desktop"
    rm -rf "$srcdir/squashfs-root/OpenBOR_Icon_128x128.png"

#symlinking lib file
    ln -s /usr/lib/libvpx.so $pkgdir/usr/lib/libvpx.so.3    
    cd $srcdir/squashfs-root
    cp -r ./ "$pkgdir"
    mv "$pkgdir/usr/bin/OpenBOR" "$pkgdir/usr/bin/openbor"        

#Desktop shortcut and icon fix
    mv "$pkgdir/usr/share/applications/OpenBOR.desktop" "$pkgdir/usr/share/applications/openbor.desktop"
    mv "$pkgdir/usr/share/icons/hicolor/128x128/apps/OpenBOR_Icon_128x128.png" "$pkgdir/usr/share/icons/openbor.png"
    sed -i 's/OpenBOR/openbor/g' "$pkgdir/usr/share/applications/openbor.desktop"
    sed -i 's/openbor_Icon_128x128/openbor/g' "$pkgdir/usr/share/applications/openbor.desktop"
}
