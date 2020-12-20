
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=11.0
pkgrel=2
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://freefilesync.org"
license=('GPL3')
depends=(wxgtk curl lsb-release)
makedepends=(unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"		#ffs
	curl_fix.patch
	revert_xdg_config_path.patch
	revert_bulk_append.patch
	revert_linkflags.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	dlagent
	)

sha256sums=('361bab0798811764701cfda297c2031b9decb04bb2e434ec8fe80ba8cc01e56a'
	    '72687c95350814f5517d0db7f2ca1eeac4cff1dcbe00a9a8365f5dc76172ab2f'
            '0f9a9a6b2c3c460bbde7425bd62273c925259db1cc9dc18c6013aae99fb15cd8'
            '17e7db683662809882db6d6b3d855eb4372ca1bd05e15c4c490970a0b4b127c0'
            '2942c0e74be2b15cdd83e36fa524c3b6c68d4b4da2042f1b0cf7c13d3b806eac'
            '590d87707240529ca893199f852143f5d7c7266cb050e37e615900b013ac3d51'
            '82439b4b81b0a72652befad9b9db52ffbc0180f307c92205aa5ab344f9f82830'
            '1649e7ea66235c6f82daf9beb6b61b7765df54e9ef70f7f6fc1283f5c2b1e54a')

DLAGENTS=("https::./dlagent $url %u %o")

prepare() {
# wxgtk < 3.1.0
    # Revert to classic config path
    patch -p1 -i revert_xdg_config_path.patch

    # Avoid uses of wxItemContainer::Append(const std::vector<wxString>& items)
    patch -p1 -i revert_bulk_append.patch

    # edit lines to remove functions that require wxgtk 3.1.x 
    sed -e 's:m_textCtrlOfflineActivationKey->ForceUpper:// &:g' -i 'FreeFileSync/Source/ui/small_dlgs.cpp'
    sed -e 's:const double scrollSpeed =:& 6; //:g' -i 'wx+/grid.cpp'

# fix for curl wrapper
    patch -p1 -i curl_fix.patch

# add LINKFLAGS that were removed but that we still need in our case
    patch -p1 -i revert_linkflags.patch

# inlining of constants not present in libssh2's distributed headers
    sed -i 's/MAX_SFTP_READ_SIZE/30000/g' FreeFileSync/Source/afs/sftp.cpp
    sed -i 's/MAX_SFTP_OUTGOING_SIZE/30000/g' FreeFileSync/Source/afs/sftp.cpp
}

build() {
### speed up compile on multithread machines
    MAKEFLAGS="-j$(nproc)"

### just in case of compile errors
    VER=`g++ -dumpversion`
    MAC=`g++ -dumpmachine`
    echo "compiler g++ $VER $MAC"

### FFS
    cd "${srcdir}/FreeFileSync/Source"
    make exeName=FreeFileSync tmpPath="${srcdir}/FreeFileSync/tmp_ffs"

### RTS
    cd "${srcdir}/FreeFileSync/Source/RealTimeSync"
    make exeName=RealTimeSync tmpPath="${srcdir}/FreeFileSync/tmp_rts"
}

package() {
    bindir="${pkgdir}/usr/bin"
    appdir="${pkgdir}/opt/FreeFileSync"
    appdocdir="${pkgdir}/usr/share/doc/FreeFileSync"

    cd "${srcdir}/FreeFileSync/Build"
    install -t "${appdir}/Bin" -Dm755 Bin/*
    mkdir -p "${bindir}"
    ln -s /opt/FreeFileSync/Bin/{FreeFileSync,RealTimeSync} "${bindir}"

    cp -rT Resources "${appdir}/Resources"
    find "${appdir}/Resources" -type f -print0 | xargs -0 chmod 644
    install -t "${pkgdir}/usr/share/pixmaps" -Dm644 Resources/FreeFileSync.png Resources/RealTimeSync.png

    cd "${srcdir}"
    install -d "${appdocdir}"
    gzip < Changelog.txt > "${appdocdir}/CHANGELOG.gz"
    install -Dm644 -t "${pkgdir}/usr/share/applications" FreeFileSync.desktop RealTimeSync.desktop
}
