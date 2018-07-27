# Maintainer: bar0metr <admin@os-admin.ru>

pkgname=clamav-latest
pkgver=0.100.1
pkgrel=2
pkgdesc='Anti-virus toolkit for Unix. Compiling with Openssl 1.0 and many options for normal work with Squid4.1 and 
ICAP module Squidclamav. '
url='https://www.clamav.net/'
license=('GPL')
arch=('x86_64')
depends=('bzip2' 'libltdl' 'libxml2' 'curl' 'libsystemd' 'pcre2' 'json-c' 'openssl-1.0')
makedepends=('libmilter' 'systemd')
backup=('etc/clamav/clamd.conf'
        'etc/clamav/freshclam.conf'
        'etc/clamav/clamav-milter.conf'
        'etc/logrotate.d/clamav')
install=clamav.install
source=(https://www.clamav.net/downloads/production/clamav-${pkgver}.tar.gz{,.sig}
        clamav.logrotate
        clamav.tmpfiles
        clamav.sysusers)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('65ED513993F08DA06F9639A6F13F9E16BCA5BFAD') 

prepare() {

  cd clamav-${pkgver}
  wget https://raw.githubusercontent.com/bar0metr/clamav_patches/master/configure_patch
  patch -p0 -i configure_patch
  sed -E 's|^(Example)$|#\1|' -i etc/{clamd,freshclam,clamav-milter}.conf.sample
  sed -E 's|#(User) .+|\1 clamav|' -i etc/{clamd,freshclam,clamav-milter}.conf.sample
  sed -E 's|#(LogFile) .+|\1 /var/log/clamav/clamd.log|' -i etc/clamd.conf.sample
  sed -E 's|#(LogTime) .+|\1 yes|' -i etc/clamd.conf.sample etc/clamav-milter.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/clamd.pid|' -i etc/clamd.conf.sample
  sed -E 's|#(TemporaryDirectory) .+|\1 /tmp|' -i etc/{clamd,clamav-milter}.conf.sample
  sed -E 's|#(LocalSocket) .+|\1 /run/clamav/clamd.ctl|' -i etc/clamd.conf.sample
  sed -E 's|#(UpdateLogFile) .+|\1 /var/log/clamav/freshclam.log|' -i etc/freshclam.conf.sample
  sed -E 's|#(DatabaseMirror) .+|\1 database.clamav.net|' -i etc/freshclam.conf.sample
  sed -E 's|#(NotifyClamd) .+|\1 /etc/clamav/clamd.conf|' -i etc/freshclam.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/freshclam.pid|' -i etc/freshclam.conf.sample
  sed -E 's|#(LogFile) .+|\1 /var/log/clamav/clamav-milter.log|' -i etc/clamav-milter.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/clamav-milter.pid|' -i etc/clamav-milter.conf.sample
  autoreconf -fiv
}

build() {
  cd clamav-${pkgver}
  # --disable-zlib-vcheck because the configure script thinks that
  # zlib 1.2.11 is older than 1.2.2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/clamav \
    --with-dbdir=/var/lib/clamav \
    --with-user=clamav \
    --with-openssl=/usr \
    --disable-ipv6 \
    --enable-bigstack \
    --with-group=clamav \
    --disable-rpath \
    --disable-clamav \
    --disable-llvm \
    --enable-zlib-vcheck \
    --enable-milter \
    --enable-clamdtop

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -j$(nproc)
}

package() {
  cd clamav-${pkgver}
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/etc/clamav/freshclam.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamd.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamav-milter.conf{.sample,}

  install -Dm 644 ../clamav.sysusers "${pkgdir}"/usr/lib/sysusers.d/clamav.conf
  install -Dm 644 ../clamav.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/clamav.conf
  install -Dm 644 ../clamav.logrotate "${pkgdir}"/etc/logrotate.d/clamav
}

# vim: ts=2 sw=2 et:

