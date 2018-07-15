# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libpulse-nosystemd
pkgdesc="Client library for PulseAudio"
pkgver=12.1
pkgrel=1
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(LGPL)
depends=(dbus libasyncns libcap libxtst libsm libsndfile)
makedepends=(attr libtool rtkit speexdsp tdb intltool orc gtk3 check libsoxr)
provides=("libpulse=${pkgver}")
conflicts=('libpulse')
replaces=('libpulse')
backup=(etc/pulse/client.conf)
options=(!emptydirs)
_commit=6a6f1c6f6871b5f1f42d1fb9387cfde5ae4008f4  # tags/v12.1^0
source=("git+https://anongit.freedesktop.org/git/pulseaudio/pulseaudio#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd pulseaudio
  NOCONFIGURE=1 ./bootstrap.sh
}

build() {
  cd pulseaudio

  DATADIRNAME=share ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-udev-rules-dir=/usr/lib/udev/rules.d \
    --with-pulsedsp-location='/usr/\\$$LIB/pulseaudio' \
    --with-database=tdb \
    --disable-tcpwrap \
    --disable-bluez4 \
    --disable-samplerate \
    --disable-rpath \
    --disable-default-build-tests \
    --disable-systemd-daemon \
    --disable-systemd-login \
    --disable-systemd-journal

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd pulseaudio
  make -j1 DESTDIR="$pkgdir"/temp install

  cd "$pkgdir"

  # Extract libpulse
  mkdir -p {etc/pulse,usr/{bin,lib/pulseaudio,share/man/man{1,5}}}

  mv {temp/,}etc/pulse/client.conf

  mv temp/usr/bin/pa{cat,ctl,dsp,mon,play,rec,record} \
     usr/bin

  mv temp/usr/lib/libpulse{,-simple,-mainloop-glib}.so* \
     temp/usr/lib/{cmake,pkgconfig} \
     usr/lib

  mv temp/usr/lib/pulseaudio/libpulsedsp.so \
     temp/usr/lib/pulseaudio/libpulsecommon-*.so \
     usr/lib/pulseaudio

  mv {temp/,}usr/include

  mv temp/usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1 \
     usr/share/man/man1

  mv {temp/,}usr/share/man/man5/pulse-client.conf.5
  mv {temp/,}usr/share/vala

  rm -rf temp
}
