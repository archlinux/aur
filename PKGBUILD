# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Maintainer: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=13.4
pkgrel=1
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://freefilesync.org"
license=(GPL3)
depends=(wxwidgets-gtk3)
source=(
    "FreeFileSync_${pkgver}_Source.zip.1::${url}/download/FreeFileSync_${pkgver}_Source.zip"
    "FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"
	FreeFileSync.desktop
	RealTimeSync.desktop
)
noextract=("FreeFileSync_${pkgver}_Source.zip.1")
sha256sums=('SKIP'
            'd1ce076256a1f5a1ec30cc82cff4e3800e7da5371ee21a20cf99fa5dff4cca1a'
            '590d87707240529ca893199f852143f5d7c7266cb050e37e615900b013ac3d51'
            '82439b4b81b0a72652befad9b9db52ffbc0180f307c92205aa5ab344f9f82830')

prepare() {
    bsdunzip FreeFileSync/Build/Resources/Icons.zip {FreeFileSync,RealTimeSync}.png
    sed -i 's|-2|-3|' FreeFileSync/Source/{Makefile,RealTimeSync/Makefile}
    sed -i 's|#error|//#error|' FreeFileSync/Source/{application.cpp,RealTimeSync/application.cpp} zen/{string_tools.h,globals.h}
    sed -i 's|::g_object_ref|g_object_ref|' FreeFileSync/Source/base/icon_loader.cpp
}

build() {
    MAKEFLAGS="-s -j`nproc`"
    CXXFLAGS="$CXXFLAGS -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000"
    LDFLAGS="$LDFLAGS `pkg-config --libs gtk+-3.0`"

    make -C"$srcdir/FreeFileSync/Source" exeName=FreeFileSync
    make -C"$srcdir/FreeFileSync/Source/RealTimeSync" exeName=RealTimeSync
}

package() {
    bindir="$pkgdir/usr/bin"
    appdir="$pkgdir/opt/FreeFileSync"
    appdocdir="$pkgdir/usr/share/doc/FreeFileSync"

    cd "$srcdir/FreeFileSync/Build"
    install -Dm755 -t "$appdir/Bin" Bin/*
    install -Dm644 -t "$appdir/Resources" Resources/*
    mkdir -p "$bindir"
    ln -s /opt/FreeFileSync/Bin/{FreeFileSync,RealTimeSync} "$bindir"
    cd "$srcdir"
    install -d "$appdocdir"
    gzip < Changelog.txt > "$appdocdir/CHANGELOG.gz"
    install -Dm644 -t "$pkgdir/usr/share/pixmaps" FreeFileSync.png RealTimeSync.png
    install -Dm644 -t "$pkgdir/usr/share/applications" FreeFileSync.desktop RealTimeSync.desktop
}
