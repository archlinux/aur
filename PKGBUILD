# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# Thanks to loki for fixes!
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: David Roheim <david dot roheim at gmail dot com>
pkgname=xulrunner192
pkgver=1.9.2.28
_ffoxver=3.6.28
pkgrel=4
pkgdesc="Mozilla Runtime Environment"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss' 'libxt' 'hunspell' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'libevent' 'sqlite>=3.7.4' 'libnotify>=0.4')
makedepends=('zip' 'pkg-config' 'diffutils' 'libgnomeui' 'python2' 'wireless_tools' 'autoconf2.13')
url="http://wiki.mozilla.org/XUL:Xul_Runner"

source=(ftp://mirrors.kernel.org/slackware/slackware-13.1/patches/source/mozilla-firefox/firefox-${_ffoxver}.source.tar.bz2
        mozconfig
        mozilla-pkgconfig.patch
        fix-mozilla-launcher.patch
        xulrunner-version.patch
        xulrunner-png14.patch
        xulrunner-png15.patch
        enable-x86_64-tracemonkey.patch
        offsetof.patch
        python2.7.patch
        file_util.patch
        message_pump_libevent.patch
        file_descriptor_set_posix.patch
        file_util_linux.patch
        time_posix.patch
        scopefixes.patch
        fixWformat.patch
        )
md5sums=('175fea06e1af7c76992e23865e4456eb'
         '3ba733b226dfaa89f193822d1e2abc35'
         'd839d1c4ef736e6d89ccf91b23b965a4'
         '63eee2d1da3b43c9d604f2253f242f40'
         '371303c5bdc4fa0d955d14521b93b69d'
         '3bd0566180ad2daa32743b3ce58b2095'
         '65eaf73452b1d974aa1065022d693132'
         'cbd938cd1fb8210cd8a2c41833489af9'
         'c39773f884c79773db10a1216722441e'
         'ab3dc9aecae7f08b9492fb3c00a5fd28'
         '26be7284706ff5f740deb3e83e6cf29c'
         '187ec32c67744df73bb76fd5057a06a6'
         '2352dcccac6c0913d5f68c4e6236af50'
         '642a2fcc49e160385707ff903e17a25a'
         'b3c4fc2396635efc38d4c649ca054ed8'
         '59f00e0e6e7454e788c9e19dd9090c4e'
         '7ba6f9e9421533151bb60ec1caf7a695'
         )
         
prepare() {
  cd "${srcdir}/mozilla-1.9.2"
  cp "${srcdir}/mozconfig" .mozconfig

  patch -Np1 -i "${srcdir}/offsetof.patch"

  # Fix C++ 4.7 compile errors
  patch -Np1 -i "${srcdir}/file_util.patch"
  patch -Np1 -i "${srcdir}/message_pump_libevent.patch" 
  patch -Np1 -i "${srcdir}/file_descriptor_set_posix.patch" 
  patch -Np1 -i "${srcdir}/file_util_linux.patch" 
  patch -Np1 -i "${srcdir}/time_posix.patch" 
  patch -Np0 -i "${srcdir}/scopefixes.patch" 

  # fix libdir/sdkdir - fedora
  patch -Np1 -i "${srcdir}/mozilla-pkgconfig.patch" 

  # Fix stub launcher - archlinux
  patch -Np0 -i "${srcdir}/fix-mozilla-launcher.patch" 

  # Force installation to the same path for every version
  patch -Np1 -i "${srcdir}/xulrunner-version.patch" 
  
  # Fix compile with libpng 1.4
  patch -Np0 -i "${srcdir}/xulrunner-png14.patch"

  # Fix compile with libpng 1.5
  patch -Np0 -i "${srcdir}/xulrunner-png15.patch"

  # Tracemonkey for x86_64
  patch -Np0 -i "${srcdir}/enable-x86_64-tracemonkey.patch"

  # python2.7
  patch -Np0 -i "${srcdir}/python2.7.patch"

  # security warns
  patch -Np3 -i "${srcdir}/fixWformat.patch"
  
  # fix freetype headers
  sed -i 's/freetype\///g' config/system-headers
  sed -i 's/freetype\///g' gfx/thebes/src/gfxPangoFonts.cpp

  unset CFLAGS
  unset CXXFLAGS
}

build()
{
  cd "${srcdir}/mozilla-1.9.2"
  make -j1 -f client.mk build MOZ_MAKE_FLAGS="$MAKEFLAGS"
}

package() {
  cd "${srcdir}/mozilla-1.9.2"
  make -j1 DESTDIR="${pkgdir}" install

  # Remove included dictionaries, add symlink to system myspell path.
  # Note: this will cause file conflicts when users have installed dictionaries in the old location
  rm -rf "${pkgdir}/usr/lib/xulrunner-1.9.2/dictionaries"
  ln -sf /usr/share/myspell/dicts "${pkgdir}/usr/lib/xulrunner-1.9.2/dictionaries"

  rm -f "${pkgdir}/usr/bin/xulrunner"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
}
