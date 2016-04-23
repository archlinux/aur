# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Maintainer: Ben Morgan <neembi@gmail.com>

_pkgname="pulseaudio"
pkgname="$_pkgname-git"
pkgdesc="A featureful, general-purpose sound server"
pkgver=v8.0.76.gb5e5475
pkgrel=1
arch=("i686" "x86_64" "armv7h")
url="http://pulseaudio.org/"
license=("GPL" "LGPL")
depends=("rtkit" "libltdl" "speex" "tdb" "systemd" "fftw" "orc" "libsamplerate"
         "webrtc-audio-processing" "sbc" "libasyncns" "libxtst" "libsm" "libsndfile" "json-c")
makedepends=("git" "attr" "avahi" "bluez" "gconf" "intltool" "openssl" "bluez-libs")
optdepends=("alsa-plugins: ALSA support"
            "avahi: zeroconf support"
            "bluez: bluetooth support"
            "gconf: configuration through gconf"
            "jack: jack support"
            "lirc-utils: infra-red support"
            "openssl: RAOP support"
            "python-pyqt4: Equalizer GUI (qpaeq)")
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
provides=("pulseaudio" "libpulse" "pulseaudio-zeroconf" "pulseaudio-gconf" "pulseaudio-equalizer" "pulseaudio-bluetooth" "pulseaudio-jack" "pulseaudio-xen" "pulseaudio-lirc")
conflicts=("pulseaudio" "libpulse" "pulseaudio-zeroconf" "pulseaudio-gconf" "pulseaudio-equalizer" "pulseaudio-bluetooth" "pulseaudio-jack" "pulseaudio-xen" "pulseaudio-lirc")
replaces=("pulseaudio" "libpulse" "pulseaudio-zeroconf" "pulseaudio-gconf" "pulseaudio-equalizer" "pulseaudio-bluetooth" "pulseaudio-jack" "pulseaudio-xen" "pulseaudio-lirc")
options=(!emptydirs)
source=("git+https://github.com/pulseaudio/pulseaudio.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed "s/-/./g"
}

build() {
    cd "$srcdir/$_pkgname"

    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --with-udev-rules-dir=/usr/lib/udev/rules.d \
        --with-database=tdb \
        --disable-hal-compat \
        --disable-tcpwrap \
        --disable-bluez4 \
        --disable-rpath \
        --disable-default-build-tests

    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install bashcompletiondir=/usr/share/bash-completion/completions

    # Speed up pulseaudio shutdown so that it exits immediately with
    # the last user session (module-systemd-login keeps it alive)
    sed -e "/exit-idle-time/iexit-idle-time=0" -i "$pkgdir/etc/pulse/daemon.conf"

    # Disable cork-request module, can result in e.g. media players unpausing
    # when there"s a Skype call incoming
    sed -e "s|/usr/bin/pactl load-module module-x11-cork-request|#&|" -i "$pkgdir/usr/bin/start-pulseaudio-x11"

    rm "$pkgdir/etc/dbus-1/system.d/pulseaudio-system.conf"

    install -Dm644 shell-completion/zsh/_pulseaudio "$pkgdir/usr/share/zsh/site-functions/_pulseaudio"
}
