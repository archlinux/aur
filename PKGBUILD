# Contributor: chenxing <cxcxcxcx AT gmail DOT com>
# Contributor: Michael Burkhard <Michael DOT Burkhard AT web DOT de>
# Maintainer: alexmo82 <25396682 AT live DOT it>

pkgname=freefilesync
pkgver=8.8
pkgrel=0
pkgdesc="Backup software to synchronize files and folders"
arch=('i686' 'x86_64')
url="http://www.freefilesync.org/"
license=('GPLv3')
depends=(wxgtk webkitgtk2 boost-libs)
makedepends=(boost)
source=(
	"http://downloads.sourceforge.net/project/zenxml/zenXml_2.3.zip"	#zen
	"FreeFileSync_${pkgver}_Source.zip::https://dl.dropboxusercontent.com/u/74545385/FreeFileSync_8.8_Source.zip"		#ffs
	FreeFileSync.desktop
	ffsicon.png
	RealTimeSync.desktop
	rtsicon.png
	)
md5sums=(
	'58baf96cb8e1136d10e1ada7419921c5'	#zen source
	'bb28b309893d24464f301a6f989b2b96'	#ffs source
	'eab0ccfc6a88e229a0f07507b93cfcff'	#FreeFileSync.desktop
	'1f452dff6f970d95839411008d86250b'	#ffsicon.png
	'ab266177f69d16ad9f4099ae4edd77a2'	#RealTimeSync.desktop
	'ee5587fa0a8d906ad416564e4daf5a06'	#rtsicon.png
	)

prepare() {
    sed -i 's/m_listBoxHistory->GetTopItem()/0/g'		FreeFileSync/Source/ui/main_dlg.cpp
    sed -i 's!static_assert!//static_assert!'			zen/scope_guard.h
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!'		FreeFileSync/Source/Makefile
    sed -i 's!-O3 -DN!-D"warn_static(arg)= " -O3 -DN!'		FreeFileSync/Source/RealTimeSync/Makefile
    sed -i 's/time_t getVersionCheckInactiveId()/inline time_t getVersionCheckInactiveId()/' FreeFileSync/Source/ui/version_check_impl.h
    sed -i 's/bool shouldRunPeriodicUpdateCheck(time_t lastUpdateCheck)/inline bool shouldRunPeriodicUpdateCheck(time_t lastUpdateCheck)/' FreeFileSync/Source/ui/version_check_impl.h
}

build() {
### just in case of compile errors
    VER=`g++ -dumpversion`
    MAC=`g++ -dumpmachine`
    echo "compiler g++ $VER $MAC"

### FFS
    cd ${srcdir}/FreeFileSync/Source
    make launchpad

### RTS
    cd RealTimeSync
    make launchpad
}

package() {
    cd ${srcdir}/FreeFileSync/Source
    make DESTDIR=${pkgdir} install

    cd RealTimeSync
    make DESTDIR=${pkgdir} install

    cd ${srcdir}
    install -Dm644 FreeFileSync.desktop $pkgdir/usr/share/applications/FreeFileSync.desktop
    install -Dm644 ffsicon.png $pkgdir/usr/share/pixmaps/ffsicon.png
    install -Dm644 RealTimeSync.desktop $pkgdir/usr/share/applications/RealTimeSync.desktop
    install -Dm644 rtsicon.png $pkgdir/usr/share/pixmaps/rtsicon.png
}
