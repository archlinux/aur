# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=mpd
pkgname=${_pkgname}-server-minimal
pkgver=0.20.4
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music. Minimal version with only flac playback as server running under mpd user."
url="https://www.musicpd.org/"
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('alsa-lib' 'flac' 'icu' 'libmpdclient' 'sqlite' 'systemd')
makedepends=('boost')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
source=("${url}/download/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers"
        "${_pkgname}.conf")
sha256sums=('712b25351c12616630c580204e1c3dcba3ae2993a56cff1c346c87e334d69728'
            'SKIP'
            '93d5cd794c3b2709d24dd77900574683b04fa382c7eb0a2d26ddb51cbcf7adbf'
            '72adab7c736cbb5604a324af4df18e27963f6367033c70704f5ce1fc078e5219'
            'f40f68205834ca53cea3372e930bfe6c2f9ecc9df3b1605df2fec63a658b2e03')
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@musicpd.org>

prepare() {
    cd ${_pkgname}-${pkgver}

    sed -e '/\[Service\]/a User=mpd' -e '/WantedBy=/c WantedBy=default.target' -i systemd/system/${_pkgname}.service.in
}

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
        --enable-daemon \
        --enable-database \
        --enable-sqlite \
        --enable-icu \
        --enable-systemd-daemon \
        --without-systemduserunitdir \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
        --with-zeroconf=no
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install

    install -Dm644 "${srcdir}"/${_pkgname}.conf "${pkgdir}"/etc/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}
