# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=14.2
pkgrel=3
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
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
            'c7022fa1e5aefe18131f0020b37f6795f6f75012bf4c8df2a06fbd4519b0fb6a'
            '225dd46b25b5d720c4e845f75422f36b7cf1a162f238ba311cfa5550729e3635'
            'e4cf88bfa73949ef56cafbc1486d5b894ce803a4bdfd6238e9051e12c86a7f6d'
            'f150d549facc261397985cbdc18272055fa7e3b7e81a1ac582e3182af69674de')

prepare() {
    bsdunzip FreeFileSync/Build/Resources/Icons.zip {FreeFileSync,RealTimeSync}.png
    sed -i 's|-2|-3|' FreeFileSync/Source/{Makefile,RealTimeSync/Makefile}
    sed -i 's|#error|//#error|' FreeFileSync/Source/{application.cpp,RealTimeSync/application.cpp}
    sed -i 's|::g_object_ref|g_object_ref|' FreeFileSync/Source/base/icon_loader.cpp
    sed -i '/animalImg/s/^/\/\//' FreeFileSync/Source/ui/small_dlgs.cpp
    patch -p1 < gui.patch
    dlg='FreeFileSync/Source/ui/main_dlg.cpp'
    sed -i '1261cwxAuiPaneInfoArray& paneArray = auiMgr_.GetAllPanes();' $dlg
    sed -i '1262cfor (size_t i = 0; i < paneArray.size(); ++i) paneCaptions.emplace_back(&paneArray[i], paneArray[i].caption);' $dlg
    sed -i '3128cconst wxAuiPaneInfoArray& paneArray = auiMgr_.GetAllPanes();' $dlg
    sed -i '3129cfor (size_t i = 0; i < paneArray.size(); ++i){ wxAuiPaneInfo& paneInfo = paneArray[i];' $dlg
    sed -i '3147c}' $dlg 
    sed -i 's|wxApp::||' wx+/darkmode.h
    sed -i '13i enum class Appearance{System,Light,Dark};' wx+/darkmode.h
    sed -i 's|const wxReadOnly|wx|' wx+/grid.cpp wx+/grid.h \
    FreeFileSync/Source/ui/{cfg_grid.cpp,file_grid.cpp,log_panel.cpp} \
    FreeFileSync/Source/ui/{rename_dlg.cpp,tree_grid.cpp}
    sed -i 's|wxInfoDC|wxClientDC|' FreeFileSync/Source/ui/{log_panel.cpp,rename_dlg.cpp} wx+/grid.cpp
    sed -i 's|const override|const|' FreeFileSync/Source/ui/small_dlgs.cpp
}

build() {
    MAKEFLAGS="-j`nproc`"
    CXXFLAGS="$CXXFLAGS -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000"
    LDFLAGS="$LDFLAGS `pkg-config --libs gtk+-3.0`"

    make -s -C"$srcdir/FreeFileSync/Source" exeName=FreeFileSync
    make -s -C"$srcdir/FreeFileSync/Source/RealTimeSync" exeName=RealTimeSync
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
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
