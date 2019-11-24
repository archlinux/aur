# Maintainer: Max Beck <rytonemail@gmail.com>
pkgname=mpd-sidplay
_pkgname=mpd
pkgver=0.21.16
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music - built with sidplay support"
url="https://www.musicpd.org/"
license=("GPL")
arch=("x86_64")
depends=(
    "audiofile"
    "avahi"
    "curl"
    "faad2"
    "ffmpeg"
    "fluidsynth"
    "icu"
    "jack"
    "libao"
    "libcdio-paranoia"
    "libgme"
    "libid3tag"
    "libmad"
    "libmikmod"
    "libmms"
    "libmodplug"
    "libmpcdec"
    "libmpdclient"
    "libnfs"
    "libsamplerate"
    "libshout"
    "libsidplayfp"
    "libsoxr"
    "libvorbis"
    "libupnp"
    "mpg123"
    "openal"
    "smbclient"
    "sqlite"
    "systemd-libs"
    "twolame"
    "wavpack"
    "wildmidi"
    "yajl"
    "zziplib"
)
makedepends=("boost" "meson" "python-sphinx")
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
provides=("mpd=$pkgver")
conflicts=("mpd")
replaces=("mpd")
source=(
    "https://www.musicpd.org/download/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
    "tmpfiles.d"
    "sysusers.d"
    "mpd.conf"
)
sha256sums=('30cf1bddf7d7388487276745ad3515f134e07f0c57f9f97cb2b5d3befd4a4d92'
            'SKIP'
            'e09e38ab5fd6e8b3b3e6e5a48d837c164ad37aec7e6762a78810c34fe9abf3a1'
            '2679014448e9352e20e85d8d76b021aeebe27bdf6100b24577afee2f37522a95'
            'a30c2c43824b540300cc83505c146989b415189bd90f191aebaed6f13556e6d2')
backup=("etc/mpd.conf")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    _opts=(
        "-Ddocumentation=true"
        "-Dchromaprint=disabled"
        "-Dsidplay=enabled"
        "-Dadplug=disabled"
        "-Dsndio=disabled"
        "-Dshine=disabled"
        "-Dtremor=disabled"
    )
    arch-meson .. ${_opts[@]}
    ninja

}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    DESTDIR="${pkgdir}" ninja install

    install -Dm644 ../doc/mpdconf.example "${pkgdir}"/usr/shade/doc/mpd/mpdconf.example
    install -Dm644 ../doc/mpd.conf.5 "${pkgdir}"/usr/share/man/man5/mpd.conf.5
    install -Dm644 ../doc/mpd.1 "${pkgdir}"/usr/share/man1/mpd.1

    install -Dm644 ../../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
    install -Dm644 ../../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf
    install -Dm644 ../../mpd.conf "${pkgdir}"/etc/mpd.conf

    sed \
        -e "/\[Service\]/a User=mpd" \
        -e "/WantedBy=/c WantedBy=default.target" \
        -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
