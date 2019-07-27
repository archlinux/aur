# Maintainer: Timothy Brown <sysop@timb.us>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Giacomo Rizzo <alt@free-os.it>

pkgname=gpsd-timing
pkgver=3.19
pkgrel=1
pkgdesc="GPS daemon and library built to support GPS timing devices"
provides=('gpsd')
conflicts=('gpsd')
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://catb.org/gpsd/"
license=('BSD')
depends=('python' 'libusb' 'bluez-libs' 'pps-tools' 'ntp')
optdepends=('php: generate a PHP status page for your GPS'
            'php-gd: image support for the PHP status page')
makedepends=('scons' 'docbook-xsl' 'python')
backup=('etc/default/gpsd')
source=(https://download.savannah.gnu.org/releases/"${pkgname%%-timing}"/"${pkgname%%-timing}"-$pkgver.tar.gz{,.sig}
        "${pkgname%%-timing}".conf
        'fix-python-libdir.patch')
sha256sums=('27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39'
            'SKIP'
            '009df48ca0a031ea5e360733570277f5b936b273e6cea793ba9097b0eff41b0a'
            '631cf609db1f4b26b94d324a9ca16624487781f0b8736c5c59d8c45acc5d7322')
validpgpkeys=('EED4A0893DCC705DB309E202CCF29C7238522905') # Gary E. Miller <gem@rellim.com>
# validpgpkeys=('41876B2F579463A499843D1DECC8208F8C6C738D') # Eric S. Raymond

prepare() {
  cd "${pkgname%%-timing}"-$pkgver
  patch -p1 -i ../fix-python-libdir.patch # Fix python install dir
}

build() {
  cd "${pkgname%%-timing}"-$pkgver

  export LINKFLAGS="-lpthread ${LDFLAGS}"
  scons minimal=yes \
        prefix=/usr \
        mandir=/usr/share/man \
        includedir=/usr/include \
        libdir=/usr/lib \
        sysconfdir=/etc \
        bindir=/usr/bin \
        docdir=/usr/share/doc \
        pkgconfig=/usr/lib/pkgconfig \
        sbindir=/usr/bin \
        udevdir=/usr/lib/udev \
        reconfigure=yes \
        control_socket=yes \
        controlsend=yes \
        dbus_export=yes \
        socket_export=yes \
        passthrough=yes \
        gpsd_group=uucp \
        gpsd_user=nobody \
        implicit_link=yes \
        shared=yes \
        ipv6=yes \
        leapfetch=yes \
        libgpsmm=yes \
        manbuild=yes \
        max_clients=64 \
        max_devices=4 \
        timing=yes \
        ncurses=yes \
        python=yes \
        systemd=yes \
        gpsd=yes \
        gpsdclients=yes \
        fixed_port_speed=115200 \
        bluez=yes \
        usb=yes \
        ntp=yes \
        ntpshm=yes \
        shm_export=yes \
        pps=yes \
        magic_hat=yes \
        timeservice=yes \
        oscillator=yes \
        aivdm=no \
        ashtech=yes \
        earthmate=no \
        evermore=yes \
        fury=yes \
        fv18=no \
        garmin=yes \
        garmintxt=yes \
        geostar=no \
        gpsclock=yes \
        greis=yes \
        isync=yes \
        itrax=yes \
        mtk3301=yes \
        navcom=yes \
        netfeed=yes \
        nmea0183=yes \
        nmea2000=yes \
        ntrip=no \
        oceanserver=no \
        oncore=yes \
        rtcm104v2=yes \
        rtcm104v3=yes \
        sirf=yes \
        skytraq=yes \
        superstar2=yes \
        tnt=no \
        tripmate=no \
        tsip=yes \
        ublox=yes
}

package() {
  cd "${pkgname%%-timing}"-$pkgver

  # Fix path in systemd files
  sed -i 's|local/sbin|bin|' systemd/{gpsd.service,gpsdctl@.service}

  export DESTDIR="${pkgdir}"
  scons install

  install -Dm755 gpsinit -t "${pkgdir}"/usr/bin
  chmod 755 "${pkgdir}"/usr/bin/*

  install -Dm644 "$srcdir/gpsd.conf" "${pkgdir}"/etc/default/gpsd

  install -Dm644 "gpsd.rules" "${pkgdir}"/usr/lib/udev/rules.d/25-gpsd-usb.rules

  install -Dm755 gpsd.hotplug "${pkgdir}"/usr/lib/udev/gpsd.hotplug

  install -Dm644 systemd/gpsd.service "${pkgdir}"/usr/lib/systemd/system/gpsd.service
  install -Dm644 systemd/gpsd.socket "${pkgdir}"/usr/lib/systemd/system/gpsd.socket
  install -Dm644 systemd/gpsdctl@.service "${pkgdir}"/usr/lib/systemd/system/gpsdctl@.service

  install -Dm644 gpsd.php.in "${pkgdir}"/usr/share/"${pkgname%%-timing}"/gpsd.php.in
  install -Dm644 gpsd.php "${pkgdir}"/usr/share/"${pkgname%%-timing}"/gpsd.php

  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname%%-timing}"/LICENSE
}