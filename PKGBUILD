# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-server-minimal
pkgver=0.23.6
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback over alsa as server running under mpd user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(alsa-lib flac fmt icu libmpdclient liburing systemd-libs zlib)
makedepends=(boost meson systemd)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
backup=(etc/${_pkgname}.conf)
source=("${url}/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        ${_pkgname}.conf
        ${_pkgname}.sysusers
        ${_pkgname}.tmpfiles
        ${_pkgname}.service.override)
sha512sums=(1595fcc53a67f1a68b0c0516697d242da53b91626e37bc2f49095add78eb497a52c67c961a421f20b40f3c57a571557a76559a212838de2a3ec4aec6c7a3288d
            SKIP
            25a823740d92da8e186916701413114142eb6ad91a172c592e68b569c8e4f50fa99580e555ccf6cd31fc4f55a09bfe0278efa46e4e76ee0fe02846292fadf3c1
            d6f36996089cbe746f7d7062e12723d8a41a0118da9301c053e4c244221d7a32b2b0c3d64b604714243be50a98dde00f2513680dc43fc6ac12622200fc234f73
            db473db27cd68994c3ee26e78e0fb34d13126301d8861563dcc12a22d62ecb14c4ffb1e0798c6aaccdff34e73bae3fbeeff7b42606c901a2d35e278865cdf35d
            c1782b82f9db1d30aece43a07230c5d57370f2494a16e108af03815d83968805472f10f53ea5495cf0e08ff8f245430c3c3bc44025af43aaf9ecd12fcd6afc6c)
b2sums=(5ccb4a7c06c4317e3285846a261438bdcc10db5eaf71fcba969bcae8321ca50bb26fe9317e23e38eca1c4a8785015596064d5bfc692bf66f8007d0d2a1b71cbb
        SKIP
        0969a3c477b6a3f34b44e067e515d7f306414dd14e0163584417b9d071e3cc825898219f7ff66ead7905b15429b8411304052d3b2b14a72e560bfabf9bf0adcf
        97e7d992a0c347fa6f34464136e5b603bdf50eb4a4718504c951ab9ef34d17f0f7b9f917974d049b88e54185dce2f64eb0e59fd40aa921b11d9703219809c29e
        d7b587c25dd5830c27af475a8fdd8102139d7c8fdd6f04fe23b36be030e4411582e289f575c299255ff8183096f7d47247327276f9a24641cbd032d9675b837a
        753664445d7d5cc0b36f51ac66549beea403b9731cbcb81b0a782974a0a73d90559ba93e6afcaa470b6f2f5a844c09ef695bdf3b1e6dfee97aa080f41b7fe513)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

build() {
  _meson_options=(
    -D documentation=disabled
    -D html_manual=false
    -D manpages=false
    -D test=false
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
    -D pcre=disabled
    -D sqlite=disabled
    -D yajl=disabled
    -D zlib=enabled
    -D zeroconf=disabled
    -D b_ndebug=true
  )

  arch-meson ${_meson_options[@]} build ${_pkgname}-${pkgver}
  ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install

    install -vDm644 ${_pkgname}-${pkgver}/doc/mpdconf.example -t "${pkgdir}"/usr/share/doc/mpd/
    install -vDm644 ${_pkgname}.conf -t "${pkgdir}"/etc/
    install -vDm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
    install -vDm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -vDm644 ${_pkgname}.service.override "${pkgdir}"/usr/lib/systemd/system/mpd.service.d/00-arch.conf

    # Remove user service
    rm -rf "${pkgdir}"/usr/lib/systemd/user/
}
