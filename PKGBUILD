# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libpulse-nosystemd
pkgdesc="Client library for PulseAudio"
pkgver=13.0
pkgrel=2
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(LGPL)
depends=(dbus libasyncns libcap libxtst libsm libsndfile)
makedepends=(attr rtkit speexdsp tdb orc gtk3 libsoxr meson xmltoman)
provides=("libpulse=${pkgver}" libpulse{,-simple,-mainloop-glib}.so)
conflicts=('libpulse')
replaces=('libpulse')
backup=(etc/pulse/client.conf)
_commit=200618b32f0964a479d69c9b6e5073e6931c370a  # tags/v13.0^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson --auto-features auto pulseaudio build \
    -D gcov=false \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D systemd=disabled \
    -D tests=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir"/temp meson install -C build

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
