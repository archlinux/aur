# Maintainer: kballen <ken@kballentine.net>

pkgname=pulseaudio-module-xrdp-git
pkgver=0.4.r4.ge9f78c4
pkgrel=1
pkgdesc="PulseAudio modules for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/pulseaudio-module-xrdp"
license=('Apache')
depends=('pulseaudio' 'xrdp')
makedepends=('git')
conflicts=('pulseaudio-module-xrdp')
provides=('pulseaudio-module-xrdp')

source=("$pkgname::git+https://github.com/neutrinolabs/pulseaudio-module-xrdp.git#branch=devel"
        "git+https://github.com/pulseaudio/pulseaudio.git"
        "xrdp-script.conf")
sha256sums=('SKIP'
            'SKIP'
            '4c6e9c0b1eaf66ea6b8574570d89b292b8554d318ad324f3763f837013b9f44f')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long|sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'
}

prepare() {
    cd "$srcdir/pulseaudio"
    git checkout v`pkg-config libpulse --modversion|sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
    NOCONFIGURE=1 ./bootstrap.sh
    ./configure
}

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure "PULSE_DIR=$srcdir/pulseaudio"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install

    # This package installs a global drop-in conf for pulseaudio.service to use the xrdp default.pa script instead of
    # the script from the pulseaudio package. If your only desktop sessions will be via xrdp, this should be fine. But
    # if you want to start local sessions too, this will prevent the real audio devices from being detected. If this is
    # a problem for you, delete the drop-in conf file and roll your own solution for loading the xrdp modules for xrdp
    # sessions only (maybe add PULSE_SCRIPT to the user systemd's environment in startwm.sh and create a drop-in for
    # pulseaudio.service that adds PassEnvironment=PULSE_SCRIPT).
    install -Dm644 "$srcdir"/xrdp-script.conf "$pkgdir"/usr/lib/systemd/user/pulseaudio.service.d/xrdp-script.conf
}
