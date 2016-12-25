# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=mpd
pkgbase=${_pkgname}-server
pkgname=${_pkgname}-server-minimal-old
pkgver=0.19.21
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback as server running under mpd user."
url="https://www.musicpd.org/"
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('alsa-lib' 'flac' 'glib2' 'icu' 'libmpdclient' 'sqlite')
makedepends=('boost')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
install=mpd.install
source=("${url}/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${_pkgname}.tmpfile"
        "${_pkgname}.conf")
sha1sums=('27dd903f4f7c0f5ffeb85e6820c02d2b82485572'
          'SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '291fd5cda9f0845834a553017327c4586bd853f6')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann

build() {
    cd ${_pkgname}-${pkgver}

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-bzip2 \
        --disable-iso9660 \
        --disable-zlib \
        --disable-zzip \
        --enable-ipv6 \
        --enable-tcp \
        --disable-un \
        --disable-largefile \
        --disable-nfs \
        --disable-smbclient \
        --disable-aac \
        --disable-adplug \
        --disable-audiofile \
        --disable-dsd \
        --disable-ffmpeg \
        --enable-flac \
        --disable-fluidsynth \
        --disable-gme \
        --disable-mad \
        --disable-mikmod \
        --disable-modplug \
        --disable-mpc \
        --disable-mpg123 \
        --disable-opus \
        --disable-sidplay \
        --disable-sndfile \
        --disable-vorbis \
        --disable-wavpack \
        --disable-wildmidi \
        --disable-id3 \
        --disable-ao \
        --enable-alsa \
        --enable-fifo \
        --disable-httpd-output \
        --disable-jack \
        --disable-mms \
        --disable-openal \
        --disable-oss \
        --disable-osx \
        --disable-pipe-output \
        --disable-pulse \
        --disable-recorder-output \
        --disable-roar \
        --disable-shout \
        --disable-solaris-output \
        --disable-cdio-paranoia \
        --disable-curl \
        --disable-soundcloud \
        --disable-lame-encoder \
        --disable-shine-encoder \
        --disable-twolame-encoder \
        --disable-vorbis-encoder \
        --disable-wave-encoder \
        --disable-lsr \
        --disable-soxr \
        --disable-neighbor-plugins \
        --disable-upnp \
        --disable-expat \
        --disable-libwrap \
        --disable-debug \
        --disable-test \
        --disable-documentation \
        --disable-inotify \
        --enable-libmpdclient \
        --enable-database \
        --enable-sqlite \
        --enable-icu \
        --enable-glib \
        --disable-systemd-daemon \
        --without-systemduserunitdir \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-zeroconf=no
    make
}

package_mpd-server-minimal-old() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install

    install -Dm644 ../"${_pkgname}".conf "${pkgdir}"/etc/"${_pkgname}".conf
    install -Dm644 ../"${_pkgname}".tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/"${_pkgname}".conf
    install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/{,playlists}

    sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/"${_pkgname}".service
    sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/system/"${_pkgname}".service
}
