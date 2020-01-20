
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=10.19
pkgrel=2
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://freefilesync.org"
license=('GPLv3')
depends=(wxgtk webkit2gtk boost-libs)
makedepends=(boost unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"		#ffs
	revert_xdg_config_path.patch
	revert_bulk_append.patch
	revert_linkflags.patch
	update_error_constants_check.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	dlagent
	)

sha256sums=('843b56667188c43bbc0622e51b63f9d904ced09dd7921d3afb9c431c4e1f73d5'
            'bd2b786be724818cf232129ecd432f305a5fdecc298a3e503a1e9182cad6a707'
            '2ea1f157ab31feb18b0d8ac117a1820174a4b2b9bdaee2027c1fbc2c287e1caa'
            'd3dedc100163ce00ae5889a6039a1fff11ae32b676ae5e83ae9182509f80638d'
            '3c5d7c7ffad0a261c08a8728ff341f31d567aa50fc5e5c84dece38dfcf9150c7'
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

# add LINKFLAGS that were removed but that we still need in our case
    patch -p1 -i revert_linkflags.patch

# inlining of constants not present in libssh2's distributed headers
    sed -i 's/MAX_SFTP_READ_SIZE/30000/g' FreeFileSync/Source/afs/sftp.cpp
    sed -i 's/MAX_SFTP_OUTGOING_SIZE/30000/g' FreeFileSync/Source/afs/sftp.cpp

# Update constants check for newer errors
    patch --binary -p1 -i update_error_constants_check.patch
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
