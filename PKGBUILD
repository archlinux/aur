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

pkgbase=kodi-c1-fb
pkgname=('kodi-c1-fb' 'kodi-c1-eventclients-fb')
_commit='d6418111ee8baa287ab27658b8037d6ef9a4ce59'
pkgver=17.0.20151205
pkgrel=1
_codename=unknown
arch=('armv7h')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
    'afpfs-ng' 'bluez-libs' 'boost' 'cmake' 'curl' 'cwiid' 'doxygen' 'gcc<5.2.0' 'gcc-libs<5.2.0' 'git' 'glew' 
    'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass' 
    'libbluray' 'libcdio' 'odroid-c1-libgl-fb' 'libmariadbclient' 'libmicrohttpd' 
    'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva' 
    'libxrandr' 'libxslt' 'lzo' 'nasm' 'nss-mdns' 'python2-pillow' 'aml-libs-c1' 
    'python2-pybluez' 'python2-simplejson' 'rtmpdump' 'sdl2' 'sdl_image' 
    'shairplay' 'smbclient' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower' 'yajl' 
    'zip' 'dcadec' 'libcrossguid-git'
)
source=("https://github.com/xbmc/xbmc/archive/${_commit}.tar.gz"
        "git+https://github.com/mdrjr/c1_mali_libs.git"
        'kodi.service'
        'polkit.rules'
        'kodi_permissions.conf'
        '20-quiet-printk.conf')

sha256sums=('2e702694de69005feb00b776e2339fd9ab7fd65f3e21147699681fb26f18b0a8'
            'SKIP'
            '79aa17b475967d97b6c72c850b638705d6feb6d995844476b65d68d33d161114'
            'c68ed2bd377f80b606b8815d78239b9132b479eafc1d19797cee5824debe1800'
            'ecc413a1cfd4622b79de16010c9d8d269f774ad89d2e547553e36fbd236e8593'
            'e3cb9a3a3d814295bdfac6ac325b5560e8ba0a2fb00f11d6dcc9afde49f30990')

prepare() {
  cd xbmc-${_commit}

  # Use Python 2 instead of Python 3
  find -type f -name *.py -exec sed 's|^#!.*python$|#!/usr/bin/python2|' -i "{}" +
  sed 's|^#!.*python$|#!/usr/bin/python2|' -i tools/depends/native/rpl-native/rpl
  sed 's/python/python2/' -i tools/Linux/kodi.sh.in
}

build() {
  cd xbmc-${_commit}
  MALI_INCLUDE=$srcdir/c1_mali_libs/fbdev/mali_headers
  CFLAGS=`echo "$CFLAGS -I$MALI_INCLUDE -ffast-math" | sed -e 's/vfpv3-d16/neon-fp16/'` && CXXFLAGS="$CFLAGS"
  LDFLAGS+=" -L/usr/lib/mali-egl -L/usr/lib/aml_libs"

  # Bootstrapping
  MAKEFLAGS=-j8 ./bootstrap

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
    --disable-pulse

 # Now (finally) build
#  make
make -k > build.log 2>&1
}

package_kodi-c1-fb() {
  pkgdesc="A software media player and entertainment hub for digital media (ODROID-C1 Framebuffer)"

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
    'yajl' 'odroid-c1-libgl-fb' 'aml-libs-c1'
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

install -Dm0644 $srcdir/20-quiet-printk.conf $pkgdir/etc/sysctl.d/20-quiet-printk.conf
install -Dm0644 $srcdir/kodi_permissions.conf $pkgdir/etc/tmpfiles.d/kodi_permissions.conf
install -Dm0644 $srcdir/kodi.service $pkgdir/usr/lib/systemd/system/kodi.service
install -Dm0644 $srcdir/polkit.rules $pkgdir/etc/polkit-1/rules.d/10-kodi.rules
}

package_kodi-c1-eventclients-fb() {
  pkgdesc="Kodi Event Clients (ODROID-C1)"
  provides=('kodi-eventclients')
  conflicts=('kodi-eventclients')
  depends=('cwiid')

  cd xbmc-${_commit}

  make DESTDIR="$pkgdir" eventclients WII_EXTRA_OPTS=-DCWIID_OLD

  install -dm755 "$pkgdir/usr/lib/python2.7/$pkgbase"
  mv "$pkgdir/kodi"/* "$pkgdir/usr/lib/python2.7/$pkgbase"
  rmdir "$pkgdir/kodi"
}
