
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Contributor: Simon Brulhart <simon@brulhart.me>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=11.4
pkgrel=1
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://freefilesync.org"
license=('GPL3')
depends=(wxgtk curl lsb-release)
makedepends=(unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"		#ffs
	reversions_11-1.patch
	theme_fixes.patch
	revert_xdg_config_path.patch
	revert_bulk_append.patch
	revert_linkflags.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	dlagent
	)

sha256sums=('d0c20c1388024460944bb0871e91ce6dc9ac5c02be45a095f288db169eb844b4'
			'6c2d7f24e4edc52bc1af95d3f48ef67456cde0b952b81a702901acfb36545999'
			'4f2b1d46c0b754c668be7ec675a2bb09f72b3bd0e20987b4db61575b5ca1bf46'
            '0f9a9a6b2c3c460bbde7425bd62273c925259db1cc9dc18c6013aae99fb15cd8'
            '17e7db683662809882db6d6b3d855eb4372ca1bd05e15c4c490970a0b4b127c0'
            'c83475ef3ac8bd534d637062d516c9eeea54ac18c775be55e1adef413ac73063'
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

	patch -p1 -i reversions_11-1.patch
    grep -RiIl 'wxASCII_STR' | xargs sed -e 's/wxASCII_STR/wxString::FromAscii/g' -i
	grep -RiIl 'wxDD_SHOW_HIDDEN' | xargs sed -e 's/, wxDD_DEFAULT_STYLE | wxDD_SHOW_HIDDEN//g' -i

# undo zenju hacks
	sed -e '71,77d' -i 'wx+/dc.h'
	sed -e '73d' -i 'wx+/no_flicker.h'

# GUI theme fixes (for improved color compatibility)
	patch -p1 -i theme_fixes.patch

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
