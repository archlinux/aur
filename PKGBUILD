# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=mpd
pkgname=${_pkgname}-minimal
pkgver=0.20.20
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback through socket connection as user."
url="https://www.musicpd.org/"
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('alsa-lib' 'flac' 'icu' 'libmpdclient' 'sqlite' 'libsystemd')
makedepends=('boost')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('a9e458c6e07cdf62649de7722e1e5a7f13aa82eeb397bfbbebc07cf5cf273584' 'SKIP')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@musicpd.org>

build() {
    cd ${_pkgname}-${pkgver}

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-bzip2 \
        --disable-iso9660 \
        --disable-zlib \
        --disable-zzip \
        --disable-ipv6 \
        --disable-tcp \
        --enable-un \
        --disable-largefile \
        --disable-nfs \
        --disable-smbclient \
        --disable-webdav \
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
        --disable-haiku \
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
        --disable-sndio \
        --disable-solaris-output \
        --disable-cdio-paranoia \
        --disable-cue \
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
        --enable-daemon \
        --enable-sqlite \
        --enable-icu \
        --enable-systemd-daemon \
        --with-systemduserunitdir=/usr/lib/systemd/user \
        --without-systemdsystemunitdir \
        --with-zeroconf=no
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    sed -e 's/network.target //g' -e 's/AF_INET AF_INET6 AF_UNIX AF_NETLINK/AF_UNIX/g' -i "${pkgdir}"/usr/lib/systemd/user/mpd.service

}
