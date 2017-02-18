# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-light-pulse
pkgver=0.20.3
_majorver=0.20
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without libmpdclient, openal, ao, ffmpeg, jack, modplug, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, smbclient support.'
url='https://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('audiofile' 'libmad' 'curl' 'faad2' 'sqlite' 'libmms' 'libid3tag' 'libpulse'
         'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'libcdio-paranoia' 'libgme')
makedepends=('doxygen' 'boost')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("https://www.musicpd.org/download/mpd/${_majorver}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
        'mpd.conf')
sha1sums=('d9f055ce55b431b9b61995714fc758f10d916420'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          'fd581b976f4931abf9b849224dcb38a73af14af0')
backup=('etc/mpd.conf')
install=mpd.install

build() {
    cd "${srcdir}/mpd-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-cdio-paranoia \
        --disable-libmpdclient \
        --disable-openal \
        --enable-pulse \
        --disable-ao \
        --disable-ffmpeg \
        --disable-jack \
        --disable-modplug \
        --disable-shout \
        --disable-sidplay \
        --disable-soundcloud \
        --disable-wavpack \
        --with-zeroconf=no \
        --disable-smbclient \
        --disable-fluidsynth \
        --with-systemdsystemunitdir=/usr/lib/systemd/system

    make
}

package() {
    cd "${srcdir}/mpd-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
    install -Dm644 ../mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
    install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

    install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
    sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
    sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
}
