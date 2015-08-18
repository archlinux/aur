# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=5.7.1
pkgrel=2
pkgdesc="NATIVE 64-BIT GTK2 archiver utility, portable version with few dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=(gtk2)
optdepends=('gksu: Run with GTK' 'kdesu: Run with KDE')
provides=('peazip')
conflicts=('peazip-gtk2' 'peazip-qt')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz"
        'peazip.png')
sha256sums=('4f13ae7fa1df279cf2416f2ac97a21a0c7c49cfd6d98175f32d89083c1ab71a9'
            'b8c7f3d52309cc9d39db57d2d785a03b3611f48fc0446cc10592112fdf599aff')

package() {
    # Move stuff into place
    install -Dm755 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/peazip"\
                   "$pkgdir/opt/$pkgname/peazip"
    install -Dm644 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/copying.txt"\
                   "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
    install -Dm644 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/peazip_help.pdf"\
                   "$pkgdir/usr/share/doc/$pkgname/peazip_help.pdf"
    install -Dm644 "$srcdir/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    mv "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/res" "$pkgdir/opt/$pkgname"

    # Install Desktop file
    cp "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration/peazip-alt(multilingual).desktop"\
       "$srcdir/peazip.desktop"
    if [ -f "/usr/bin/kdesu" ]; then
      desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" --set-key="Exec"\
                                  --set-value="kdesu peazip %F" "peazip.desktop"
    else
    desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" --set-key="Exec"\
                                --set-value="gksu peazip %F" "peazip.desktop"
    fi

    # Integrate into Nautilus
    cd "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration"
    if [ -f "/usr/bin/nautilus" ]; then
      install -Dm755 "./nautilus-scripts/Archiving/PeaZip/Add to Archive"\
                     "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip/Add to Archive"
      install -Dm755 "./nautilus-scripts/Archiving/PeaZip/Extract Archive"\
                     "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip/Extract Archive"
      install -Dm755 "./nautilus-scripts/Archiving/PeaZip/Extract Here"\
                     "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip/Extract Here"
      install -Dm755 "./nautilus-scripts/Archiving/PeaZip/Extract to Folder"\
                     "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip/Extract to Folder"
      install -Dm755 "./nautilus-scripts/Archiving/PeaZip/Open Archive"\
                     "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip/Open Archive"
      chown -R --reference="$pkgdir$HOME/.local/share/nautilus/scripts"\
                           "$pkgdir$HOME/.local/share/nautilus/scripts/PeaZip"
    fi

    # Integrate into Dolphin
    if [ -f "/usr/bin/dolphin" ]; then
      install -Dm755 "./kde4-dolphin/usr/share/kde4/services/ServiceMenus/peazipadd"\
                     "$pkgdir$HOME/.kde4/services/ServiceMenus/peazipadd"
      install -Dm755 "./kde4-dolphin/usr/share/kde4/services/ServiceMenus/peazipext"\
                     "$pkgdir$HOME/.kde4/services/ServiceMenus/peazipext"
      install -Dm755 "./kde4-dolphin/usr/share/kde4/services/ServiceMenus/peazipextfolder"\
                     "$pkgdir$HOME/.kde4/services/ServiceMenus/peazipextfolder"
      install -Dm755 "./kde4-dolphin/usr/share/kde4/services/ServiceMenus/peazipexthere"\
                     "$pkgdir$HOME/.kde4/services/ServiceMenus/peazipexthere"
      install -Dm755 "./kde4-dolphin/usr/share/kde4/services/ServiceMenus/peazipopen"\
                     "$pkgdir$HOME/.kde4/services/ServiceMenus/peazipopen"
      chown -R --reference="$pkgdir$HOME/.kde4/services" "$pkgdir$HOME/.kde4/services/ServiceMenus"
    fi
}
