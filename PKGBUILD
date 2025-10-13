# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-server-minimal
pkgver=0.24.5
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over alsa as server running under mpd user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(
  BSD-2-Clause
  GPL-2.0-or-later
  ISC
  LGPL-2.1-only
)
depends=(
  alsa-lib
  flac
  fmt
  icu
  libmpdclient
  liburing
  systemd-libs
  zlib
)
makedepends=(
  git
  meson
  python-sphinx
  systemd
)
checkdepends=(gtest)
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
backup=(etc/${_pkgname}.conf)
source=($_pkgname::git+https://github.com/MusicPlayerDaemon/MPD?signed#tag=v$pkgver
        $_pkgname.conf
        $_pkgname.sysusers
        $_pkgname.tmpfiles
        $_pkgname.service.override)
sha512sums=(373e41c0b1f093be0e079480b38296df4c6ee1bd2721ead08f1311538b115fff8eec99c406d98e9a92ed090f51bc2baeda0022603276e6ac9c8a7404976f0469
            25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1
            16270936135ed71c733bb0b0d1b513c0931e5f81815522bcdf3827b7781f4e99bcf003d73132fea4871bd915887e970c30144574abebdf1ebec1d6ba2ee60ddd
            db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d
            c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c)
b2sums=(2ca7daf77960e24dc9f89380f36efe170bad0df17cd90b5bb3c0b7f24b6d68ad8b07f0fb0a6f73609bf98d5494a653c908793861a1d8b0cf5b2b527d6addd23b
        0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf
        135630d85a5f1a89b98b209aa4e71adb2b48efd4902bfa709c00bb59bca1716c3b70fee8220d4d06ef5ccdbdc5c959f30003a4bdc1c5211b36a2c4a00e1d694c
        d7b587c25dd5830c27af475a8fdd8102139d7c8fdd6f04fe23b36be030e4411582e289f575c299255ff8183096f7d47247327276f9a24641cbd032d9675b837a
        753664445d7d5cc0b36f51ac66549beea403b9731cbcb81b0a782974a0a73d90559ba93e6afcaa470b6f2f5a844c09ef695bdf3b1e6dfee97aa080f41b7fe513)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

build() {
  local _meson_options=(
    -D documentation=disabled
    -D html_manual=false
    -D manpages=false
    -D test=true
    -D libfuzzer=false
    -D syslog=disabled
    -D inotify=true
    -D io_uring=enabled
    -D daemon=true
    -D systemd=enabled
    -D tcp=true
    -D ipv6=enabled
    -D local_socket=false
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
    -D alsa=enabled
    -D ao=disabled
    -D fifo=true
    -D httpd=false
    -D jack=disabled
    -D openal=disabled
    -D oss=disabled
    -D pipe=false
    -D pipewire=disabled
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
  install -vDm644 $_pkgname.service.override "$pkgdir/usr/lib/systemd/system/mpd.service.d/00-arch.conf"
  install -vDm644 $_pkgname.conf -t "$pkgdir"/etc/
  install -vDm644 $_pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 $_pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

  # Remove user service
  rm -rf "${pkgdir}"/usr/lib/systemd/user/
}

# vim:set sw=2 sts-=1 et:
