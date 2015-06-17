realname=qutecom
pkgname=${realname}-hg
pkgver=526
realver=3.0
pkgrel=1
pkgdesc="A free VoIP softphone, superseding WengoPhone.  This is the latest repository source code."
arch=("i686" "x86_64")
url="http://www.${realname}.org/"
license=("GPL")
depends=("libstdc++5" "qt4" "openssl" "gnutls" "e2fsprogs" "libxml2" "speex" "ffmpeg" "portaudio" "alsa-lib" "libsndfile" "libsamplerate" "curl" "libosip2")
makedepends=("gcc" "cmake" "qt4" "boost" "glib2" "mercurial")
conflicts=("wengophone2" "${realname}")
#replaces=("wengophone2")
options=(!emptydirs)
source=(new-videodev.patch)
md5sums=()
_hgroot="http://hg.${realname}.org/"
_hgrepo="${realname}-3.0"

build() {
	#cd ${srcdir}/${realname}-${realver}/build/
	cd ${srcdir}

	# Repository
	msg "Connecting to Mercurial server...."
	# update the repo, else clone a new one
	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}/
		hg pull -u || return 1
	else
		hg clone ${_hgroot}/${_hgrepo} || return 1
		cd ${_hgrepo}/
	fi
	msg "Mercurial checkout done or server timeout"

	msg "Cloning working directory"
	cd ${srcdir}
	rm -rf ${srcdir}/${_hgrepo}-build 2>/dev/null
	cp -a ${_hgrepo} ${_hgrepo}-build
	cd ${_hgrepo}-build

	msg "Starting make..."

	# Patches and fixes
#	patch -Np1 -i ../new-videodev.patch || return 1
	mv INSTALL.txt INSTALL

	# Build
        cd qutecom
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="-lX11" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 -Wno-dev || return 1
	make || return 1
	cp bin/plugins/mediastreamer2/msg726.so bin/plugins/mediastreamer2/msg722.so
	make DESTDIR=${pkgdir} install || return 1
	
	rm -rf ${srcdir}/${_hgrepo}-build 2>/dev/null
	rm $pkgdir/usr/lib/qutecom/plugins/msg722.so
}

md5sums=('52b536108d9c9aabe6e07a18f72db81b')
