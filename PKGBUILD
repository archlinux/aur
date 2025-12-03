# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=14.6
pkgrel=1
pkgdesc="Folder comparison and synchronization software"
arch=(x86_64)
url="https://freefilesync.org"
license=(custom)
depends=(wxwidgets-gtk3)
source=(
    "FreeFileSync_${pkgver}_Source.zip.1::${url}/download/FreeFileSync_${pkgver}_Source.zip"
    "FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"
    FreeFileSync.desktop RealTimeSync.desktop gui.patch
)
noextract=("FreeFileSync_${pkgver}_Source.zip.1")
sha256sums=('SKIP'
            '3924f640884f84a97d421e271c89e8e5700998b3cd922d1b539035657714553c'
            '590d87707240529ca893199f852143f5d7c7266cb050e37e615900b013ac3d51'
            '82439b4b81b0a72652befad9b9db52ffbc0180f307c92205aa5ab344f9f82830'
            'f63ae8deba10a8f7ed8f907e355d0cfecf458263fea8ebc2612cb29b41124187')

prepare() {
    patch -p1 < gui.patch
    touch zen/warn_static.h
    msg2 "patching other files"
    sed -i 's|wxUSE_EXCEPTIONS|0|' FreeFileSync/Source/{application.cpp,RealTimeSync/application.cpp}
    sed -i '/animalImg/s|^|//|' FreeFileSync/Source/ui/small_dlgs.cpp
    sed -i 's|const override|const|' FreeFileSync/Source/ui/small_dlgs.cpp
}

build() {
    CXXFLAGS="$CXXFLAGS -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000 -DwxInfoDC=wxClientDC -DwxReadOnlyDC=wxDC"
    LDFLAGS="$LDFLAGS `pkg-config --libs gtk+-3.0`"
    MAKEFLAGS="-s -j`nproc` $MAKEFLAGS"

    make -C"$srcdir/FreeFileSync/Source" tmpPath="$srcdir/FreeFileSync/tmp_ffs" exeName=FreeFileSync
    make -C"$srcdir/FreeFileSync/Source/RealTimeSync" tmpPath="$srcdir/FreeFileSync/tmp_rts" exeName=RealTimeSync
}

package() {
    bindir="$pkgdir/usr/bin"
    appdir="$pkgdir/opt/FreeFileSync"
    docdir="$pkgdir/usr/share/doc/FreeFileSync"

    cd "$srcdir/FreeFileSync/Build"
    bsdunzip -q Resources/Icons.zip {FreeFileSync,RealTimeSync}.png -d "$pkgdir/usr/share/pixmaps" 
    install -Dm755 -t "$appdir/Bin" Bin/*
    install -Dm644 -t "$appdir/Resources" Resources/*
    install -dm755 "$bindir"
    ln -s /opt/FreeFileSync/Bin/{FreeFileSync,RealTimeSync} "$bindir"
    cd "$srcdir"
    install -Dm644 -t "$docdir" Bugs.txt
    gzip < Changelog.txt > "$docdir/CHANGELOG.gz"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" License.txt
    install -Dm644 -t "$pkgdir/usr/share/applications" {FreeFileSync,RealTimeSync}.desktop
}
# vim:set sts=0 sw=4 ts=4:
