# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Contributor: jooch <jooch AT gmx DOT com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=freefilesync
pkgver=14.11
pkgrel=1
pkgdesc="Folder comparison and synchronization software"
arch=(x86_64)
url="https://freefilesync.org"
license=(custom)
depends=(curl glibc hicolor-icon-theme wxwidgets-gtk3)

# must ping the download page first because sometimes downloading Source.zip will return an html page instead
# cf-cache-status: BYPASS
# must ping download page first to bypass the rare cloudflare cache/challenge
_="$(curl -s --out-null $url/download.php)"
source=(
    "$url/download/FreeFileSync_${pkgver}_Source.zip"
    FreeFileSync.desktop RealTimeSync.desktop gui.patch
)
sha256sums=('7e7ea528ce90148b1343561ca6e35709af682bdea1531f210c98554a346619c3'
            'f7fc56e3107a5ae4a7fc63246451f7d481f70c85e3190139c036c6bc6eb97500'
            '049b415078c5037c82ed8316aa0d22d4629dbdff2d2b1b4df3f3554218915f33'
            '4e6e7a88d15153906bebd1c788b461736abb009aca9a69c3cbc06d9fdb91af11')

prepare() {
    msg2 'patching wxwidgets 3.3isms'
    patch -p1 < gui.patch
    sed -i '/DisableAutomaticBoundingBoxUpdates/s|^|//|' wx+/dc.h
    sed -i '/soundLog/s|^|//|' FreeFileSync/Source/ui/{batch_status_handler,gui_status_handler,main_dlg}.cpp
    sed -i '/zipLog/s|^|//|' FreeFileSync/Source/localization.cpp wx+/image_resources.cpp 

    msg2 'patching other files'
    # undefine to use -Wfatal-errors 
    echo '#undef wxUSE_EXCEPTIONS' >> zen/i18n.h
    # fix glib macro quirk
    sed -i 's|::g_free|g_free|' FreeFileSync/Source/{base/icon_loader.cpp,afs/ftp.cpp} zen/zstring.cpp
    # disable loading missing animal.dat file and override error
    # -e'/DrawHighlighted/s|override|/d|'
    sed -i -e's|const override|const|' -e'/animalImg/s|^|//|' FreeFileSync/Source/ui/small_dlgs.cpp
    # disable automatic update check on startup
    sed -i '/Bind\(.*onStartupUpdateCheck\)/s|^|//|' FreeFileSync/Source/ui/main_dlg.cpp 
}

build() {
    CXXFLAGS+=" -DMAX_SFTP_READ_SIZE=30000 -DMAX_SFTP_OUTGOING_SIZE=30000 \
        -DwxInfoDC=wxClientDC -DwxReadOnlyDC=wxDC -DwxSYS_COLOUR_GRIDLINES=wxSYS_COLOUR_BTNFACE"
#    CXXFLAGS+=" -DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_54 -DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_54"
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
