# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libpulse-nosystemd
_pkgbase=pulseaudio
pkgdesc="Client library for PulseAudio"
pkgver=5.0
pkgrel=1
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/PulseAudio"
license=(LGPL)
depends=(dbus libasyncns libcap libxtst libsm libsndfile json-c)
makedepends=(libasyncns libcap attr libxtst libsm libsamplerate libtool rtkit
             speex tdb dbus avahi bluez bluez-libs gconf intltool jack2-dbus sbc
             lirc-utils openssl xenstore fftw orc json-c gtk3 webrtc-audio-processing
             check git)
optdepends=('alsa-plugins: ALSA support'
            'avahi: zeroconf support')
provides=("libpulse=${pkgver}")
conflicts=('libpulse')
replaces=('libpulse')
backup=(etc/pulse/client.conf)
options=(!emptydirs)
source=(http://freedesktop.org/software/$_pkgbase/releases/$_pkgbase-$pkgver.tar.xz)
sha256sums=('99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939')

prepare() {
  cd $_pkgbase-$pkgver
}

build() {
  cd $_pkgbase-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-database=tdb \
    --disable-tcpwrap \
    --disable-bluez4 \
    --disable-rpath \
    --disable-default-build-tests \
    --disable-systemd

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgbase-$pkgver
  make -j1 DESTDIR="$pkgdir"/temp install

  mkdir -p "$pkgdir"/{etc/pulse,usr/{bin,lib/pulseaudio,share/man/man{1,5}}}

  mv {"$pkgdir"/temp,"$pkgdir"}/etc/pulse/client.conf

  mv "$pkgdir"/temp/usr/bin/pa{cat,ctl,dsp,mon,play,rec,record} \
     "$pkgdir/usr/bin"

  mv "$pkgdir"/temp/usr/lib/libpulse{,-simple,-mainloop-glib}.so* \
     "$pkgdir/usr/lib"

  mv "$pkgdir"/temp/usr/lib/pulseaudio/libpulsedsp.so \
     "$pkgdir"/temp/usr/lib/pulseaudio/libpulsecommon-*.so \
     "$pkgdir/usr/lib/pulseaudio"

  mv {"$pkgdir"/temp,"$pkgdir"}/usr/lib/cmake
  mv {"$pkgdir"/temp,"$pkgdir"}/usr/lib/pkgconfig

  mv {"$pkgdir"/temp,"$pkgdir"}/usr/include

  mv "$pkgdir"/temp/usr/share/man/man1/pa{cat,ctl,dsp,play}.1 \
     "$pkgdir/usr/share/man/man1"

  mv {"$pkgdir"/temp,"$pkgdir"}/usr/share/man/man5/pulse-client.conf.5
  mv {"$pkgdir"/temp,"$pkgdir"}/usr/share/vala

  rm -rf "$pkgdir"/temp
}
