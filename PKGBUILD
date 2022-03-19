# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-minimal
pkgver=0.23.6
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over pipewire through socket connection as user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(flac fmt icu libmpdclient liburing pipewire systemd-libs zlib)
makedepends=(boost meson python-sphinx systemd)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=(1595fcc53a67f1a68b0c0516697d242da53b91626e37bc2f49095add78eb497a52c67c961a421f20b40f3c57a571557a76559a212838de2a3ec4aec6c7a3288d SKIP)
b2sums=(5ccb4a7c06c4317e3285846a261438bdcc10db5eaf71fcba969bcae8321ca50bb26fe9317e23e38eca1c4a8785015596064d5bfc692bf66f8007d0d2a1b71cbb SKIP)
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
