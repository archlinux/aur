# Maintainer: Max Beck <rytonemail@gmail.com>
pkgname=mpd-sidplay
_pkgname=mpd
pkgver=0.20.20
_majorver=0.20
pkgrel=1
pkgdesc="Flexible, powerful, server-side application for playing music - built with sidplay support"
url="https://www.musicpd.org/"
license=("GPL")
arch=("x86_64")
depends=("libao" "ffmpeg" "libmodplug" "audiofile" "libshout" "libmad" "curl" "faad2" "sqlite" "jack" "libmms" "wavpack" "avahi" "libid3tag" "yajl" "libmpdclient" "icu" "libupnp" "libnfs" "libsamplerate" "libsoxr" "smbclient" "libgme" "zziplib" "libsystemd" "libsidplayfp")
makedepends=("boost" "doxygen")
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512')
provides=("mpd=$pkgver")
conflicts=("mpd")
replaces=("mpd")
source=("https://www.musicpd.org/download/${_pkgname}/${_majorver}/${_pkgname}-${pkgver}.tar.xz"{,.sig} "tmpfiles.d" "sysusers.d" "mpd.conf" "no_resid_builder.patch")
sha256sums=("a9e458c6e07cdf62649de7722e1e5a7f13aa82eeb397bfbbebc07cf5cf273584" "SKIP" "e09e38ab5fd6e8b3b3e6e5a48d837c164ad37aec7e6762a78810c34fe9abf3a1" "2679014448e9352e20e85d8d76b021aeebe27bdf6100b24577afee2f37522a95" "a30c2c43824b540300cc83505c146989b415189bd90f191aebaed6f13556e6d2" "1ad209f027670ecaf5dd3a0c9daf9cf7758ab266090a1e4cf0caf226ee9b42ed")
backup=("etc/mpd.conf")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch < ../no_resid_builder.patch
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-jack \
        --enable-libmpdclient \
        --enable-pipe-output \
        --enable-pulse \
        --enable-soundcloud \
        --enable-zzip \
        --enable-sidplay \
        --with-systemduserunitdir=/usr/lib/systemd/user \
        --with-systemdsystemunitdir=/usr/lib/systemd/system \
    
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 ../mpd.conf "${pkgdir}"/etc/mpd.conf
    install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
    install -Dm644 ../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/mpd.conf

    sed '/\[Service\]/a User=mpd' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
    sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/system/mpd.service
}
