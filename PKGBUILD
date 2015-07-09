# Maintainer: Det
# Contributors: Tom Kwok, Heiko Baums, Kurt J. Bosch

pkgname=fbsplash
pkgver=1.5.4.4
pkgrel=16
pkgdesc="Userspace implementation of a splash screen for Linux (formerly gensplash)"
arch=('i686' 'x86_64')
url="http://fbsplash.alanhaggai.org"
license=('GPL')
depends=('miscsplashutils' 'freetype2' 'libjpeg' 'libpng' 'libmng' 'lcms' 'gpm') 
optdepends=('linux-fbcondecor: enable console background images'
            'fbsplash-extras: additional functionality like daemon icons'
            'uswsusp-fbsplash: suspend to disk with fbsplash'
            'python: convert themes from splashy to fbsplash')
conflicts=('fbsplash-scripts' 'initscripts-extras-fbsplash')
options=('!makeflags')
backup=('etc/conf.d/fbcondecor'
        'etc/conf.d/splash')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/fbsplash.berlios/splashutils-$pkgver.tar.bz2"
        'splash_start_initcpio.patch'
        'splash.conf'
        'fbsplash-basic.sh'
        'fbsplash.initcpio_install'
        'fbsplash.initcpio_hook'
        'fbcondecor.daemon'
        'fbcondecor.conf')
md5sums=('2a16704c4adde97b58812cd89e3f2342'
         '4045e315c52f5a576fca4f7e634eeb91'
         '90708a96038d7d7921c2e9fde938c058'
         'b5e6c08bbe7645a1c035565ea7d66437'
         '2860cc29d5da2ea65c810de068bcc262'
         'f65cf94d4d4959bb44cda5fa634ab405'
         '631b10db2f7c4b70062e79b60541ddbb'
         'b3db9d4fd902b62ac9e38589677e2d16')

build() {
  cd splashutils-$pkgver

  msg2 "Running 'autoreconf'.."
  autoreconf -i

  # fix fbcondecor_ctl splash type
  sed -i 's|fbsplash_lib_init(fbspl_bootup)|fbsplash_lib_init(fbspl_undef)|' src/fbcon_decor_ctl.c

  # fix libdir
  sed -i "s|/lib/splash/cache|/usr/lib/splash/cache|g" debian/splashutils.dirs
  sed -i "s|/lib/splash/tmp|/usr/lib/splash/tmp|g" debian/splashutils.dirs
  sed -i "s|/lib/splash/cache|/usr/lib/splash/cache|g" debian/splash.conf
  sed -i "s|/lib/splash/cache|/usr/lib/splash/cache|g" debian/changelog
  sed -i "s|/lib/splash/tmp|/usr/lib/splash/tmp|g" debian/changelog
  sed -i "s|/lib/splash/cache|/usr/lib/splash/cache|g" docs/daemon
  sed -i "s|@libdir@/splash/cache|/usr/lib/splash/cache|g" scripts/splash-functions.sh.in
  sed -i "s|@libdir@/splash/tmp|/usr/lib/splash/tmp|g" scripts/splash-functions.sh.in
  sed -i "s|@libdir@/splash/bin|/usr/lib/splash/bin|g" scripts/splash-functions.sh.in
  sed -i "s|/lib/splash/cache|/usr/lib/splash/cache|g" src/daemon_cmd.c
  sed -i "s|@libdir@/splash/sys|/usr/lib/splash/sys|g" scripts/splash_geninitramfs.in
  sed -i "s|@libdir@/splash|/usr/lib/splash|g" scripts/splash_manager.in
  sed -i "s|@libdir@/splash|/usr/lib/splash|g" src/fbsplash.h.in

  #Fix freetype => freetype2
  sed -i 's|\(#include <freetype\)/|\12/|' src/libfbsplashrender.c
  sed -i 's|\(#include <freetype\)/|\12/|' src/ttf.h
  sed -i 's|\(#include <freetype\)/|\12/|' src/ttf.c

  # fix set_event_dev call for initcpio usage (if evdev module is there)
  #patch -Np2 -i "$srcdir/splash_start_initcpio.patch"

  export LIBS="-lbz2"
  
  msg2 "Running './configure'.."
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --without-klibc --enable-fbcondecor --with-gpm --with-mng --with-png --with-ttf --with-ttf-kernel
  
  msg2 "Running 'make'.."
  make
}

package() {
  cd splashutils-$pkgver

  msg2 "Running 'make install'.."
  make DESTDIR="$pkgdir" \
       sbindir="/usr/bin" \
	   eexecbindir="/usr/bin" \
	   eexecsbindir="/usr/bin" \
	 install

  cd "$pkgdir"

  # fix duplicate slashes to get splash_cache_cleanup grep to work
  sed -r -e 's,^(export spl_.*="/)/+,\1,' -i usr/bin/splash-functions.sh

  # fix the path to splash_util
  sed -r -e 's|sbin|usr/bin|g' -i usr/bin/splash{-functions.sh,_{geninitramfs,manager}} usr/share/doc/splashutils/{porting,early_bootup} usr/include/fbsplash.h

  # provide the mountpoint needed by splash-functions.sh
  install -dm755 usr/lib/splash/{cache,tmp}
  install -dm700 usr/lib/splash/sys

  # Install fbsplash scripts and config file
  install -Dm644 "$srcdir"/splash.conf etc/conf.d/splash
  install -Dm644 "$srcdir"/fbsplash-basic.sh etc/rc.d/functions.d/fbsplash-basic.sh
  install -Dm644 "$srcdir"/fbsplash.initcpio_install usr/lib/initcpio/install/fbsplash
  install -Dm644 "$srcdir"/fbsplash.initcpio_hook usr/lib/initcpio/hooks/fbsplash

  # Install fbcodecor script and config file
  install -Dm644 "$srcdir"/fbcondecor.conf etc/conf.d/fbcondecor
  install -Dm755 "$srcdir"/fbcondecor.daemon etc/rc.d/fbcondecor
}