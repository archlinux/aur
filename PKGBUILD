# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libpulse-nosystemd
pkgdesc="Client library for PulseAudio"
pkgver=14.2
pkgrel=2
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(LGPL)
depends=(dbus libasyncns libcap libxcb libsm libsndfile)
makedepends=(attr rtkit speexdsp tdb orc gtk3 libsoxr meson xmltoman)
provides=("libpulse=${pkgver}" libpulse{,-simple,-mainloop-glib}.so)
conflicts=('libpulse')
replaces=('libpulse')
backup=(etc/pulse/client.conf)
_commit=6a487c5244563f49a025088de3510c80824fc99e  # tags/v14.2^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#commit=$_commit")
sha256sums=('SKIP')

_pick() {
  local f
  for f; do
    mkdir -p "$pkgdir"/"$(dirname "$f")"
    mv "$f" "$pkgdir"/"$f"
  done
}

build() {
  arch-meson --auto-features auto pulseaudio build \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D stream-restore-clear-old-devices=true \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D systemd=disabled \
    -D tests=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir"/temp meson install -C build

  cd "$pkgdir"/temp

  _pick etc/pulse/client.conf
  _pick usr/bin/pa{cat,ctl,dsp,mon,play,rec,record}
  _pick usr/lib/libpulse{,-simple,-mainloop-glib}.so*
  _pick usr/lib/{cmake,pkgconfig}
  _pick usr/lib/pulseaudio/libpulse{dsp,common-*}.so
  _pick usr/include
  _pick usr/share/man/man1/pa{cat,ctl,dsp,mon,play,rec,record}.1
  _pick usr/share/man/man5/pulse-client.conf.5
  _pick usr/share/bash-completion/completions/pa{cat,ctl,dsp,play,rec,record}
  _pick usr/share/bash-completion/completions/pulseaudio
  _pick usr/share/vala
  _pick usr/share/zsh

  cd ..
  rm -rf temp
}
