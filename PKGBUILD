# Maintainer: robertfoster
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517

pkgname=soulseekqt
pkgver=20180130
_pkgver=2018-1-30
pkgrel=8
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('freetype2')
makedepends=('gcc')
source=("https://www.slsknet.org/SoulseekQt/Linux/SoulseekQt-${_pkgver}-64bit-appimage.tgz"
    selinux-mock.c
    soulseekqt.sh
    $pkgname.desktop
)
options=("!strip")

prepare() {
    cd $srcdir
    msg2 "Extraction..."
    ./SoulseekQt-${_pkgver}-64bit.AppImage  --appimage-extract
    
    msg2 "Compiling libselinux.so.1 fakelib"
    gcc -s -shared -o libselinux.so.1 -Wl,-soname,libselinux.so.1 selinux-mock.c
}

package() {
    cd $srcdir
    mkdir -p $pkgdir/opt/
    cp -r squashfs-root $pkgdir/opt/$pkgname
    install -vDm755 soulseekqt.sh "$pkgdir/usr/bin/$pkgname"
    install -vDm755 libselinux.so.1 "$pkgdir/opt/soulseekqt/lib/libselinux.so.1"
    install -vDm644 squashfs-root/soulseek.png "$pkgdir/usr/share/pixmaps/soulseek.png"
    install -vDm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    msg2 "Cleanup"
    chmod 755 -R $pkgdir/opt/$pkgname
    rm $pkgdir/opt/$pkgname/lib/libfreetype.so.6
    rm -rf $pkgdir/opt/soulseekqt/{AppRun,default.desktop,soulseek.png,*.AppImage}
}

md5sums=('1d98331893bc9b9d45ba34f6523353ab'
         '4ed42be654289fc9cd7f4181c363f745'
         'cdc28ff969333f5ef009dfa73c214efc'
         '2544611108889c2c4c7a9084672f4d32')
