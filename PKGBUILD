# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Maintainer: Ben Morgan <neembi@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

_pkgname="pulseaudio"
pkgname="$_pkgname-git"
pkgdesc="A featureful, general-purpose sound server (development version)"
pkgver=13.99.2.r4.g36a86d414
pkgrel=1
arch=("i686" "x86_64" "armv7h")
url="http://pulseaudio.org/"
license=("GPL" "LGPL")
depends=(lib{ltdl,soxr,asyncns,xtst,sndfile} "rtkit" "speexdsp" "tdb" "orc"
         "webrtc-audio-processing" jack2 "lirc" bluez{,-libs} "sbc"
         python-{pyqt5,dbus,sip} "fftw" dconf)
makedepends=("git" lib{asyncns,xtst,tool,soxr,sndfile} "attr" "rtkit" "speexdsp"
             "tdb" jack2 bluez{,-libs} "intltool"  "sbc" "lirc" "fftw"
             "orc" "gtk3" "webrtc-audio-processing" "check" "meson")
optdepends=("alsa-plugins: ALSA support"
            "pulseaudio-alsa: ALSA configuration (recommended)"
            "lirc-utils: infra-red support")
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
provides=(pulseaudio{,-{zeroconf,lirc,jack,bluetooth,equalizer}} "libpulse" libpulse{,-{simple,mainloop-glib}}.so)
conflicts=(pulseaudio{,-{zeroconf,lirc,jack,bluetooth,equalizer}} "libpulse" libpulse{,-{simple,mainloop-glib}}.so)
options=(!emptydirs)
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson pulseaudio build \
    -D gcov=false \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D udevrulesdir=/usr/lib/udev/rules.d
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
  ninja -C build test-daemon
}
 
package() {
    

    DESTDIR="$pkgdir" meson install -C build

    cd "$pkgdir"

    # Assumes that any volume adjustment is intended by the user, who can control
    # each app's volume. Misbehaving clients can trigger earsplitting volume
    # jumps. App volumes can diverge wildly and cause apps without their own
    # volume control to fall below sink volume; a sink-only volume control will
    # suddenly be unable to make such an app loud enough.
    sed -e '/flat-volumes/iflat-volumes = no' \
        -i etc/pulse/daemon.conf

    # Superseded by socket activation
    sed -e '/autospawn/iautospawn = no' \
        -i etc/pulse/client.conf

    # Disable cork-request module, can result in e.g. media players unpausing
    # when there's a Skype call incoming
    sed -e "s|/usr/bin/pactl load-module module-x11-cork-request|#&|" \
    -i usr/bin/start-pulseaudio-x11

    # Required by qpaeq
    sed -e '/Load several protocols/aload-module module-dbus-protocol' \
        -i "$pkgdir/etc/pulse/default.pa"

    rm -r etc/dbus-1

}
