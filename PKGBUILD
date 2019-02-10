
# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Contributor: alexmo82 <25396682 AT live DOT it>
# Maintainer: jooch <jooch AT gmx DOT com>

pkgname=freefilesync
pkgver=10.9
pkgrel=1
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="http://www.freefilesync.org/"
license=('GPLv3')
depends=(wxgtk webkit2gtk boost-libs)
makedepends=(boost unzip)
source=(
	"FreeFileSync_${pkgver}_Source.zip::https://www.freefilesync.org/download_redirect.php?file=FreeFileSync_${pkgver}_Source.zip"		#ffs
	revert_resources_path.patch
	revert_xdg_config_path.patch
	FreeFileSync.desktop
	RealTimeSync.desktop
	)

sha256sums=('221b905528f8800468f2f1edc33fbaa2ff0f4b6d5a4966fa20eafc18dadac3b0' #ffs source
            '052ef5bf5eb11730499f4b81cd7e70f990fff3cfcc2f7059b84981e7ededc361' #revert_resources_path.patch
            'fef8aa099a27c277b76f1229651ed2324355528482c8f115e09c39269bbf4bdd' #revert_xdg_config_path.patch
            'd492d71c722340a1e6ee8dbbbf1ea24e052b473c38ef2d64d7338131bf417adc' #FreeFileSync.desktop
            '1321f3af06f0bc9c37dac369ca5960cba00961af7e2ceb76f18d16ca607ffa73' #RealTimeSync.desktop
)
	 
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 5 --retry-delay 3 -A Mozilla -o %o')

prepare() {
# wxgtk < 3.1.0
    sed -i 's/m_listBoxHistory->GetTopItem()/0/g'		FreeFileSync/Source/ui/main_dlg.cpp
    # Revert to classic config path
    patch --binary -p1 -i revert_xdg_config_path.patch

# Revert change to resources path of portable version
    patch --binary -p1 -i revert_resources_path.patch

# gcc 6.3.1
    sed -i 's!static_assert!//static_assert!'			zen/scope_guard.h

# warn_static(string)
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!'		FreeFileSync/Source/Makefile
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!'		FreeFileSync/Source/RealTimeSync/Makefile

# install error
    cp ${srcdir}/Changelog.txt ${srcdir}/FreeFileSync/Build

# edit lines to remove functions that require wxgtk 3.1.x  
    sed -e 's:m_textCtrlOfflineActivationKey->ForceUpper:// &:g' -i 'FreeFileSync/Source/ui/small_dlgs.cpp'
    sed -e 's:const double scrollSpeed =:& 6; //:g' -i 'wx+/grid.cpp'

# add '-lz' back into LINKFLAGS
    sed -i '/pie/ s/-pthread/-lz -pthread/' FreeFileSync/Source/Makefile
    sed -i '/pie/ s/-pthread/-lz -pthread/' FreeFileSync/Source/RealTimeSync/Makefile
    
# file not found error
	sed -i '/\t"..\/Build\/User Manual.pdf" \\/d' FreeFileSync/Source/Makefile

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
    mkdir -p "${srcdir}/FreeFileSync/Build/Bin"
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
