# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=6.0.0
pkgrel=1
pkgdesc="NATIVE 64-BIT GTK2 archiver utility, portable version with few dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=(gtk2)
provides=('peazip')
conflicts=('peazip' 'peazip-gtk2' 'peazip-qt')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz")
sha256sums=('3ce1600f30b9d89ba116bd005e465dfea3f57eb94a8a0154630fe7e639f2b033')
sha512sums=('01ec1b784e5201ceb151fb4af59d95d1cdd05b2086559eae347f36ecf02cf2f1736435fa9ec4752aeaef48362922a616e4b83e6763f53573a9d8c6707f474d5f')

package() {
    _resdir="$pkgdir$HOME/.peazip/res"
    _nautdir="$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip"
    _doldir="$pkgdir$HOME/.kde4/share/kde4/services/ServiceMenus/"
    _deskdir="$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration"
    # Place proper home directory location in .install file
    sed -i "s|\$HOME|$HOME|g" $startdir/peazip.install
    cd "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/res/"
    install -Dm755 "../peazip" "$pkgdir$HOME/.peazip/peazip"
    chmod 700 "$pkgdir$HOME"
    install -Dm644 "../copying.txt" "$pkgdir/usr/share/licenses/peazip/COPYING.txt"
    install -Dm644 "../FreeDesktop_integration/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    ## Install res directory
    for i in pea pealauncher rnd; do install -Dm755 $i "$_resdir"/$i; done
    for i in arc/{arc,*.sfx}; do install -Dm755 $i "$_resdir"/$i; done
    for i in *.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z} arc/arc.{ini,groups}
      do install -Dm644 $i "$_resdir"/$i; done
    for i in 7z/{7z{,.so,Con.sfx,.sfx},Codecs/Rar.so}; do install -Dm755 $i "$_resdir"/$i; done
    for i in quad/bcm upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do install -Dm755 $i "$_resdir"/$i; done
    ##
    chown -R $USER:users "$pkgdir$HOME/.peazip"
    desktop-file-install --dir "$pkgdir/usr/share/applications/" "$_deskdir/peazip.desktop"
    ## Integrate into Nautilus
    if [ -f "/usr/bin/nautilus" ]; then cd "$_deskdir/nautilus-scripts/Archiving/PeaZip"
      install -Dm755 "Add to Archive" "$_nautdir/Add to Archive"
      install -Dm755 "Extract Archive" "$_nautdir/Extract Archive"
      install -Dm755 "Extract Here" "$_nautdir/Extract Here"
      install -Dm755 "Extract to Folder" "$_nautdir/Extract to Folder"
      install -Dm755 "Open Archive" "$_nautdir/Open Archive"
      chown -R $USER:users $_nautdir
      chmod 700 "$pkgdir$HOME/.local/share/nautilus"
    fi
    ##
    ## Integrate into Dolphin
    if [ -f "/usr/bin/dolphin" ]; then cd "$_deskdir/kde4-dolphin/usr/share/kde4/services/ServiceMenus"
      install -Dm755 "peazipadd.desktop" "$_doldir/peazipadd.desktop"
      install -Dm755 "peazipext.desktop" "$_doldir/peazipext.desktop"
      install -Dm755 "peazipextfolder.desktop" "$_doldir/peazipextfolder.desktop"
      install -Dm755 "peazipexthere.desktop" "$_doldir/peazipexthere.desktop"
      install -Dm755 "peazipopen.desktop" "$_doldir/peazipopen.desktop"
      chown -R $USER:users $_doldir
    fi
    ##
#    ## Integrate into Dolphin alternate method
#    if [ -f "/usr/bin/dolphin" ]; then cd "$_deskdir/kde4-dolphin/usr/share/kde4/services/ServiceMenus"
#      install -Dm644 -t "$pkgdir/usr/share/kservices5/ServiceMenus/"    "./*.desktop"
#      install -Dm644 -t "$pkgdir/usr/share/kde4/services/ServiceMenus/" "./*.desktop"
#    fi
#    ##
}
