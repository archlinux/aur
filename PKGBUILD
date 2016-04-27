# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgbase=mpd
pkgname=mpd-minimal
pkgver=0.19.14
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Minimal version with only flac playback through socket connection.'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('alsa-lib' 'flac' 'glib2' 'icu' 'libmpdclient' 'sqlite') # 'libsystemd'
makedepends=('boost')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
source=("http://www.musicpd.org/download/mpd/${pkgver%.*}/mpd-${pkgver}.tar.xz"{,.sig}
        'mpd.tmpfile')
#        'mpd.conf')
sha1sums=('2faf8664ae5c9183e73185c9dcfe0be50579f5e8' 'SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7')
#          '291fd5cda9f0845834a553017327c4586bd853f6')
#backup=('etc/mpd.conf')
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
        --disable-systemd-daemon \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-zeroconf=no

    make
}

package_mpd-minimal() {
    cd "${srcdir}/mpd-${pkgver}"

    make DESTDIR="${pkgdir}" install

#   install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
    install -Dm644 ../mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
#   install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/{,playlists}

    install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
    sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
    sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
