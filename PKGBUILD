pkgname=uzdoom-bin
pkgver=5.0.1
pkgrel=2
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
arch=('x86_64')
url="https://github.com/UZDoom/UZDoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'libvpx' 'patchelf')
conflicts=("uzdoom")
provides=("uzdoom")
makedepends=('unzip')
sha256sums=('ad06218ce106dad785fac3c955fce5176addf183b7520d0f2673392c297d05ad')
sha256sums_x86_64=('a0fb4fd09264ec55827911316454eedb667fc22ac23b6d505a1a2a076b549e4f')
source=("uzdoom")
source_x86_64=("$url/releases/download/$pkgver/Linux-UZDoom-Release-x86_64.AppImage")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/uzdoom"
    install -dm755 "$pkgdir/usr/share/uzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cd $srcdir
    chmod +x Linux-UZDoom-Release-x86_64.AppImage
    ./Linux-UZDoom-Release-x86_64.AppImage --appimage-extract
   
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
    find "$srcdir/squashfs-root/usr/lib" -maxdepth 1 -name "libvpx.so.*" -exec mv {} "$pkgdir/usr/lib/uzdoom/" \;
   #cleanup 
    rm -rf "$srcdir/squashfs-root/usr/lib"
    
    cp -r "$srcdir/squashfs-root/usr" "$pkgdir"
    install -Dm755 "$startdir/uzdoom" "$pkgdir/usr/bin/uzdoom"
   #Patch binary and lib fix
    #patchelf --set-interpreter "/lib64/ld-linux-x86-64.so.2" "$pkgdir/usr/bin/uzdoom"
    cp -a "$srcdir/uzdoom" "$pkgdir/usr/bin/uzdoom"
    cp -a "$srcdir/squashfs-root/usr/bin/uzdoom" "$pkgdir/usr/share/uzdoom/uzdoom"
}
