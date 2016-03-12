# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

# Note: The patch is based on:
# https://github.com/hfujita/pulseaudio-raop2/tree/hf/raop2-v4-v8.0

_pkgbase=pulseaudio
pkgbase=$_pkgbase-raop2
pkgname=(pulseaudio-raop2 libpulse-raop2 pulseaudio-{gconf,zeroconf,lirc,xen,jack,bluetooth,equalizer}-raop2)
pkgdesc="A featureful, general-purpose sound server with AirPlay/Airtunes/RAOP v2 patchset"
pkgver=8.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://hfujita.github.io/pulseaudio-raop2/"
license=(LGPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile libtool rtkit libsoxr
             speexdsp tdb systemd dbus avahi bluez bluez-libs gconf intltool jack2-dbus sbc
             lirc openssl xenstore fftw orc json-c gtk3 webrtc-audio-processing
             check)
options=(!emptydirs)
source=("$pkgbase-$pkgver::git+http://anongit.freedesktop.org/git/pulseaudio/pulseaudio.git#commit=v$pkgver"
        0001-Revert-module-switch-on-port-available-Route-to-pref.patch
        0002-Revert-module-alsa-card-Report-available-ports-befor.patch
        padsp-lib32.patch
        raopv2.patch)
sha256sums=('SKIP'
            '4db15e8a696809acafc8a0a4e6c7cc64d34870e2566012618e9953ab65629174'
            '52fbf7c69132d852e9f6dfd3c16fde78c6931333d2ca12bb1d97091e657da725'
            '572ff890dbed1e4a5654b7ed4ea3b3f2a91c871fb2224799bc789c317bb49964'
            '72b377c6f179ae461415891c1fbb894d2baa954f60480c6867e8cee8686b48b9')

prepare() {
  cd $pkgbase-$pkgver

  # https://bugs.freedesktop.org/show_bug.cgi?id=93946
  patch -Np1 -i ../0001-Revert-module-switch-on-port-available-Route-to-pref.patch

  # https://bugs.archlinux.org/task/48306
  patch -Np1 -i ../0002-Revert-module-alsa-card-Report-available-ports-befor.patch

  patch -p1 < ../raopv2.patch

  ./autogen.sh
}

build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-database=tdb \
    --disable-tcpwrap \
    --disable-bluez4 \
    --disable-samplerate \
    --disable-rpath \
    --disable-default-build-tests \
    DATADIRNAME=share

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package_pulseaudio-raop2() {
  depends=("libpulse-raop2=$pkgver-$pkgrel" rtkit libltdl speexdsp tdb orc
           webrtc-audio-processing sbc libsoxr)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)')
  provides=("pulseaudio=$pkgver-$pkgrel")
  conflicts=(pulseaudio)
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install

  cd $pkgbase-$pkgver
  make -j1 DESTDIR="$pkgdir" install \
    bashcompletiondir=/usr/share/bash-completion/completions

  cd "$pkgdir"
  patch -Np1 -i "$srcdir/padsp-lib32.patch"

  # Assumes that any volume adjustment is intended by the user, who can control
  # each app's volume. Misbehaving clients can trigger earsplitting volume
  # jumps. App volumes can diverge wildly and cause apps without their own
  # volume control to fall below sink volume; a sink-only volume control will
  # suddenly be unable to make such an app loud enough.
  sed -e '/flat-volumes/iflat-volumes = no' \
      -i etc/pulse/daemon.conf

  # Superseded by socket activation
  sed -e '/autospawn/iautospawn = no' \
      -i etc/pulse/client.conf

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i usr/bin/start-pulseaudio-x11

  rm etc/dbus-1/system.d/pulseaudio-system.conf

### Split libpulse

  mkdir -p "$srcdir"/libpulse/{etc/pulse,usr/{bin,lib/pulseaudio,share/man/man{1,5}}}

  mv etc/pulse/client.conf \
     "$srcdir/libpulse/etc/pulse"

  mv usr/bin/pa{cat,ctl,dsp,mon,play,rec,record} \
     "$srcdir/libpulse/usr/bin"

  mv usr/lib/libpulse{,-simple,-mainloop-glib}.so* \
     usr/lib/{cmake,pkgconfig} \
     "$srcdir/libpulse/usr/lib"

  mv usr/lib/pulseaudio/libpulse{dsp,common-*}.so \
     "$srcdir/libpulse/usr/lib/pulseaudio"

  mv usr/include \
     "$srcdir/libpulse/usr"

  mv usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1 \
     "$srcdir/libpulse/usr/share/man/man1"

  mv usr/share/man/man5/pulse-client.conf.5 \
     "$srcdir/libpulse/usr/share/man/man5"

  mv usr/share/vala \
     "$srcdir/libpulse/usr/share"

### Split modules

  mkdir -p "$srcdir"/{gconf,zeroconf,lirc,xen,jack,bluetooth,equalizer}/usr/lib/pulse-$pkgver/modules \
           "$srcdir"/{gconf/usr/lib/pulse,equalizer/usr/bin}

  mv usr/lib/pulse-$pkgver/modules/module-gconf.so \
     "$srcdir/gconf/usr/lib/pulse-$pkgver/modules"
  mv usr/lib/pulse/gconf-helper \
     "$srcdir/gconf/usr/lib/pulse"

  mv usr/lib/pulse-$pkgver/modules/{libavahi-wrap,module-{zeroconf-{publish,discover},raop-discover}}.so \
     "$srcdir/zeroconf/usr/lib/pulse-$pkgver/modules"

  mv usr/lib/pulse-$pkgver/modules/module-lirc.so \
     "$srcdir/lirc/usr/lib/pulse-$pkgver/modules"

  mv usr/lib/pulse-$pkgver/modules/module-xenpv-sink.so \
     "$srcdir/xen/usr/lib/pulse-$pkgver/modules"

  mv usr/lib/pulse-$pkgver/modules/module-jack{-sink,-source,dbus-detect}.so \
     "$srcdir/jack/usr/lib/pulse-$pkgver/modules"

  mv usr/lib/pulse-$pkgver/modules/{libbluez5-util,module-{bluetooth-{discover,policy},bluez5-{discover,device}}}.so \
     "$srcdir/bluetooth/usr/lib/pulse-$pkgver/modules"

  mv usr/lib/pulse-$pkgver/modules/module-equalizer-sink.so \
     "$srcdir/equalizer/usr/lib/pulse-$pkgver/modules"
  mv usr/bin/qpaeq \
     "$srcdir/equalizer/usr/bin"
}

package_libpulse-raop2() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxtst libsm libsndfile json-c systemd)
  provides=("libpulse=$pkgver-$pkgrel")
  conflicts=(libpulse)
  backup=(etc/pulse/client.conf)

  mv "$srcdir"/libpulse/* "$pkgdir"
}

package_pulseaudio-gconf-raop2(){
  pkgdesc="GConf support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" gconf)
  provides=("pulseaudio-gconf=$pkgver-$pkgrel")
  conflicts=(pulseaudio-gconf)

  mv "$srcdir"/gconf/* "$pkgdir"
}

package_pulseaudio-zeroconf-raop2(){
  pkgdesc="Zeroconf support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" avahi openssl)
  provides=("pulseaudio-zeroconf=$pkgver-$pkgrel")
  conflicts=(pulseaudio-zeroconf)

  mv "$srcdir"/zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-raop2(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" lirc)
  provides=("pulseaudio-lirc=$pkgver-$pkgrel")
  conflicts=(pulseaudio-lirc)

  mv "$srcdir"/lirc/* "$pkgdir"
}

package_pulseaudio-xen-raop2(){
  pkgdesc="Xen support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" xenstore)
  provides=("pulseaudio-xen=$pkgver-$pkgrel")
  conflicts=(pulseaudio-xen)
  license=(GPL2)

  mv "$srcdir"/xen/* "$pkgdir"
}

package_pulseaudio-jack-raop2(){
  pkgdesc="Jack support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" jack2)
  provides=("pulseaudio-jack=$pkgver-$pkgrel")
  conflicts=(pulseaudio-jack)

  mv "$srcdir"/jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-raop2(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" bluez bluez-libs)
  provides=("pulseaudio-bluetooth=$pkgver-$pkgrel")
  conflicts=(pulseaudio-bluetooth)

  mv "$srcdir"/bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-raop2(){
  pkgdesc="Equalizer for PulseAudio"
  depends=("pulseaudio-raop2=$pkgver-$pkgrel" python-pyqt4 fftw)
  provides=("pulseaudio-equalizer=$pkgver-$pkgrel")
  conflicts=(pulseaudio-equalizer)
  license=(AGPL3)

  mv "$srcdir"/equalizer/* "$pkgdir"
}
