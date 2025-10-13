# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-minimal
pkgver=0.24.3
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over pipewire through socket connection as user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(
  BSD-2-Clause
  GPL-2.0-or-later
  ISC
  LGPL-2.1-only
)
depends=(flac fmt icu libmpdclient libpipewire liburing systemd-libs zlib)
makedepends=(git meson python-sphinx systemd)
checkdepends=(gtest)
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
source=($_pkgname::git+https://github.com/MusicPlayerDaemon/MPD?signed#tag=v$pkgver)
sha512sums=(896e637cd662ee8f9c58a724d41546cf6659b2f7edc67a3380d3bd01ea59085c4032b4819f6f974285931fe1282be26c597ef3d83007beffe3b5dd5de1ce845e)
b2sums=(1475144c4bc141894f1984500508594fa9f3c8e6196a0328e76649b0e91ddc9e1b7ee5f82f2b5fdda29b17bfc6c8bb4ea870d1c601b219aa954923b560df18f0)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

build() {
  local _meson_options=(
    -D documentation=enabled
    -D html_manual=false
    -D manpages=true
    -D test=true
    -D libfuzzer=false
    -D syslog=disabled
    -D inotify=false
    -D io_uring=enabled
    -D daemon=true
    -D systemd=enabled
    -D tcp=false
    -D ipv6=disabled
    -D local_socket=true
    -D dsd=false
    -D database=true
    -D upnp=disabled
    -D libmpdclient=enabled
    -D neighbor=false
    -D udisks=disabled
    -D webdav=disabled
    -D cue=false
    -D cdio_paranoia=disabled
    -D curl=disabled
    -D mms=disabled
    -D nfs=disabled
    -D smbclient=disabled
    -D qobuz=disabled
    -D bzip2=disabled
    -D iso9660=disabled
    -D zzip=disabled
    -D id3tag=disabled
    -D chromaprint=disabled
    -D adplug=disabled
    -D audiofile=disabled
    -D faad=disabled
    -D ffmpeg=disabled
    -D flac=enabled
    -D fluidsynth=disabled
    -D gme=disabled
    -D mad=disabled
    -D mikmod=disabled
    -D modplug=disabled
    -D openmpt=disabled
    -D mpcdec=disabled
    -D mpg123=disabled
    -D opus=disabled
    -D sidplay=disabled
    -D sndfile=disabled
    -D tremor=disabled
    -D vorbis=disabled
    -D wavpack=disabled
    -D wildmidi=disabled
    -D vorbisenc=disabled
    -D lame=disabled
    -D twolame=disabled
    -D shine=disabled
    -D wave_encoder=false
    -D libsamplerate=disabled
    -D soxr=disabled
    -D alsa=disabled
    -D ao=disabled
    -D fifo=true
    -D httpd=false
    -D jack=disabled
    -D openal=disabled
    -D oss=disabled
    -D pipe=false
    -D pipewire=enabled
    -D pulse=disabled
    -D recorder=false
    -D shout=disabled
    -D snapcast=false
    -D sndio=disabled
    -D solaris_output=disabled
    -D dbus=disabled
    -D expat=disabled
    -D icu=enabled
    -D iconv=disabled
    -D nlohmann_json=disabled
    -D pcre=disabled
    -D sqlite=disabled
    -D zlib=enabled
    -D zeroconf=disabled
    -D b_ndebug=true
  )

  arch-meson $_pkgname build "${_meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vDm644 $_pkgname/doc/mpdconf.example -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $_pkgname/LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # Remove system services and clean user one
  rm -vrf "$pkgdir"/usr/lib/systemd/system/
  sed -e 's/After=network.target /After=/g' -e 's/AF_INET AF_INET6 AF_UNIX AF_NETLINK/AF_UNIX/g' -i "$pkgdir"/usr/lib/systemd/user/mpd.service
}
