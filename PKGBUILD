# Contributor: Stas Bourakov <sbourakov(at)gmail.com>
pkgname=enigma2
pkgver=20140610
pkgrel=1
pkgdesc="Enigma2 - software for Linux-powered DVB satellite, terrestrial and cable digital television receivers (e.g. Dreambox). This is experimental version for PC."
arch=('i686' 'x86_64')
url="https://github.com/cougar-enigma/Enigma2PC"
license=('GPL2')
depends=('gettext' 'libdvdnav' 'freetype2' 'fribidi' 'giflib' 'gstreamer0.10' 'gstreamer0.10-base-plugins' 'libjpeg6' 'libpng' 'sdl' 'libsigc++' 'libxml2' 'libxslt' 'python2' 'swig' 'libdvbsi++' 'libxmlccwrap' 'libdreamdvd' 'libdvbcsa' 'xine-lib_for_enigma2' 'twisted-web2' 'libsigcpp1.2')
makedepends=('autoconf' 'automake' 'bison' 'fakeroot' 'flex' 'libtool' 'm4' 'make' 'patch' 'pkg-config' 'git' 'linux-headers')
conflicts=()
source=('git://github.com/Raider05/enigma2pc.git'
	'rollback_lirc_support.diff' 
	'etc.tar.gz' 
	'giflib.patch')

#_commit=''
#_gitroot='git://github.com/Raider05/enigma2pc.git'
_gitname='enigma2pc'

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
#    cd "${srcdir}"
#    msg "Connecting to GIT server...."
#
#    if [ -d "${_gitname}" ] ; then
#        cd "${_gitname}" && git checkout "${_commit}" && git pull origin 
#        [[ "${_commit}" ]] && git checkout "${_commit}"
#        msg "The local files are updated."
#        #msg "Running make distclean"
#        #make distclean || :
#    else
#        git clone "${_gitroot}" "${_gitname}" #-b "${_commit}"
#        cd "${_gitname}"
#        [[ "${_commit}" ]] && git checkout "${_commit}"
#    fi
#
    if [ -d "$srcdir/$_gitname-build" ]; then
      rm -r "$srcdir/$_gitname-build"
    fi

    cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build/enigma2"
#    patch -p1 -i ${srcdir}/enigma21_11_11.patch
#    patch -p1 -i ${srcdir}/patch_eptrlist.patch
    patch -p2 -i ${srcdir}/giflib.patch


    autoreconf -i || return 1
    ./configure --without-debug --prefix=/usr/local --with-xlib PYTHON="/usr/bin/python2" || return 1
    make || return 1
    make install DESTDIR=$pkgdir || return 1
    cp -fR lib/gdi/*.h $pkgdir/usr/local/include/enigma2/lib/gdi
    cd dvbsoftwareca
    make || return 1
    install -D dvbsoftwareca.ko $pkgdir/lib/modules/`uname -r`/kernel/drivers/dvbsoftwareca.ko

# Copy config files
    mkdir -p $pkgdir/usr/local/etc
    cd "$srcdir/"
    cp -r $startdir/src/etc/* $pkgdir/usr/local/etc
}
md5sums=('SKIP'
         '5bb8d4b8e62cd664da681b5444fab301'
         '97ae27f051e79c33616bcc4360c80557'
         '6be3deaaf53b01bd7e262ac711a16fc5')
