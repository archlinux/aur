# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-light-pulse
pkgver=0.21.11
_majorver=0.21
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music. Light version without libmpdclient, openal, ao, ffmpeg, jack, modplug, shout, sidplay, soundcloud, wavpack, fluidsynth, avahi, smbclient, zziplib, gme, mms support.'
url='https://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('audiofile' 'libmad' 'curl' 'faad2' 'sqlite' 'libid3tag' 'libpulse'
         'icu' 'libupnp' 'libnfs' 'libsamplerate' 'libsoxr' 'libcdio-paranoia')
makedepends=('boost' 'meson' 'python-sphinx')
provides=("mpd=$pkgver")
conflicts=('mpd')
replaces=('mpd')
source=("https://www.musicpd.org/download/mpd/${_majorver}/mpd-${pkgver}.tar.xz"
        'mpd.tmpfile'
        'mpd.conf')
sha256sums=('d32ef88b4404b188c4505462cfd3fb695463800c9d062e5148f782ca227a6cbd'
            'c1683ba35774c85e16c70e89f7e2ed1c09619512b1a273daabbd5e34d40439bd'
            'e213c108cd0e076b5cc07091707ef75d74d9ac8c779d0c0128cd0aa69617f8a0')
backup=('etc/mpd.conf')
install=mpd.install

prepare() {
    cd "${srcdir}/mpd-${pkgver}"

    rm -fr build
    install -d build
}

build() {
    cd "${srcdir}/mpd-${pkgver}/build"

    _opts=('-Ddocumentation=true'
           '-Dchromaprint=disabled' # appears not to be used for anything
           '-Dsidplay=disabled' # unclear why but disabled in the past
           '-Dadplug=disabled' # not in an official repo
           '-Dsndio=disabled' # interferes with detection of alsa devices
           '-Dshine=disabled' # not in an official repo
           '-Dtremor=disabled' # not in an official repo
           '-Dao=disabled'
           '-Dffmpeg=disabled'
           '-Djack=disabled'
           '-Dmodplug=disabled'
           '-Dshout=disabled'
           '-Dsidplay=disabled'
           '-Dsoundcloud=disabled'
           '-Dwavpack=disabled'
           '-Dzzip=disabled'
           '-Dzeroconf=disabled'
           '-Dsmbclient=disabled'
           '-Dlibmpdclient=disabled'
           '-Dopenal=disabled'
           '-Dfluidsynth=disabled'
           '-Dmms=disabled'
           '-Dgme=disabled'
    )
    arch-meson --auto-features auto  .. ${_opts[@]}
    ninja
}

package() {
    cd "${srcdir}/mpd-${pkgver}/build"

    DESTDIR="${pkgdir}" ninja install

    install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
    install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
    install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

    install -Dm644 "${srcdir}"/mpd.conf "${pkgdir}"/etc/mpd.conf
    install -Dm644 "${srcdir}"/mpd.tmpfile "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
    install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd{,/playlists}

    # Now service file installs only when libsystemd package was found
    if [ -e "${pkgdir}"/usr/lib/systemd/system/mpd.service ]; then
        sed \
            -e '/\[Service\]/a User=mpd' \
            -e '/WantedBy=/c WantedBy=default.target' \
            -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
    fi
}
