# Maintainer: Asger Geel Weirsoe <asger at weircon dot dk>
#
# DISCLAIMER
#
# ahfail is a joke with a real screen locker underneath. Two things to know
# before installing it:
#
# 1. Security. It sits in the authentication path of your session. It is
#    provided as is, without any warranty (see the AGPL-3.0 license). On
#    Wayland a crash leaves the session locked; on X11, as with i3lock, a
#    killed locker leaves it open. /etc/pam.d/ahfail includes `login`, so
#    the system's pam_faillock policy applies to wrong guesses.
#
# 2. Media. The sprite frames and the audio clip are a parody of the
#    "ah ah ah, you didn't say the magic word" scene from Jurassic Park
#    (1993). The film and its characters belong to their respective rights
#    holders; they are used here non-commercially for parody, and the
#    AGPL-3.0 license covers the code, not those assets. Rights holders who
#    object can reach the maintainer at the address above and the assets
#    will be replaced.
pkgname=ahfail
pkgver=0.10.0
pkgrel=2
pkgdesc="Screen locker that says 'ah ah ah, you didn't say the magic word' on a wrong password"
arch=('x86_64')
url="https://gitea.weircon.dk/agw/gtk-ahfail"
license=('AGPL-3.0-only')
# gst-plugins-bad-libs: libgstplayer. gst-plugins-base/-good are runtime plugins
# (audio conversion, the mpg123 mp3 decoder) that namcap cannot see being used.
depends=('gtk3' 'gtk-session-lock' 'gstreamer' 'gst-plugins-bad-libs' 'gst-plugins-base'
         'gst-plugins-good' 'pam' 'glib2' 'gdk-pixbuf2' 'cairo' 'pango' 'at-spi2-core' 'gst-plugins-base-libs' 'glibc' 'libgcc' 'libx11')
makedepends=('meson' 'ninja' 'cargo')
optdepends=('pipewire-pulse: raise the volume to 100% on a failed attempt (or libpulse)'
            'libpulse: raise the volume to 100% on a failed attempt'
            'swayidle: lock automatically on Wayland'
            'xss-lock: lock automatically on X11'
            'gtklock: legacy gtklock module (/usr/lib/gtklock/ahfail-module.so)')
backup=('etc/pam.d/ahfail')
install=ahfail.install
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a96263885fedd33513b3a783243fae7a9ee58ca41e938a18afd6e42dd139d221')

prepare() {
    cd "$srcdir/gtk-ahfail"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/gtk-ahfail"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_NET_OFFLINE=true
    arch-meson . build -Dupdate_check=false
    meson compile -C build
}

package() {
    cd "$srcdir/gtk-ahfail"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
