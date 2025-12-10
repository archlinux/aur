pkgname=uzdoom-bin
pkgver=4.14.3
pkgrel=3
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
arch=('x86_64')
url="https://github.com/UZDoom/UZDoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'libvpx' 'patchelf')
conflicts=("uzdoom")
provides=("uzdoom")
makedepends=('unzip')
sha256sums=('99a21d47dae420d62a9689d8e2dc90135c5cd36ef52191df2ac92a17823e6ad1')
sha256sums_x86_64=('7a0918ab951da5ffe873b7d479f701c09c216e0a23d821eef4548283ba43a167')
source_x86_64=("$url/releases/download/$pkgver/Linux-UZDoom-$pkgver.AppImage")
source=("uzdoom")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/uzdoom"
    install -dm755 "$pkgdir/usr/share/uzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd $srcdir
    chmod +x Linux-UZDoom-$pkgver.AppImage
    ./Linux-UZDoom-$pkgver.AppImage --appimage-extract
   
    # Remove conflicting system-owned MIME files
      rm -f "$srcdir/squashfs-root/usr/share/mime/application/x-doom-pk3.xml" \
      "$srcdir/squashfs-root/usr/share/mime/application/x-doom-pk7.xml"
       
        
    mimeconflicts=(
      XMLnamespaces
      aliases
      application/x-doom-wad.xml
      generic-icons
      globs
      globs2
      icons
      magic
      mime.cache
      subclasses
      treemagic
      types
      version
    )

    for f in "${mimeconflicts[@]}"; do
      rm -f "$srcdir/squashfs-root/usr/share/mime/$f"
    done
    
   #zmusic lib move
    find "$srcdir/squashfs-root/usr/lib/x86_64-linux-gnu" -maxdepth 1 -name 'libzmusic.so.*' -exec mv {} "$pkgdir/usr/lib/uzdoom/" \;
   #cleanup 
    rm -rf "$srcdir/squashfs-root/usr/lib"
    
    cp -r "$srcdir/squashfs-root/usr" "$pkgdir"
    cp -r "$srcdir/uzdoom" "$pkgdir/usr/bin"
   #Patch binary and lib fix
    patchelf --set-interpreter "/lib64/ld-linux-x86-64.so.2" "$pkgdir/usr/bin/uzdoom.bin"
    cp -a "$srcdir/squashfs-root/lib/x86_64-linux-gnu/." "$pkgdir/usr/lib/uzdoom/"
    
    
}
