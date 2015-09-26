# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

pkgbase=mpd
pkgname=mpd-minimal
pkgver=0.19.10
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Minmal version with only flac playback through socket connection.'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('alsa-lib' 'flac' 'icu' 'libmpdclient' 'libsystemd' 'sqlite')
makedepends=('boost')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("http://www.musicpd.org/download/mpd/${pkgver%.*}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
        'mpd.conf')
sha1sums=('4635b33223d3f1e67eed41f6350ef75515153213'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '291fd5cda9f0845834a553017327c4586bd853f6')
backup=('etc/mpd.conf')
install=mpd.install

build() {
    cd "${srcdir}/mpd-${pkgver}"

	./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-libmpdclient \
        --disable-ao \
        --disable-httpd-output \
        --disable-jack \
        --disable-openal \
        --disable-oss \
        --disable-pulse \
        --disable-recorder-output \
        --disable-roar \
        --disable-shout \
        --disable-aac \
        --disable-adplug \
        --disable-audiofile \
        --disable-ffmpeg \
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
        --disable-curl \
        --disable-expat \
        --disable-ipv6 \
        --disable-libwrap \
        --disable-mms \
        --disable-nfs \
        --disable-smbclient \
        --disable-soundcloud \
        --disable-tcp \
        --disable-upnp \
        --disable-bzip2 \
        --disable-iso9660 \
        --disable-zlib \
        --disable-zzip \
        --disable-cdio-paranoia \
        --disable-id3 \
        --disable-largefile \
        --disable-lsr \
        --disable-soxr \
        --disable-lame-encoder \
        --disable-shine-encoder \
        --disable-twolame-encoder \
        --disable-vorbis-encoder \
        --disable-wave-encoder \
        --disable-neighbor-plugins \
        --enable-sqlite \
        --enable-systemd-daemon \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-zeroconf=no

    make
}

package() {
    cd "${srcdir}/mpd-${pkgver}"

    make DESTDIR="${pkgdir}" install

#   install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
    install -Dm644 ../mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
#   install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/{,playlists}

    install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
    sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
    sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
