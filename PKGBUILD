# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Maintainer: Ben Morgan <neembi@gmail.com>

_pkgname="pulseaudio"
pkgname="$_pkgname-pali"
pkgdesc="Pulseaudio support FastStream and SBC HQ/EQ (from Pali Rohar)"
pkgver=v13.99.1
pkgrel=1
arch=("i686" "x86_64")
url="https://gitlab.freedesktop.org/pali/pulseaudio"
license=("GPL" "LGPL")
depends=(lib{ltdl,soxr,asyncns,cap,xtst,sm,sndfile} "rtkit" "speexdsp" "tdb"
         "orc" "webrtc-audio-processing" jack2 dbus "systemd" "avahi" "openssl"
         "lirc" bluez{,-libs} "sbc" python-{pyqt5,dbus,sip} "fftw") #json-c
makedepends=("git" lib{asyncns,cap,xtst,sm,sndfile,tool,soxr} "attr" "rtkit"
             "speexdsp" "tdb" "systemd" jack2 dbus "avahi" bluez{,-libs}
             "intltool"  "sbc" "lirc" "openssl" "fftw" "orc" "gtk3"
             "webrtc-audio-processing" "check" "autoconf-archive") #gconf
optdepends=("alsa-plugins: ALSA support"
            "pulseaudio-alsa: ALSA configuration (recommended)"
            "lirc-utils: infra-red support")
backup=(etc/pulse/{daemon.conf,default.pa,system.pa,client.conf})
provides=(pulseaudio{,-{zeroconf,lirc,jack,bluetooth,equalizer}} "libpulse") #"pulseaudio-xen" "pulseaudio-gconf"
conflicts=(pulseaudio{,-{zeroconf,lirc,jack,bluetooth,equalizer}} "libpulse") #"pulseaudio-xen" "pulseaudio-gconf"
options=(!emptydirs)
source=("git+https://gitlab.freedesktop.org/pali/pulseaudio.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed "s/-/./g"
}

prepare() {
    cd "$srcdir/$_pkgname"
    NOCONFIGURE=1 ./bootstrap.sh
}

build() {
    cd "$srcdir/$_pkgname"

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --with-udev-rules-dir=/usr/lib/udev/rules.d \
        --with-pulsedsp-location='/usr/\\$$LIB/pulseaudio' \
        --with-database=tdb \
        --disable-tcpwrap \
        --disable-bluez4 \
        --disable-rpath \
        --disable-default-build-tests \
        DATADIRNAME=share

    # fight unused direct deps
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install bashcompletiondir=/usr/share/bash-completion/completions

    # Speed up pulseaudio shutdown so that it exits immediately with
    # the last user session (module-systemd-login keeps it alive)
    sed -e "/exit-idle-time/iexit-idle-time=0" -i "$pkgdir/etc/pulse/daemon.conf"

    # Assumes that any volume adjustment is intended by the user, who can control
    # each app's volume. Misbehaving clients can trigger earsplitting volume
    # jumps. App volumes can diverge wildly and cause apps without their own
    # volume control to fall below sink volume; a sink-only volume control will
    # suddenly be unable to make such an app loud enough.
    sed -e '/flat-volumes/iflat-volumes = no' \
        -i "$pkgdir/etc/pulse/daemon.conf"

    # Superseded by socket activation
    sed -e '/autospawn/iautospawn = no' \
        -i "$pkgdir/etc/pulse/client.conf"

    # Disable cork-request module, can result in e.g. media players unpausing
    # when there"s a Skype call incoming
    sed -e "s|/usr/bin/pactl load-module module-x11-cork-request|#&|" -i "$pkgdir/usr/bin/start-pulseaudio-x11"

    # Required by qpaeq
    sed -e '/Load several protocols/aload-module module-dbus-protocol' \
        -i "$pkgdir/etc/pulse/default.pa"

    rm "$pkgdir/etc/dbus-1/system.d/pulseaudio-system.conf"

    install -Dm644 shell-completion/zsh/_pulseaudio "$pkgdir/usr/share/zsh/site-functions/_pulseaudio"
}
