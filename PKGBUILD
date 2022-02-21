# Maintainer: nemesys <nemstar zoho com>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel.de>

pkgname=fbsplash
pkgver=1.5.4.4
pkgrel=17
pkgdesc="A userspace implementation of a splash screen for Linux (formerly known as gensplash)"
arch=('x86_64')
url="https://sourceforge.net/projects/fbsplash.berlios/"
license=('GPL')
depends=('miscsplashutils' 'freetype2' 'libjpeg' 'libpng' 'libmng' 'lcms' 'gpm') 
optdepends=('linux-fbcondecor: enable console background images'
            'fbsplash-extras: additional functionality like daemon icons'
            'fbset: framebuffer setup utility'
            'uswsusp-fbsplash: suspend to disk with fbsplash'
            'python: convert themes from splashy to fbsplash')
conflicts=('fbsplash-scripts' 'initscripts-fork' 'mkinitcpio-fbsplash')
options=('!makeflags')
backup=('etc/conf.d/fbcondecor' 'etc/conf.d/splash')
install=fbsplash.install
source=(https://master.dl.sourceforge.net/project/fbsplash.berlios/splashutils-${pkgver}.tar.bz2
        splash_start_initcpio.patch
        splash.conf
        fbsplash-basic.sh
        fbsplash.initcpio_install
        fbsplash.initcpio_hook
        fbcondecor.daemon
        fbcondecor.conf
	fbsplash-freetype-fix.patch)

build() {
  cd "$srcdir/splashutils-$pkgver"

  autoreconf -i

  # fix fbcondecor_ctl splash type
  sed -e 's,fbsplash_lib_init(fbspl_bootup),fbsplash_lib_init(fbspl_undef),' -i src/fbcon_decor_ctl.c

  # switch fprintf to fputs
  sed -i '696,696 s/fprintf/fputs/g' src/libfbsplash.c

  # fix libdir
  sed -i "s:/lib/splash/cache:/usr/lib/splash/cache:g" debian/splashutils.dirs
  sed -i "s:/lib/splash/tmp:/usr/lib/splash/tmp:g" debian/splashutils.dirs
  sed -i "s:/lib/splash/cache:/usr/lib/splash/cache:g" debian/splash.conf
  sed -i "s:/lib/splash/cache:/usr/lib/splash/cache:g" debian/changelog
  sed -i "s:/lib/splash/tmp:/usr/lib/splash/tmp:g" debian/changelog
  sed -i "s:/lib/splash/cache:/usr/lib/splash/cache:g" docs/daemon
  sed -i "s:@libdir@/splash/cache:/usr/lib/splash/cache:g" scripts/splash-functions.sh.in
  sed -i "s:@libdir@/splash/tmp:/usr/lib/splash/tmp:g" scripts/splash-functions.sh.in
  sed -i "s:@libdir@/splash/bin:/usr/lib/splash/bin:g" scripts/splash-functions.sh.in
  sed -i "s:/lib/splash/cache:/usr/lib/splash/cache:g" src/daemon_cmd.c
  sed -i "s:@libdir@/splash/sys:/usr/lib/splash/sys:g" scripts/splash_geninitramfs.in
  sed -i "s:@libdir@/splash:/usr/lib/splash:g" scripts/splash_manager.in
  sed -i "s:@libdir@/splash:/usr/lib/splash:g" src/fbsplash.h.in

  sed -i '17 a #include <sys/sysmacros.h>' src/common.c

  # fix set_event_dev call for initcpio usage (if evdev module is there)
  patch -Np2 -i "$srcdir/splash_start_initcpio.patch"

  # patch to fix freetype error when compiling by removing static freetype.
  patch -Np1 -i "$srcdir/fbsplash-freetype-fix.patch"

  export LIBS="-lbz2"
  export LDFLAGS+=" -z muldefs"
  export LIBTOOL="/usr/bin/libtool/"

  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --without-klibc --enable-fbcondecor --with-gpm --with-mng --with-png --with-ttf --with-ttf-kernel
  make 
}

package() {
  cd "$srcdir/splashutils-$pkgver"

  make  DESTDIR="$pkgdir" sbindir="/usr/bin" eexecbindir="/usr/bin" eexecsbindir="/usr/bin" install

  cd "$pkgdir"

  # fix duplicate slashes to get splash_cache_cleanup grep to work
  sed -r -e 's,^(export spl_.*="/)/+,\1,' -i usr/bin/splash-functions.sh

  # fix the path to splash_util
  sed -r -e 's|sbin|usr/bin|g' -i usr/bin/splash{-functions.sh,_{geninitramfs,manager}} usr/share/doc/splashutils/{porting,early_bootup} usr/include/fbsplash.h

  # provide the mountpoint needed by splash-functions.sh
  install -m755 -d usr/lib/splash/{cache,tmp}
  install -m700 -d usr/lib/splash/sys

  # Install fbsplash scripts and config file
  install -D -m644 "$srcdir/splash.conf" "etc/conf.d/splash"
  install -D -m644 "$srcdir/fbsplash-basic.sh" "etc/rc.d/functions.d/fbsplash-basic.sh"
  install -D -m644 "$srcdir/fbsplash.initcpio_install" "usr/lib/initcpio/install/fbsplash"
  install -D -m644 "$srcdir/fbsplash.initcpio_hook" "usr/lib/initcpio/hooks/fbsplash"

  # Install fbcodecor script and config file
  install -D -m644 "$srcdir/fbcondecor.conf" "etc/conf.d/fbcondecor"
  install -D -m755 "$srcdir/fbcondecor.daemon" "etc/rc.d/fbcondecor"

  #Finish libtool setup.

  /usr/bin/libtool --finish "/usr/lib"
}
md5sums=('2a16704c4adde97b58812cd89e3f2342'
         '4045e315c52f5a576fca4f7e634eeb91'
         '7541820998613094ad6d7a893302b5db'
         'b5e6c08bbe7645a1c035565ea7d66437'
         '2860cc29d5da2ea65c810de068bcc262'
         'f65cf94d4d4959bb44cda5fa634ab405'
         '4b1bc27908fd763c57d8137035418d5c'
         'b3db9d4fd902b62ac9e38589677e2d16'
         '64cf5c9a86b595733e8f2f428a183419')
