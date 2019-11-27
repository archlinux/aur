# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=mpd
pkgname=${_pkgname}-server-minimal
pkgver=0.21.16
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback as server running under mpd user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(alsa-lib flac icu libmpdclient systemd-libs zlib)
makedepends=(boost meson)
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
source=("${url}/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers"
        "${_pkgname}.conf")
sha256sums=('30cf1bddf7d7388487276745ad3515f134e07f0c57f9f97cb2b5d3befd4a4d92'
            'SKIP'
            '93d5cd794c3b2709d24dd77900574683b04fa382c7eb0a2d26ddb51cbcf7adbf'
            '14d28690bb60d8d182499ebefa583fc42f425093ef00341be25bb66586aecf3d'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03')
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

prepare() {
    cd ${_pkgname}-${pkgver}
    rm -rf build
    install -d build
    sed -e '/\[Service\]/a User=mpd' -e '/WantedBy=/c WantedBy=default.target' -i systemd/system/${_pkgname}.service.in
}

build() {
    cd ${_pkgname}-${pkgver}/build

    _opts=('-Ddocumentation=false'
           '-Dtest=false'
           '-Dsyslog=disabled'
           '-Dinotify=true'
           '-Ddaemon=true'
           '-Dsystemd=enabled'
           '-Dtcp=true'
           '-Dipv6=enabled'
           '-Dlocal_socket=false'
           '-Ddsd=false'
           '-Ddatabase=true'
           '-Dupnp=disabled'
           '-Dlibmpdclient=enabled'
           '-Dneighbor=false'
           '-Dudisks=disabled'
           '-Dwebdav=disabled'
           '-Dcue=false'
           '-Dcdio_paranoia=disabled'
           '-Dcurl=disabled'
           '-Dmms=disabled'
           '-Dnfs=disabled'
           '-Dsmbclient=disabled'
           '-Dqobuz=disabled'
           '-Dsoundcloud=disabled'
           '-Dtidal=disabled'
           '-Dbzip2=disabled'
           '-Diso9660=disabled'
           '-Dzzip=disabled'
           '-Did3tag=disabled'
           '-Dchromaprint=disabled'
           '-Dadplug=disabled'
           '-Daudiofile=disabled'
           '-Dfaad=disabled'
           '-Dffmpeg=disabled'
           '-Dflac=enabled'
           '-Dfluidsynth=disabled'
           '-Dgme=disabled'
           '-Dmad=disabled'
           '-Dmikmod=disabled'
           '-Dmodplug=disabled'
           '-Dmpcdec=disabled'
           '-Dmpg123=disabled'
           '-Dopus=disabled'
           '-Dsidplay=disabled'
           '-Dsndfile=disabled'
           '-Dtremor=disabled'
           '-Dvorbis=disabled'
           '-Dwavpack=disabled'
           '-Dwildmidi=disabled'
           '-Dvorbisenc=disabled'
           '-Dlame=disabled'
           '-Dtwolame=disabled'
           '-Dshine=disabled'
           '-Dwave_encoder=false'
           '-Dlibsamplerate=disabled'
           '-Dsoxr=disabled'
           '-Dalsa=enabled'
           '-Dao=disabled'
           '-Dfifo=true'
           '-Dhttpd=false'
           '-Djack=disabled'
           '-Dopenal=disabled'
           '-Doss=disabled'
           '-Dpipe=false'
           '-Dpulse=disabled'
           '-Drecorder=false'
           '-Dshout=disabled'
           '-Dsndio=disabled'
           '-Dsolaris_output=disabled'
           '-Ddbus=disabled'
           '-Dexpat=disabled'
           '-Dicu=enabled'
           '-Diconv=disabled'
           '-Dpcre=disabled'
           '-Dsqlite=disabled'
           '-Dyajl=disabled'
           '-Dzlib=enabled'
           '-Dzeroconf=disabled'
    )

    arch-meson .. ${_opts[@]}
    ninja
}

package() {
    cd ${_pkgname}-${pkgver}/build

    DESTDIR="${pkgdir}" ninja install

    install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/share/doc/mpd/mpdconf.example
    install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
    install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man/man1/mpd.1

    install -Dm644 "${srcdir}"/${_pkgname}.conf "${pkgdir}"/etc/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf

    # Remove user service
    rm -rf "${pkgdir}"/usr/lib/systemd/user/
}
