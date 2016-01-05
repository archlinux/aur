# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=5.9.1
pkgrel=1
pkgdesc="NATIVE 64-BIT GTK2 archiver utility, portable version with few dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=(gtk2)
provides=('peazip')
conflicts=('peazip' 'peazip-gtk2' 'peazip-qt')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz"
        'peazip.png')
sha256sums=('0799c467a926c0cb6905de15423059f3ee9af7e8493043fde2e979d45375b610'
            'b8c7f3d52309cc9d39db57d2d785a03b3611f48fc0446cc10592112fdf599aff')
sha512sums=('3c87983d41135e6c0f22ac9253a92599c632c38c1283eeedd284adb0f4e30d05039867ade25eed27748f4d9abe3f9603780b3954660d493bcbfc0b9dd4b72092'
            'be0472ac5598d59d7375175d06617c7b6e22e0494a1b0e1b6544dc1341474f454c0182e0c158edb4482229391134c6d25c9f91b1f09384eac362143dbfb23b7d')
package() {
    _resdir="$pkgdir$HOME/.peazip/res"
    _nautdir="$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip"
    _doldir="$pkgdir$HOME/.kde4/share/kde4/services/ServiceMenus/"
    _deskdir="$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration"
    sudo ln -sf $HOME/.peazip/peazip /usr/bin/peazip
    cd "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/res/"
    install -Dm755 "../peazip" "$pkgdir$HOME/.peazip/peazip"
    install -Dm644 "../copying.txt" "$pkgdir/usr/share/licenses/peazip/COPYING.txt"
    install -Dm644 "$srcdir/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    ## Install res directory
    for i in pea pealauncher rnd; do install -Dm755 $i "$_resdir"/$i; done
    for i in arc/{arc,*.sfx}; do install -Dm755 $i "$_resdir"/$i; done
    for i in *.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z} arc/arc.{ini,groups}
      do install -Dm644 $i "$_resdir"/$i; done
    for i in 7z/{7z{,.so,Con.sfx,.sfx},Codecs/Rar.so}; do install -Dm755 $i "$_resdir"/$i; done
    for i in quad/bcm upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do install -Dm755 $i "$_resdir"/$i; done
    #
    chown -R $USER:users "$pkgdir$HOME/.peazip"
    desktop-file-install --dir "$pkgdir/usr/share/applications/" "$_deskdir/peazip.desktop"
    # Integrate into Nautilus
    if [ -f "/usr/bin/nautilus" ]; then cd "$_deskdir/nautilus-scripts/Archiving/PeaZip"
      install -Dm755 "Add to Archive" "$_nautdir/Add to Archive"
      install -Dm755 "Extract Archive" "$_nautdir/Extract Archive"
      install -Dm755 "Extract Here" "$_nautdir/Extract Here"
      install -Dm755 "Extract to Folder" "$_nautdir/Extract to Folder"
      install -Dm755 "Open Archive" "$_nautdir/Open Archive"
      chown -R $USER:users $_nautdir
    fi
    # Integrate into Dolphin
    if [ -f "/usr/bin/dolphin" ]; then cd "$_deskdir/kde4-dolphin/usr/share/kde4/services/ServiceMenus"
      install -Dm755 "peazipadd.desktop" "$_doldir/peazipadd.desktop"
      install -Dm755 "peazipext.desktop" "$_doldir/peazipext.desktop"
      install -Dm755 "peazipextfolder.desktop" "$_doldir/peazipextfolder.desktop"
      install -Dm755 "peazipexthere.desktop" "$_doldir/peazipexthere.desktop"
      install -Dm755 "peazipopen.desktop" "$_doldir/peazipopen.desktop"
      chown -R $USER:users $_doldir
    fi
}
