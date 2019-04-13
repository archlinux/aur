
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=10.11
pkgrel=1
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="https://www.freefilesync.org"
license=('GPLv3')
depends=(wxgtk webkit2gtk boost-libs)
makedepends=(boost unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::${url}/download/FreeFileSync_${pkgver}_Source.zip"		#ffs
	revert_resources_path.patch
	revert_xdg_config_path.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	)

sha256sums=('ed322ef285d85b1cfaa7d4e6fd4dbcb00c4aaf57003a3cbd35126eaef95a1d37' #ffs source
            '052ef5bf5eb11730499f4b81cd7e70f990fff3cfcc2f7059b84981e7ededc361' #revert_resources_path.patch
            'fef8aa099a27c277b76f1229651ed2324355528482c8f115e09c39269bbf4bdd' #revert_xdg_config_path.patch
            'd492d71c722340a1e6ee8dbbbf1ea24e052b473c38ef2d64d7338131bf417adc' #FreeFileSync.desktop
            '1321f3af06f0bc9c37dac369ca5960cba00961af7e2ceb76f18d16ca607ffa73' #RealTimeSync.desktop
)
	 
DLAGENTS=("https::/usr/bin/curl -fLC - --retry 5 --retry-delay 3 -A Mozilla -o %o %u")

_auth_request="$(\
    echo "Authenticating for download ..." >&2; \
    /usr/bin/curl -fsSL -A Mozilla "$url/cookie/load-consent.php" \
)"

prepare() {
# wxgtk < 3.1.0
    # Revert to classic config path
    patch --binary -p1 -i revert_xdg_config_path.patch

# Revert change to resources path of portable version
    patch --binary -p1 -i revert_resources_path.patch

# edit lines to remove functions that require wxgtk 3.1.x  
    sed -e 's:m_textCtrlOfflineActivationKey->ForceUpper:// &:g' -i 'FreeFileSync/Source/ui/small_dlgs.cpp'
    sed -e 's:const double scrollSpeed =:& 6; //:g' -i 'wx+/grid.cpp'

# libssh2 v1.8.0 does not yet implement LIBSSH2_SFTP_DEFAULT_MODE, revert to previous impl.
    sed -e 's/LIBSSH2_SFTP_DEFAULT_MODE/LIBSSH2_SFTP_S_IRWXU | LIBSSH2_SFTP_S_IRWXG | LIBSSH2_SFTP_S_IRWXO/g' -i 'FreeFileSync/Source/fs/sftp.cpp'

# add '-lz' back into LINKFLAGS
    sed -i '/pie/ s/-pthread/-lz -pthread/' FreeFileSync/Source/Makefile
    sed -i '/pie/ s/-pthread/-lz -pthread/' FreeFileSync/Source/RealTimeSync/Makefile

# inlining of constants not present in libssh2's distributed headers
    sed -i 's/MAX_SFTP_READ_SIZE/30000/g' FreeFileSync/Source/fs/sftp.cpp
    sed -i 's/MAX_SFTP_OUTGOING_SIZE/30000/g' FreeFileSync/Source/fs/sftp.cpp
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
    appsharedir="${pkgdir}/usr/share/FreeFileSync"
    appdocdir="${pkgdir}/usr/share/doc/FreeFileSync"

    cd "${srcdir}/FreeFileSync/Build"
    install -t "${bindir}" -Dm755 Bin/FreeFileSync Bin/RealTimeSync
    install -t "${appsharedir}" -Dm644 \
        ding.wav \
        gong.wav \
        harp.wav \
        Resources.zip \
        styles.gtk_rc
    install -t "${appsharedir}/Languages" -Dm644 Languages/*.lng

    cd "${srcdir}"
    install -d "${appdocdir}"
    gzip < Changelog.txt > "${appdocdir}/CHANGELOG.gz"
    unzip -o FreeFileSync/Build/Resources.zip FreeFileSync.png RealTimeSync.png
    install -Dm644 -t "${pkgdir}/usr/share/pixmaps" FreeFileSync.png RealTimeSync.png
    install -Dm644 -t "${pkgdir}/usr/share/applications" FreeFileSync.desktop RealTimeSync.desktop
}
