# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkgname=mpd
pkgname=${_pkgname}-minimal
pkgver=0.22.3
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback through socket connection as user."
arch=(i686 x86_64 armv7h)
url="https://www.musicpd.org/"
license=(GPL)
depends=(alsa-lib flac icu libmpdclient liburing systemd-libs zlib)
makedepends=(boost meson python-sphinx systemd)
provides=("${_pkgname}=${pkgver}")
conflicts=(${_pkgname})
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=(338012037b5e67730529187c555a54cc567a85b15a7e8ddb3a807b1971566ccf SKIP)
validpgpkeys=(0392335A78083894A4301C43236E8A58C6DB4512) # Max Kellermann <max@musicpd.org>

build() {
    cd ${_pkgname}-${pkgver}
    sed -i "s|get_option('html_manual')|get_option('html_manual') and not get_option('manpages')|" doc/meson.build
    _opts=('-Ddocumentation=enabled'
           '-Dhtml_manual=false'
           '-Dmanpages=true'
           '-Dtest=false'
           '-Dsyslog=disabled'
           '-Dinotify=false'
           '-Dio_uring=enabled'
           '-Ddaemon=true'
           '-Dsystemd=enabled'
           '-Dtcp=false'
           '-Dipv6=disabled'
           '-Dlocal_socket=true'
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

    arch-meson ${_opts[@]} build
    ninja -C build
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 doc/mpdconf.example -t "${pkgdir}"/usr/share/doc/mpd/
    # Remove system services and clean user one
    rm -rf "${pkgdir}"/usr/lib/systemd/system/
    sed -e 's/After=network.target /After=/g' -e 's/AF_INET AF_INET6 AF_UNIX AF_NETLINK/AF_UNIX/g' -i "${pkgdir}"/usr/lib/systemd/user/mpd.service
}
