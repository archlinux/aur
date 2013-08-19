# Contributor: Prurigro
# Maintainer: Anish
# Patches/Fixes created from efforts by prurigro, sdnick484, jaydonoghue, anish, jpf, vrtladept, paulingham, bralkein, wonder, Slash and others! (contact us if your work is here but you aren't mentioned)
# fribidi.patch fixes an issue where some people were having missing file issues related to the fribidi library
# gcc44.patch helps boxee compile on gcc 4.4
# boxee64.patch addresses a number of problems getting boxee to compile and run smoothly on x86_64
# flashlib.patch allows flashlib to compile, allowing us to get a little closer to a built-from-source flash solution. this is turned off for now
# libpng.patch helps compile against libpng1.4
# 12563_fix removes extraneous function calls that wont let boxee compile
# pkgdesc from wikipedia :)

pkgname=boxee-source
pkgver=1.5.0
minorver=3a626c6
_flashlib_pkgver=6684
pkgrel=3
pkgdesc="A freeware cross-platform media center software with social networking features that is a fork of the open source XBMC media center"
arch=('i686' 'x86_64')
license=( 'GPL' )
depends=('php' 'glew' 'hal' 'jasper' 'libcdio' 'sdl_image' 'sdl_mixer' 'sdl_gfx' 'sdl_sound' 'fribidi' 'libmad' 'lzo2' 'unrar' 'smbclient' 'streamripper' 'python-pysqlite' 'curl' 'gawk' 'pmount' 'libmysqlclient' 'dbus' 'bzip2' 'boost' 'faac' 'enca' 'gperf' 'unzip' 'tre' 'screen' 'bison' 'libsamplerate' 'zip' 'libmms' 'libvdpau' 'libxtst' 'libxrandr' 'fontconfig' 'libxinerama' 'python24')
makedepends=( 'boost' 'cmake' 'nasm' 'coreutils' 'rsync' 'glew')
options=('!makeflags')
url="http://www.boxee.tv/"
install='boxee-source.install'
source=(http://dl.boxee.tv/boxee-sources-$pkgver-$minorver.tar.xz
	boxee.desktop
	boxee64.patch
	libpng.patch
	libfix.patch
	mysql_fix.patch
	libjpeg_cflags.patch
	fixtypediff.patch
	libpng15.patch
	libavcodec.patch
	gcc4.7.patch
	ssaver_fix.patch
	misc.patch)
md5sums=('51ff4c717ada75974e844e2c8a42f367'
         'dcad8a3955ea2742a6dccb23e6b665ef'
         '3241498186d95a5aafd4d2a6947c764f'
         'fcbca3c8ffab5402fec84d6d05db5d3d'
         '0f856a7e8b86aaa19599ecdc53098563'
         'bb279a1ee89958d9c631bb6bc4099f08'
         'acacd13c8169bfc5f3fa15807a5bf789'
         '55a04bca0f3f6cabaae0b2786657994d'
         '9cbbea104b3bfdf2d524cf4212f14006'
         'fc7e4a373d78f33f7bd06e80a6df770a'
         '556c1044a60377f662d455ea35880eb6'
         'df64ef665058141dcde9da921db74696'
         '3df822bc532ccdc5b096604eb0836e37')


_src=${srcdir}/boxee-sources-"$minorver"

build() {
	pushd ${_src} || return 1
		#this section contains changes required for x86_64 and thus is only loaded if your arch is x86_64
		if [ $(uname -m) = "x86_64" ]; then
			#boxee64.patch allows boxee to compile on 64bit systems
			patch -p0 < ../boxee64.patch || return 1
			#ffmpeg needs to be patched for 64bit systems
		#	patch -p0 < ../ffmpeg64.patch || return 1

			#two symlinks added by paulingham that work with boxee64.patch to allow boxee to compile on x86_64
			pushd xbmc/lib/libsmb || return 1
				ln -s /usr/lib/libtalloc.so.1 libtalloc-x86_64-linux.a
				ln -s /usr/lib/libwbclient.so.0 libwbclient-x86_64-linux.a
			popd || return 1
			_xulrunner=xulrunner-x86_64-linux
		else
			_xulrunner=xulrunner-i486-linux
		fi || return 1
		

		#anish.patch adds some minor tweaks anish figured out to get the latest sources running
		#patch -p0 < ../anish.patch || return 1

		#fribidi.patch fixes the compile issue related to fribidi (big thanks to vrtladept and anish for getting this one rolling)
		#patch -p0 < ../fribidi.patch || return 1

		#patch to compile against libpng14, thanks to wonder for providing the original patch
		patch -p0 < ../libpng.patch || return 1
		patch -p0 < ../libpng15.patch

		#patch to compilet release 0.9.21.12563, remove extraneous function calls that cause linkage failure
#		patch -p0 < ../12563_fix.patch || return 1
		
		#patch to fix missing libs in Makefile
		patch -p0 < ../libfix.patch || return 1

		#thank the fedora guys for this
		patch -p0 < ../mysql_fix.patch || return 1

		#remocpile libjpeg with fPIC
                pushd xbmc/lib/cximage-6.0/jpeg-turbo
                        autoreconf -vif
                popd

		# compile libavcodec under gcc 4.7
		patch -p1 < ../libavcodec.patch
		patch -p0 < ../gcc4.7.patch

		patch -p0 < ../libjpeg_cflags.patch || return 1

		patch -p0 < ../fixtypediff.patch

		patch -p0 < ../ssaver_fix.patch

		patch -p0 < ../misc.patch

		#smbno.h was deprecated in the kernel, the boxee guys leave us hanging as usual
#		patch -p0 < ../samba.patch || return 1
#		cp ../smbno.h xbmc/cores/paplayer/MACDll/Source/MACLib/. || return 1
		
		#tinyxpath and goom need to be reconfigured so they link against the correct utilities (another thanks to anish for this one)
		pushd xbmc/lib/libBoxee/tinyxpath || return 1
			autoreconf -vif || return 1
			./configure || return 1
		popd || return 1

		pushd xbmc/cores/dvdplayer/Codecs/libfaad2 
			autoreconf -vif
		popd

		pushd xbmc/lib/libid3tag/libid3tag
			autoreconf -vif
		popd

		pushd xbmc/lib/libbluray
			autoreconf -vif
		popd

		pushd xbmc/lib/libdvbpsi
			autoreconf -vif
		popd

		pushd xbmc/lib/harfbuzz/harfbuzz
			autoreconf -vif
		popd

		pushd xbmc/visualizations/Goom/goom2k4-0 || return 1
			aclocal || return 1
			libtoolize --copy --force || return 1
			./autogen.sh --enable-static --with-pic || return 1
		popd || return 1
	
		#thanks to bralkein	
		pushd xbmc/lib/libass/ || return 1
			autoreconf --install || return 1
		popd || return 1
		
		aclocal || return 1
		autoheader || return 1
		autoconf || return 1
		#if anyone wants pulseaudio, simply remove "--disable-pulse"
		./configure --prefix=/opt/boxee --enable-mid --disable-debug --disable-pulse --enable-xrandr --disable-ccache --enable-vdpau LIBS="-lm" || return 1
	
		#this is another hack to fix an issue with gcc44-- once again I'm using sed because the Makefile is generated in this package
		if [ $(uname -m) = "x86_64" ]; then
			sed -r 's/\(MAKE\)\ -C\ xbmc\/screensavers$/\(MAKE\)\ CFLAGS=\"-march=k8\ -02\ -pipe\"\ -C\ xbmc\/screensavers/g' Makefile > Makefile.sed || return 1
		else
			sed -r 's/\(MAKE\)\ -C\ xbmc\/screensavers$/\(MAKE\)\ CFLAGS=\"-march=i486\ -02\ -pipe\"\ -C\ xbmc\/screensavers/g' Makefile > Makefile.sed || return 1
		fi
		cat Makefile.sed > Makefile || return 1

		make || return 1

		if [ $(uname -m) = "x86_64" ]; then
			make -C tools/TexturePacker -f Makefile.host64
		else
			make -C tools/TexturePacker -f Makefile.host
		fi
#		rm skin/boxee/media/Textures.xbt
		make -C skin/boxee/media

	popd || return 1
}

package() {

	#language
	install -d ${pkgdir}/opt/boxee/language || return 1
	pushd ${_src}/language/ || return 1
		find . | sed -e 's/\.\///g' | while read file; do
			if [ -d "$file" ]; then
				install -d ${pkgdir}/opt/boxee/language/"$file" || return 1
			else
				install -D "$file" ${pkgdir}/opt/boxee/language/"$file" || return 1
			fi || return 1
		done || return 1
	popd || return 1
	
	#media
	install -d ${pkgdir}/opt/boxee/media || return 1
	pushd ${_src}/media/ || return 1
		find . | sed -e 's/\.\///g' | while read file; do
			if [ $(echo "$file" | grep "icon.png" -i -c) = 0 -a $(echo "$file" | grep "icon32x32.png" -i -c) = 0 -a $(echo "$file" | grep "xbmc.icns" -i -c) = 0 -a $(echo "$file" | grep "Boxee.ico" -i -c) = 0 -a $(echo "$file" | grep "Splash.png" -i -c) = 0 -a $(echo "$file" | grep "Splash_old.png" -i -c) = 0 -a $(echo "$file" | grep "Fonts/arial.ttf" -i -c) = 0 ]; then
				if [ -d "$file" ]; then
					install -d ${pkgdir}/opt/boxee/media/"$file" || return 1
				else
					install -D "$file" ${pkgdir}/opt/boxee/media/"$file" || return 1
				fi || return 1
			fi || return 1
		done || return 1
	popd || return 1
	
	#scripts
	install -d ${pkgdir}/opt/boxee/scripts || return 1
	pushd ${_src}/scripts || return 1
		find . | sed -e 's/\.\///g' | while read file; do
			if [ $(echo "$file" | grep "scripts.zip" -i -c) = 0 -a $(echo "$file" | grep "user_submitted.zip" -i -c) = 0 -a $(echo "$file" | grep "autoexec.py" -i -c) = 0 ]; then
				if [ -d "$file" ]; then
					install -d ${pkgdir}/opt/boxee/scripts/"$file" || return 1
				else
					install -D "$file" ${pkgdir}/opt/boxee/scripts/"$file" || return 1
				fi || return 1
			fi || return 1
		done || return 1
	popd || return 1

	#skin
	install -d ${pkgdir}/opt/boxee/skin/boxee || return 1
	pushd ${_src}/skin/boxee || return 1
		find . | sed -e 's/\.\///g' | while read file; do
#			if [ $(echo "$file" | grep -e "^media" -i -c) = 0 ]; then
				if [ -d "$file" ]; then
					install -d ${pkgdir}/opt/boxee/skin/boxee/"$file" || return 1
				else
					install -D "$file" ${pkgdir}/opt/boxee/skin/boxee/"$file" || return 1
				fi || return 1
#			fi || return 1
		done || return 1
		install -d ${pkgdir}/opt/boxee/skin/boxee/media || return 1
	popd || return 1

	#system
	pushd ${_src}/system/python/local || return 1
#This isn't indented because whitespace is significant to python
python2.4 -O >/dev/null << EOF
import py_compile
py_compile.compile('mc.py')
EOF
	popd || return 1
	
	install -d ${pkgdir}/opt/boxee/system || return 1
	pushd ${_src}/system/ || return 1
		find . -path "./python/Lib" -prune -o -print | sed -e 's/\.\///g' | while read file; do
			if [ $(echo "$file" | grep "win32" -i -c) = 0 -a $(echo "$file" | grep "spyce" -i -c) = 0 -a $(echo "$file" | grep "DLLs" -i -c) = 0 -a $(echo "$file" | grep "osx" -i -c) = 0 -a $(echo "$file" | grep -e "\.dll$" -i -c) = 0 -a $(echo "$file" | grep -e "\.pyc$" -i -c) = 0 -a $(echo "$file" | grep "xulrunner" -i -c) = 0 -a $(echo "$file" | grep "etc" -i -c) = 0 -a $(echo "$file" | grep "python24.zlib" -i -c) = 0 -a $(echo "$file" | grep "upnpserver.xml" -i -c) = 0 -a $(echo "$file" | grep "IRSSmap.xml" -i -c) = 0 -a $(echo "$file" | grep "X10-Lola-IRSSmap.xml" -i -c) = 0 -a $(echo "$file" | grep "fontconfig_readme" -i -c) = 0 -a $(echo "$file" | grep "libmpeg2-i486-linux.so" -i -c) = 0 -a $(echo "$file" | grep "bxoverride.so" -i -c) = 0 -a $(echo "$file" | grep "readme.txt" -i -c) = 0 -a $(echo "$file" | grep "simplejson/_speedups.so" -i -c) = 0 ]; then
				if [ -d "$file" ]; then
					install -d ${pkgdir}/opt/boxee/system/"$file" || return 1
				else
					install -D "$file" ${pkgdir}/opt/boxee/system/"$file" || return 1
				fi || return 1
			fi || return 1
		done || return 1
	popd || return 1

	install -d ${pkgdir}/opt/boxee/system/players/flashplayer/${_xulrunner} || return 1
	pushd ${_src}/system/players/flashplayer/${_xulrunner} || return 1
		find . | sed -e 's/\.\///g' | while read file; do
			if [ -d "$file" ]; then
				install -d ${pkgdir}/opt/boxee/system/players/flashplayer/${_xulrunner}/"$file" || return 1
			else
				install -D "$file" ${pkgdir}/opt/boxee/system/players/flashplayer/${_xulrunner}/"$file" || return 1
			fi || return 1
		done || return 1
	popd || return 1
	
	install -d ${pkgdir}/opt/boxee/system/python/lib || return 1
	pushd ${_src}/system/python/Lib || return 1
#This isn't indented because whitespace is significant to python
python2.4 -O >/dev/null << EOF
import compileall
compileall.compile_dir(".", force=1)
EOF
	find . | sed -e 's/\.\///g' | while read file; do
		if [ $(echo "$file" | grep -e "darwin$" -e "mac$" -i -c) = 0 ]; then
			if [ -d "$file" ]; then
				install -d ${pkgdir}/opt/boxee/system/python/lib/"$file" || return 1
			elif [ ! $(echo "$file" | grep -e "\.pyo$" -i -c) = 0 ]; then
				install -D "$file" ${pkgdir}/opt/boxee/system/python/lib/"$file" || return 1
			elif [ ! $(echo "$file" | grep -e "\.so$" -i -c) = 0 ]; then
				install -D "$file" ${pkgdir}/opt/boxee/system/python/lib/"$file" || return 1	
			fi || return 1
		fi || return 1
	done || return 1
	popd || return 1

	rm -rf ${pkgdir}/opt/boxee/system/python/lib/plat-darwin || return 1
	rm -rf ${pkgdir}/opt/boxee/system/python/lib/plat-mac || return 1
#	rmdir ${pkgdir}/opt/boxee/system/python/lib/idlelib/Icons || return 1
	rmdir ${pkgdir}/opt/boxee/system/python/lib/site-packages || return 1

	#userdata
	install -d ${pkgdir}/opt/boxee/UserData || return 1
	install -D ${_src}/UserData/*linux* ${pkgdir}/opt/boxee/UserData/ || return 1
	ln -s UserData ${pkgdir}/opt/boxee/userdata || return 1
	
	#plugins
	install -d ${pkgdir}/opt/boxee/plugins/music || return 1
	install -d ${pkgdir}/opt/boxee/plugins/pictures || return 1
	install -d ${pkgdir}/opt/boxee/plugins/video || return 1

	#visualisations
	install -d ${pkgdir}/opt/boxee/visualisations/
	pushd ${_src}/visualisations/ || return 1
	for i in *; do
		if [ -d "$i" ]; then
			install -d ${pkgdir}/opt/boxee/visualisations/"$i" || return 1
			if [ $(ls "$i" | wc -l) != "0" ]; then
				install -D "$i"/* ${pkgdir}/opt/boxee/visualisations/"$i"/ || return 1
			fi || return 1
		else
			if [ $(echo "$i" | grep "osx" -c) = "0" -a $(echo "$i" | grep "win32" -c) = "0" -a $(echo "$i" | grep "Goom.vis" -c) = "0" -a $(echo "$i" | grep "xbmc_vis.h" -c) = "0" ]; then
				install -D "$i" ${pkgdir}/opt/boxee/visualisations/ || return 1
			fi || return 1
		fi || return 1
        done || return 1
	popd || return 1

	#remove unnecessary libs
	if [ $(uname -m) = "x86_64" ]; then
		rm -rf ${pkgdir}/opt/boxee/system/players/flashplayer/*486*
	else
		rm -rf ${pkgdir}/opt/boxee/system/players/flashplayer/*x86_64*
	fi

	#screensavers
	install -d ${pkgdir}/opt/boxee/screensavers || return 1
	install -D ${_src}/xbmc/screensavers/*.xbs ${pkgdir}/opt/boxee/screensavers/ || return 1

	#rtorrent
	#install -d ${pkgdir}/opt/boxee/bin || return 1
	#install -D ${_src}/bin-linux/boxee-rtorrent ${pkgdir}/opt/boxee/bin/ || return 1

	#boxee binary
	install -D ${_src}/Boxee ${pkgdir}/opt/boxee/ || return 1
	strip ${pkgdir}/opt/boxee/Boxee || return 1
#	install -D ${_src}/run-boxee-desktop.in ${pkgdir}/opt/boxee/run-boxee-desktop || return 1

	#give_me_my_mouse_back
#	gcc ${_src}/give_me_my_mouse_back.c -o ${_src}/give_me_my_mouse_back -lSDL || return 1
#	install -D ${_src}/give_me_my_mouse_back ${pkgdir}/opt/boxee/ || return 1
#	strip ${pkgdir}/opt/boxee/give_me_my_mouse_back || return 1
	
	#xbmc-xrandr
#	install -D ${_src}/xbmc-xrandr ${pkgdir}/opt/boxee/ || return 1
#	strip ${pkgdir}/opt/boxee/xbmc-xrandr || return 1
	
	#freedesktop
	install -d ${pkgdir}/usr/share/applications || return 1
	install -D -m644 ${srcdir}/boxee.desktop ${pkgdir}/usr/share/applications/ || return 1
	install -d ${pkgdir}/usr/share/pixmaps || return 1
	install -D ${_src}/media/icon.png ${pkgdir}/usr/share/pixmaps/boxee.png || return 1

}
