pkgname=supermario64-sm64ex-git
pkgver=20bb444
pkgrel=1
scriptver=1.0.2
rpkgname=supermario64
_rpkgname=SuperMario64
pkgdesc="PC port of Super Mario 64."
arch=('x86_64' 'i386' 'pentium4' 'arm7h' 'aarch64')
url="https://github.com/sm64pc/sm64ex"
license=('GPL')
depends=('unzip')
makedepends=('unzip')
sha256sums=('972d84f4f6535f6a0738b628da4187b57c3e5c54dae3872b42c1d7a451535588'
            '60cdb3676c6ef75b39e7d8766b18611bc72c857c97504450988cc71b18299d41')
source=("git+https://github.com/sm64pc/sm64ex.git#commit=$pkgver" "https://gitlab.com/linuxbombay/supermario64/-/archive/$scriptver/supermario64-$scriptver.tar.bz2")

build() {  
  #yad --width=700 --info --title="SM64 Rom select" --image="info" --text="Please select the SuperMario64 rom to extract the games files, it can be "  --button="OK:1"
  selected_rom=$(zenity --file-selection --file-filter="*.n64 *.z64" --title="Select the SM64 ROM")
  cp -r "$selected_rom" "$srcdir/sm64ex/baserom.us.z64"
  cd "$srcdir/sm64ex"
  make BETTERCAMERA=1 EXTERNAL_DATA=1 -j$(nproc)
}

package() {
  install -dm755 "$pkgdir/usr/share/games/$_rpkgname"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/bin"
  
    [ -d "$srcdir/$rpkgname" ] && rm -rf "$srcdir/$rpkgname" 
    for dir in $rpkgname-$scriptver; do [ ! -e "$pkgname" ] && mv "$dir" "$rpkgname"; done
    cd $srcdir/$rpkgname/
    cp -r $rpkgname.png $rpkgname-title.png $rpkgname "$pkgdir/usr/share/games/$_rpkgname"   
    cp -r "$pkgdir/usr/share/games/$_rpkgname/$rpkgname.png" "$pkgdir/usr/share/pixmaps/$rpkgname.png"
    mv "$srcdir/sm64ex/build/us_pc/"* "$pkgdir/usr/share/games/$_rpkgname/"
    for file in "$pkgdir/usr/share/games/$_rpkgname/sm64.us"*; do
    if [ -f "$file" ]; then
        mv "$file" "sm64ex"
    fi
done
    
    # Link to binary 
    ln -s "$pkgdir/usr/share/games/$_rpkgname/$rpkgname" "$pkgdir/usr/bin/$rpkgname"    

    # Desktop Entry
    install -Dm644 "$rpkgname.desktop" \
        "$pkgdir/usr/share/applications/$rpkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$rpkgname.desktop"
}
