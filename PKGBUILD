# Maintainer Seva Alekseyev <sevaa@yarxi.ru>
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgbase=pkgbase
pkgname=yarxi
pkgver=1.10
pkgrel=1
pkgdesc="Japanese-Russian kanji and word dictionary"
url="http://www.susi.ru/yarxi/"
license=('custom')
_source=(
    "http://www.susi.ru/yarxi/yarxi_${pkgver}-${pkgrel}_amd64.deb"
    "http://ftp.uk.debian.org/debian/pool/main/q/qt4-x11/libqtcore4_4.8.7+dfsg-11_amd64.deb"
    "http://ftp.uk.debian.org/debian/pool/main/q/qt4-x11/libqtgui4_4.8.7+dfsg-11_amd64.deb"
    "http://ftp.uk.debian.org/debian/pool/main/q/qt4-x11/libqt4-network_4.8.7+dfsg-11_amd64.deb"
)
arch=('x86_64')
_md5sums=(
    '812d2265816ed781751c5c0eb6664d91'
    'b243ada8569b2b3d4586dc4178fd8d56'
    '797e351a57c9d56368f710e7cba40f21'
    'b3cff12767e21d3a76794046557d3df0'
)
depends=(
   ttf-sazanami nas
)

prepare() {
    cd $srcdir/
    echo "Due to 'makepkg' and 'PKGBUILD' specs limitations I need to dowanload sources and validate them by myself"
    for source_url in ${_source[@]}; do
        source_filename=${source_url##*/}
        if [ ! -f "$source_filename" ]; then
            echo "Downloading next source - $source_filename ..."
            curl -A DUMMY -O "$source_url";
        else
            echo "Found already downloaded source - $source_filename"
        fi
    done
    echo "And now we must validated dowanloaded sources ..."
    for (( i=0; i<${#_source[@]}; ++i )); do
        source_url=${_source[i]}
        source_filename=${source_url##*/}
        source_expected_md5sum=${_md5sums[i]}
        source_actual_md5sum=$(md5sum $source_filename | awk '{print $1}')
        if [ "$source_actual_md5sum" == "$source_expected_md5sum" ]; then
            echo "Validated next source - $source_filename"
        else
            echo "Found corrupted source - $source_filename"; return 1
        fi
    done    
}

build() {
    cd $srcdir/
    mkdir -p deb/{$pkgname,qt4core,qt4gui,qt4network}
    bsdtar xf yarxi_${pkgver}-${pkgrel}_amd64.deb -C deb/$pkgname/
    bsdtar xf libqtcore4_4.8.7+dfsg-11_amd64.deb -C deb/qt4core/
    bsdtar xf libqtgui4_4.8.7+dfsg-11_amd64.deb -C deb/qt4gui/
    bsdtar xf libqt4-network_4.8.7+dfsg-11_amd64.deb -C deb/qt4network/
    for dir in deb/$pkgname deb/qt4core deb/qt4gui deb/qt4network; do
        cd $dir; tar xf data.tar.*; cd $srcdir
    done
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/lib/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/doc/$pkgname/
    mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16/apps,32x32/apps,48x48/apps}/
    mkdir -p $pkgdir/usr/share/pixmaps/
    mkdir -p $pkgdir/usr/share/$pkgname/
    install -m 0755 $srcdir/deb/$pkgname/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname
    install -m 0755 $srcdir/deb/qt4core/usr/lib/x86_64-linux-gnu/libQtCore.so.4.8.7 $pkgdir/usr/lib/libQtCore.so.4
    install -m 0755 $srcdir/deb/qt4gui/usr/lib/x86_64-linux-gnu/libQtGui.so.4.8.7 $pkgdir/usr/lib/libQtGui.so.4
    install -m 0755 $srcdir/deb/qt4network/usr/lib/x86_64-linux-gnu/libQtNetwork.so.4.8.7 $pkgdir/usr/lib/libQtNetwork.so.4
    install -m 0644 $srcdir/deb/$pkgname/usr/share/applications/seva-yarxi.desktop $pkgdir/usr/share/applications/
    install -m 0644 $srcdir/deb/$pkgname/usr/share/doc/$pkgname/copyright $pkgdir/usr/share/doc/$pkgname/
    for icons in 16x16 32x32 48x48; do
        install -m 0644 $srcdir/deb/$pkgname/usr/share/icons/hicolor/$icons/apps/seva-yarxi.png $pkgdir/usr/share/icons/hicolor/$icons/apps/
    done
    install -m 0644 $srcdir/deb/$pkgname/usr/share/pixmaps/*.xpm $pkgdir/usr/share/pixmaps/
    install -m 0644 $srcdir/deb/$pkgname/usr/share/$pkgname/yarxice.db $pkgdir/usr/share/$pkgname/
}

#vim: syntax=sh
