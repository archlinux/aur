# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-minimal
pkgver=0.23.15
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over pipewire through socket connection as user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(flac fmt icu libmpdclient liburing libpipewire systemd-libs zlib)
makedepends=(boost meson python-sphinx systemd)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=(12329dbd0c1994c1bd95b88ce2a62a4c1d691b655e9e4fac7e9ef7066d0be3422b26fad3ea6ca144ba9b21add0a7c492c4f74fd2b68a1539bff2e0d2714db709 SKIP)
b2sums=(78036078b850afab900b5d50e44ce83cbbf900369f5028d4177fdbfc4128dd3c35c59a773528a1fcfcc0179d0e579566b827fe87ef780a88082dc3b7f70cd5e7 SKIP)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

build() {
  local _meson_options=(
    -D documentation=enabled
    -D html_manual=false
    -D manpages=true
    -D test=false
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
    -D soundcloud=disabled
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
    -D pcre=disabled
    -D sqlite=disabled
    -D yajl=disabled
    -D zlib=enabled
    -D zeroconf=disabled
    -D b_ndebug=true
  )

  arch-meson "${_meson_options[@]}" build ${_pkgname}-${pkgver}
  ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
    install -vDm644 ${_pkgname}-${pkgver}/doc/mpdconf.example -t "${pkgdir}"/usr/share/doc/mpd/
    # Remove system services and clean user one
    rm -vrf "${pkgdir}"/usr/lib/systemd/system/
    sed -e 's/After=network.target /After=/g' -e 's/AF_INET AF_INET6 AF_UNIX AF_NETLINK/AF_UNIX/g' -i "${pkgdir}"/usr/lib/systemd/user/mpd.service
}
