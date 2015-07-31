# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

# Note: The patch is based on https://github.com/mikkeloscar/pulseaudio-raop2
# which is basically https://github.com/hfujita/pulseaudio-raop2 rebased to
# pulseaudio v6.0

_pkgbase=pulseaudio
pkgbase=$_pkgbase-raop2
pkgname=(pulseaudio-raop2 libpulse-raop2 pulseaudio-{gconf,zeroconf,lirc,xen,jack,bluetooth,equalizer}-raop2)
pkgdesc="A featureful, general-purpose sound server with AirPlay/Airtunes/RAOP v2 patchset"
pkgver=6.0
pkgrel=1
arch=(i686 x86_64)
url="http://hfujita.github.io/pulseaudio-raop2/"
license=(LGPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile libtool rtkit
             speexdsp tdb systemd dbus avahi bluez bluez-libs gconf intltool jack2-dbus sbc
             lirc openssl xenstore fftw orc json-c gtk3 webrtc-audio-processing
             check)
options=(!emptydirs)
source=("$pkgbase-$pkgver::git+http://anongit.freedesktop.org/git/pulseaudio/pulseaudio.git#commit=v$pkgver"
        raopv2.patch)
sha256sums=('SKIP'
            'a616505d2167df87f8bdaa6f0c674576fee14ac5e04a6d7e92e33ba0075b9127')

prepare() {
  cd $pkgbase-$pkgver

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
    --disable-default-build-tests

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package_pulseaudio-raop2() {
  depends=("libpulse-raop2=$pkgver-$pkgrel" rtkit libltdl speexdsp tdb orc
           webrtc-audio-processing sbc)
  optdepends=('pulseaudio-alsa: ALSA configuration (recommended)')
  provides=(pulseaudio)
  conflicts=(pulseaudio)
  backup=(etc/pulse/{daemon.conf,default.pa,system.pa})
  install=pulseaudio.install

  cd $pkgbase-$pkgver
  make -j1 DESTDIR="$pkgdir" install \
    bashcompletiondir=/usr/share/bash-completion/completions

  # Speed up pulseaudio shutdown so that it exits immediately with
  # the last user session (module-systemd-login keeps it alive)
  sed -e '/exit-idle-time/iexit-idle-time=0' \
      -i "$pkgdir/etc/pulse/daemon.conf"

  # Disable cork-request module, can result in e.g. media players unpausing
  # when there's a Skype call incoming
  sed -e 's|/usr/bin/pactl load-module module-x11-cork-request|#&|' \
      -i "$pkgdir/usr/bin/start-pulseaudio-x11"

  rm "$pkgdir/etc/dbus-1/system.d/pulseaudio-system.conf"

### Split libpulse

  mkdir -p "$srcdir"/libpulse/{etc/pulse,usr/{bin,lib/pulseaudio,share/man/man{1,5}}}

  mv {"$pkgdir","$srcdir/libpulse"}/etc/pulse/client.conf

  mv "$pkgdir"/usr/bin/pa{cat,ctl,dsp,mon,play,rec,record} \
     "$srcdir/libpulse/usr/bin"

  mv "$pkgdir"/usr/lib/libpulse{,-simple,-mainloop-glib}.so* \
     "$srcdir/libpulse/usr/lib"

  mv "$pkgdir"/usr/lib/pulseaudio/libpulsedsp.so \
     "$pkgdir"/usr/lib/pulseaudio/libpulsecommon-*.so \
     "$srcdir/libpulse/usr/lib/pulseaudio"

  mv {"$pkgdir","$srcdir/libpulse"}/usr/lib/cmake
  mv {"$pkgdir","$srcdir/libpulse"}/usr/lib/pkgconfig

  mv {"$pkgdir","$srcdir/libpulse"}/usr/include

  mv "$pkgdir"/usr/share/man/man1/pa{cat,ctl,dsp,play}.1 \
     "$srcdir/libpulse/usr/share/man/man1"

  mv {"$pkgdir","$srcdir/libpulse"}/usr/share/man/man5/pulse-client.conf.5
  mv {"$pkgdir","$srcdir/libpulse"}/usr/share/vala

### Split modules

  mkdir -p "$srcdir"/{gconf,zeroconf,lirc,xen,jack,bluetooth,equalizer}/usr/lib/pulse-$pkgver/modules \
           "$srcdir"/{gconf/usr/lib/pulse,equalizer/usr/bin}

  mv {"$pkgdir","$srcdir/gconf"}/usr/lib/pulse-$pkgver/modules/module-gconf.so
  mv {"$pkgdir","$srcdir/gconf"}/usr/lib/pulse/gconf-helper

  mv "$pkgdir"/usr/lib/pulse-$pkgver/modules/{libavahi-wrap,module-{zeroconf-{publish,discover},raop-discover}}.so \
     "$srcdir/zeroconf/usr/lib/pulse-$pkgver/modules"

  mv {"$pkgdir","$srcdir/lirc"}/usr/lib/pulse-$pkgver/modules/module-lirc.so

  mv {"$pkgdir","$srcdir/xen"}/usr/lib/pulse-$pkgver/modules/module-xenpv-sink.so

  mv "$pkgdir"/usr/lib/pulse-$pkgver/modules/module-jack{-sink,-source,dbus-detect}.so \
     "$srcdir/jack/usr/lib/pulse-$pkgver/modules"

  mv "$pkgdir"/usr/lib/pulse-$pkgver/modules/{libbluez5-util,module-{bluetooth-{discover,policy},bluez5-{discover,device}}}.so \
     "$srcdir/bluetooth/usr/lib/pulse-$pkgver/modules"

  mv {"$pkgdir","$srcdir/equalizer"}/usr/lib/pulse-$pkgver/modules/module-equalizer-sink.so
  mv {"$pkgdir","$srcdir/equalizer"}/usr/bin/qpaeq
}

package_libpulse-raop2() {
  pkgdesc="$pkgdesc (client library)"
  depends=(dbus libasyncns libcap libxtst libsm libsndfile json-c systemd)
  provides=(libpulse)
  conflicts=(libpulse)
  backup=(etc/pulse/client.conf)

  mv "$srcdir"/libpulse/* "$pkgdir"
}

package_pulseaudio-gconf-raop2(){
  pkgdesc="GConf support for PulseAudio"
  depends=(pulseaudio-raop2 gconf)
  provides=(pulseaudio-gconf)
  conflicts=(pulseaudio-gconf)

  mv "$srcdir"/gconf/* "$pkgdir"
}

package_pulseaudio-zeroconf-raop2(){
  pkgdesc="Zeroconf support for PulseAudio"
  depends=(pulseaudio-raop2 avahi openssl)
  provides=(pulseaudio-zeroconf)
  conflicts=(pulseaudio-zeroconf)

  mv "$srcdir"/zeroconf/* "$pkgdir"
}

package_pulseaudio-lirc-raop2(){
  pkgdesc="IR (lirc) support for PulseAudio"
  depends=(pulseaudio-raop2 lirc)
  provides=(pulseaudio-lirc)
  conflicts=(pulseaudio-lirc)

  mv "$srcdir"/lirc/* "$pkgdir"
}

package_pulseaudio-xen-raop2(){
  pkgdesc="Xen support for PulseAudio"
  depends=(pulseaudio-raop2 xenstore)
  provides=(pulseaudio-xen)
  conflicts=(pulseaudio-xen)
  license=(GPL2)

  mv "$srcdir"/xen/* "$pkgdir"
}

package_pulseaudio-jack-raop2(){
  pkgdesc="Jack support for PulseAudio"
  depends=(pulseaudio-raop2 jack2)
  provides=(pulseaudio-jack)
  conflicts=(pulseaudio-jack)

  mv "$srcdir"/jack/* "$pkgdir"
}

package_pulseaudio-bluetooth-raop2(){
  pkgdesc="Bluetooth support for PulseAudio"
  depends=(pulseaudio-raop2 bluez bluez-libs)
  provides=(pulseaudio-bluetooth)
  conflicts=(pulseaudio-bluetooth)

  mv "$srcdir"/bluetooth/* "$pkgdir"
}

package_pulseaudio-equalizer-raop2(){
  pkgdesc="Equalizer for PulseAudio"
  depends=(pulseaudio-raop2 python-pyqt4 fftw)
  provides=(pulseaudio-equalizer)
  conflicts=(pulseaudio-equalizer)
  license=(AGPL3)

  mv "$srcdir"/equalizer/* "$pkgdir"
}
