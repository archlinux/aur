# Maintainer: Apokalypzx <apokalypzx at gmail dot com>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Owersun <shiva at maill dot ru> 
# Contributor: Holzhaus <holthuis dot jan at googlemail dot com>
# Contributor: Mdrjr <mauro dot ribeiro at hardkernel dot com>

buildarch=4

_prefix=/usr

pkgbase=kodi-c2-fb
pkgname=('kodi-c2-fb' 'kodi-c2-eventclients-fb')
_commit='cdb7704d1174395f399657fd3f562fe236516b9f'
pkgver='16.1.20160424'
pkgrel=2
arch=('aarch64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
    'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'gcc' 'gcc-libs' 'git' 'glew' 
    'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass' 
    'libbluray' 'libcdio' 'odroid-c2-libgl-fb' 'libmariadbclient' 'libmicrohttpd' 
    'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva' 
    'libxslt' 'lzo' 'nasm' 'nss-mdns' 'python2-pillow' 'aml-libs-c2' 
    'python2-pybluez' 'python2-simplejson' 'rtmpdump' 'sdl2' 'sdl_image' 
    'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower' 'yajl' 
    'zip' 'dcadec' 'libcrossguid-git' 'libcec'
)
source=("https://github.com/owersun/xbmc/archive/${_commit}.tar.gz"
        "git+https://github.com/mdrjr/c2_mali.git"
        '10-odroid.rules'
        'kodi.service'
        'polkit.rules'
        'kodi_permissions.conf'
        'config_static_ffmpeg.patch'
        'gcc6_fix.patch')

sha256sums=('a56165257af0ee6899317093c412603b01967068536ae200dfcab0b74bdc501d'
            'SKIP'
            '5ddf80329c9f5d054525b45f788b3405d199bfc6cf5b08c543ad29766ec27f6e'
            '61057f631734615c5d113016c70e65064581ecb4b66c88d98f94c6fb9dcfd5a2'
            'c68ed2bd377f80b606b8815d78239b9132b479eafc1d19797cee5824debe1800'
            '2d168cb204e2a44d2f7be750f952e4d36446b3b492194c8f0e4d289aad1ba47c'
            'ca8bfce0f5969f6fb64779b9a7136534b4af9f57df3efda8462f169c925dc87c'
            'b0fe75d10b2678894d1dec48f3258c0bec2a4a170f33d76a9a8334bb1969b18f')

prepare() {
  cd xbmc-${_commit}
  #Add USE_STATIC_FFMPEG=1 to configure.ac to use internal ffmpeg.
  patch < $srcdir/config_static_ffmpeg.patch  

  # Use Python 2 instead of Python 3
  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
  sed 's/python/python2/' -i tools/Linux/kodi.sh.in

  patch -Np1 -i ${srcdir}/gcc6_fix.patch
}

build() {
  cd xbmc-${_commit}
  MALI_INCLUDE=$srcdir/c2_mali/fbdev/mali_headers
  CFLAGS="$CFLAGS -I$MALI_INCLUDE"
  CXXFLAGS="$CFLAGS"
  LDFLAGS+=" -L/usr/lib/mali-egl -L/usr/lib/aml_libs"
  # Bootstrapping
  MAKEFLAGS=-j4 ./bootstrap > build.log 2>&1

  #./configure --help
  #return 1

  # Configuring XBMC
  export PYTHON_VERSION=2  # external python v2
  ./configure --prefix=$_prefix \
    gl_cv_func_gettimeofday_clobber=no ac_cv_lib_bluetooth_hci_devid=no \
    --disable-debug \
    --enable-optimizations \
    --enable-libbluray \
    --disable-texturepacker \
    --enable-external-libraries \
    --with-lirc-device=/run/lirc/lircd \
    --disable-vaapi \
    --disable-static --enable-shared \
    --enable-rsxs \
    --enable-codec=amcodec \
    --disable-x11 \
    --enable-gles \
    --disable-gl \
    --disable-openmax \
    --disable-vdpau \
    --disable-xrandr \
    --enable-pulse \
    >> build.log 2>&1

  # Now (finally) build
#  make
   make -k >> build.log 2>&1
}

package_kodi-c2-fb() {
  pkgdesc="A software media player and entertainment hub for digital media (ODROID-C2 Framebuffer)"

  # depends expected for kodi plugins:
  # 'python2-pillow' 'python2-pybluez' 'python2-simplejson'
  # depends expeced in FEH.py
  # 'mesa-demos' 'xorg-xdpyinfo'
  depends=(
    'python2-pillow' 'python2-pybluez' 'python2-simplejson'
    'mesa-demos' 'xorg-xdpyinfo'
    'bluez-libs' 'fribidi' 'glew' 'hicolor-icon-theme' 'libcdio'
    'libjpeg-turbo' 'libmariadbclient' 'libmicrohttpd' 'libpulse' 'libssh'
    'libva' 'libxrandr' 'libxslt' 'lzo' 'sdl2' 'smbclient' 'taglib' 'tinyxml'
    'yajl' 'odroid-c2-libgl-fb' 'aml-libs-c2'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'libnfs: NFS shares support'
    'libplist: AirPlay support'
    'lirc: Remote controller support'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'udisks: Automount external drives'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
    'polkit: Power menu functionality.'
    'lsb-release: log distro information in crashlog'
  )
  install="kodi.install"
  provides=('xbmc' 'kodi')
  conflicts=('xbmc' 'kodi')
  replaces=('xbmc')

  cd xbmc-${_commit}
  # Running make install
 make DESTDIR="$pkgdir" install

  # Licenses
 install -dm755 ${pkgdir}${_prefix}/share/licenses/${pkgname}
 for licensef in LICENSE.GPL copying.txt; do
   mv ${pkgdir}${_prefix}/share/doc/kodi/${licensef} \
      ${pkgdir}${_prefix}/share/licenses/${pkgname}
 done

install -Dm0644 $srcdir/kodi_permissions.conf $pkgdir/etc/tmpfiles.d/kodi_permissions.conf
install -Dm0644 $srcdir/kodi.service $pkgdir/usr/lib/systemd/system/kodi.service
install -Dm0644 $srcdir/polkit.rules $pkgdir/etc/polkit-1/rules.d/10-kodi.rules
install -Dm0644 $srcdir/10-odroid.rules $pkgdir/etc/udev/rules.d/10-odroid.rules
}

package_kodi-c2-eventclients-fb() {
  pkgdesc="Kodi Event Clients (ODROID-C2)"
  provides=('kodi-eventclients')
  conflicts=('kodi-eventclients')
  depends=('cwiid')

  cd xbmc-${_commit}

  make DESTDIR="$pkgdir" eventclients WII_EXTRA_OPTS=-DCWIID_OLD

  install -dm755 "$pkgdir/usr/lib/python2.7/$pkgbase"
  mv "$pkgdir/kodi"/* "$pkgdir/usr/lib/python2.7/$pkgbase"
  rmdir "$pkgdir/kodi"
}
