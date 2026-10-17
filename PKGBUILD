# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=14.13
pkgrel=1
pkgdesc="Folder comparison and synchronization software"
arch=(x86_64)
url="https://freefilesync.org"
license=(custom)
depends=(curl glibc hicolor-icon-theme wxwidgets-gtk3)

# must ping the download page first because sometimes downloading *Source.zip will return the download page instead
# must ping the download page first to bypass the occasional cloudflare cache/challenge
# check header: cf-cache-status: BYPASS
_="$(curl -sL --out-null $url/download.php)"
source=(
    "$url/download/FreeFileSync_${pkgver}_Source.zip"
    FreeFileSync.desktop RealTimeSync.desktop gui.patch
)
sha256sums=('c3c29b88fefa8043c3839de8c252e6637a64263f4d7cae4a2b2f6481883a9360'
            'f7fc56e3107a5ae4a7fc63246451f7d481f70c85e3190139c036c6bc6eb97500'
            '049b415078c5037c82ed8316aa0d22d4629dbdff2d2b1b4df3f3554218915f33'
            '32f68e9cf3062a227933587a5b74bf3be6590238fcff63262c26f6d571a32b99')

prepare() {
    msg2 'patching wxwidgets 3.3isms'
    patch -p1 < gui.patch
    sed -i '/DisableAutomaticBoundingBoxUpdates/s|^|//|' wx+/dc.h
    sed -i '/soundLog/s|^|//|' FreeFileSync/Source/ui/{batch_status_handler,gui_status_handler,main_dlg}.cpp
    sed -i '/zipLog/s|^|//|' FreeFileSync/Source/localization.cpp wx+/image_resources.cpp 

    msg2 'patching other files'
    # fix malformed Makefiles
    sed -i -e '/conversion/s|$| \\|' -e 's|arch)|uname)|' FreeFileSync/Source/{Makefile,RealTimeSync/Makefile}
    # fix to use -Wfatal-errors 
    sed -i '/#error/s|^|//|' FreeFileSync/Source/{application.cpp,RealTimeSync/application.cpp}
    # fix glib macro
    sed -i 's|::g_free|g_free|' FreeFileSync/Source/{base/icon_loader.cpp,afs/ftp.cpp} zen/zstring.cpp
    # disable loading missing animal.dat file and override error
    sed -i -e's|const override|const|' -e'/animalImg/s|^|//|' FreeFileSync/Source/ui/small_dlgs.cpp
    # disable automatic update check on startup
    sed -i '/Bind\(.*onStartupUpdateCheck\)/s|^|//|' FreeFileSync/Source/ui/main_dlg.cpp 
    # fix malformed #ifdef
    sed -i 's|  def|def|' zen/argon2.cpp xBRZ/src/xbrz.cpp
}

build() {
    CXXFLAGS+=" -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000 \
        -DwxInfoDC=wxClientDC -DwxReadOnlyDC=wxDC -DwxSYS_COLOUR_GRIDLINES=wxSYS_COLOUR_BTNFACE \
        -DwxNO_IMPLICIT_WXSTRING_ENCODING \
        -DLIBSSH2_ERROR_STORE_OVERFLOW=-55" # from https://github.com/libssh2/libssh2/blob/master/include/libssh2.h#L530
    LDFLAGS+=" `pkg-config --libs gtk+-3.0`"
    MAKEFLAGS+=" -s -j`nproc`"

    # tmpPath is required otherwise make will build in /tmp which can fill up and result in RW errors
    make -CFreeFileSync/Source tmpPath="$srcdir/build_ffs" exeName=FreeFileSync
    make -CFreeFileSync/Source/RealTimeSync tmpPath="$srcdir/build_rts" exeName=RealTimeSync
}

package() {
    local appdir="$pkgdir/opt/FreeFileSync"
    local docdir="$pkgdir/usr/share/doc/FreeFileSync"

    install -Dm644 -t "$docdir" Bugs.txt
    gzip < Changelog.txt > "$docdir/Changelog.gz"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
    install -Dm644 -t "$pkgdir/usr/share/applications" {FreeFileSync,RealTimeSync}.desktop
    cd FreeFileSync/Build
    bsdunzip -q Resources/Icons.zip {FreeFileSync,RealTimeSync}.png -d "$pkgdir/usr/share/icons/hicolor/128x128/apps" 
    install -Dm755 -t "$appdir/Bin" Bin/*
    install -Dm644 -t "$appdir/Resources" Resources/*
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/FreeFileSync/Bin/{FreeFileSync,RealTimeSync} "$pkgdir/usr/bin"
}
# vim:set sts=0 sw=4 ts=4:
