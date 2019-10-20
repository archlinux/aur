
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=10.17
pkgrel=1
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://freefilesync.org"
license=('GPLv3')
depends=(wxgtk webkit2gtk boost-libs)
makedepends=(boost unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"		#ffs
	ignore_curl_version_assertion.patch
	revert_xdg_config_path.patch
	revert_bulk_append.patch
	revert_linkflags.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	dlagent
	)

sha256sums=('c833c13cd58ce66b846a3e3fe7dcee11c5cf9f365498a1454b05dc7668478dd3'
            '4c62e13fdeafb3263c286718e27a48e8ff127fdcfac39becb45b976e66b6b99f'
            'e74b4abdf04c58004e52f77afee762e4c3d72d4ca42de4cc42cbc930cbec0e32'
            '2ea1f157ab31feb18b0d8ac117a1820174a4b2b9bdaee2027c1fbc2c287e1caa'
            'd3dedc100163ce00ae5889a6039a1fff11ae32b676ae5e83ae9182509f80638d'
            '590d87707240529ca893199f852143f5d7c7266cb050e37e615900b013ac3d51'
            '82439b4b81b0a72652befad9b9db52ffbc0180f307c92205aa5ab344f9f82830'
            '1649e7ea66235c6f82daf9beb6b61b7765df54e9ef70f7f6fc1283f5c2b1e54a')

DLAGENTS=("https::./dlagent $url %u %o")

prepare() {
# wxgtk < 3.1.0
    # Revert to classic config path
    patch --binary -p1 -i revert_xdg_config_path.patch

    # Avoid uses of wxItemContainer::Append(const std::vector<wxString>& items)
    patch --binary -p1 -i revert_bulk_append.patch

# edit lines to remove functions that require wxgtk 3.1.x  
    sed -e 's:m_textCtrlOfflineActivationKey->ForceUpper:// &:g' -i 'FreeFileSync/Source/ui/small_dlgs.cpp'
    sed -e 's:const double scrollSpeed =:& 6; //:g' -i 'wx+/grid.cpp'

# remove assertion for libcurl version >1.67 (1.66 should be safe but slower)
    patch --binary -p1 -i ignore_curl_version_assertion.patch

# add LINKFLAGS that were removed but that we still need in our case
    patch -p1 -i revert_linkflags.patch

# don't try to compile inexistant file
    sed -e '\:CPP_FILES+=afs/libssh2/init_libssh2.cpp:d' -i FreeFileSync/Source/Makefile

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
    make EXENAME=FreeFileSync TMP_PATH="${srcdir}/FreeFileSync/tmp_ffs"

### RTS
    cd "${srcdir}/FreeFileSync/Source/RealTimeSync"
    make EXENAME=RealTimeSync TMP_PATH="${srcdir}/FreeFileSync/tmp_rts"
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
