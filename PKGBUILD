# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=14.5
pkgrel=1
pkgdesc="Folder comparison and synchronization software"
arch=(x86_64)
url="https://freefilesync.org"
license=(custom)
depends=(wxwidgets-gtk3)
source=(
    "FreeFileSync_${pkgver}_Source.zip.1::${url}/download/FreeFileSync_${pkgver}_Source.zip"
    "FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"
    FreeFileSync.desktop
    RealTimeSync.desktop
    "gui.patch"
)
noextract=("FreeFileSync_${pkgver}_Source.zip.1")
sha256sums=('SKIP'
            'faa7e3d737f7579c71b6f5e009ad100c346110f4374338a2e5e2a23324ae5146'
            '590d87707240529ca893199f852143f5d7c7266cb050e37e615900b013ac3d51'
            '82439b4b81b0a72652befad9b9db52ffbc0180f307c92205aa5ab344f9f82830'
            'e35d1edc33bafdd104ea442eedb46778b7afe43db8b7b122c6f7e29b9de43927')

prepare() {
    patch -p1 < gui.patch
    msg2 "patching other files"
    sed -i 's|-2|-3|' FreeFileSync/Source/{Makefile,RealTimeSync/Makefile}
    sed -i '/^#error/s|^|//|' FreeFileSync/Source/{application.cpp,RealTimeSync/application.cpp}
    sed -i '/animalImg/s|^|//|' FreeFileSync/Source/ui/small_dlgs.cpp
    sed -i 's|const wxReadOnly|wx|' wx+/grid.{cpp,h} \
      FreeFileSync/Source/ui/{cfg_grid.cpp,file_grid.cpp,log_panel.cpp,rename_dlg.cpp,tree_grid.cpp}
    sed -i 's|const override|const|' FreeFileSync/Source/ui/small_dlgs.cpp
}

build() {
    CXXFLAGS="$CXXFLAGS -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000 -DwxInfoDC=wxClientDC"
    LDFLAGS="$LDFLAGS `pkg-config --libs gtk+-3.0`"
    MAKEFLAGS="-s -j`nproc` $MAKEFLAGS"

    # tmpPath should fix @incan's build problem
    make -C"$srcdir/FreeFileSync/Source" tmpPath="$srcdir/FreeFileSync/tmp_ffs" exeName=FreeFileSync
    make -C"$srcdir/FreeFileSync/Source/RealTimeSync" tmpPath="$srcdir/FreeFileSync/tmp_rts" exeName=RealTimeSync
}

package() {
    bindir="$pkgdir/usr/bin"
    appdir="$pkgdir/opt/FreeFileSync"
    appdocdir="$pkgdir/usr/share/doc/FreeFileSync"

    cd "$srcdir/FreeFileSync/Build"
    bsdunzip -q Resources/Icons.zip {FreeFileSync,RealTimeSync}.png -d "$pkgdir/usr/share/pixmaps" 
    install -Dm755 -t "$appdir/Bin" Bin/*
    install -Dm644 -t "$appdir/Resources" Resources/*
    install -dm755 "$bindir"
    ln -s /opt/FreeFileSync/Bin/{FreeFileSync,RealTimeSync} "$bindir"
    cd "$srcdir"
    install -d "$appdocdir"
    gzip < Changelog.txt > "$appdocdir/CHANGELOG.gz"
    install -Dm644 -t "$appdocdir" Bugs.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" License.txt
    install -Dm644 -t "$pkgdir/usr/share/applications" FreeFileSync.desktop RealTimeSync.desktop
}
# vim:set sts=0 sw=4 ts=4:
