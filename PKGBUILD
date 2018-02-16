# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-light-pulse
pkgver=0.20.17
_majorver=0.20
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without libmpdclient, openal, ao, ffmpeg, jack, modplug, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, smbclient, zziplib support.'
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
sha256sums=('2cb0e7f0e219df60a04b3c997d8ed7ad458ebfd89fd045e03fbe727277d5dac1'
            'c1683ba35774c85e16c70e89f7e2ed1c09619512b1a273daabbd5e34d40439bd'
            'e213c108cd0e076b5cc07091707ef75d74d9ac8c779d0c0128cd0aa69617f8a0')
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
	--disable-zzip \
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
