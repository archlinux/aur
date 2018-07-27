# Maintainer: bar0metr <admin@os-admin.ru>

pkgname=clamav
pkgver=0.100.1
pkgrel=2
pkgdesc='Anti-virus toolkit for Unix. Fix for work with squidclamav'
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
source=(https://www.clamav.net/downloads/production/${pkgname}-${pkgver}.tar.gz{,.sig}
        clamav.logrotate
        clamav.tmpfiles
        clamav.sysusers)
sha512sums=('SKIP'
            'SKIP'
            
'9cb168c1c16bb43c99900d7ef34456e3f3b593d4d1943c875a0306bc86fd3872cb78e9e1413dcba93579e01b96d466c9eea1975e24190193663b7986c4525d48'
            
'c5443634399bd87fe0d0192518538ffdb7296a8437b5b0160a0fbd58696b01285de3237e3feb552c0095c49e576832dec2e2b2107eef2be42424ed7edd13cd19'
            
'b984836f6c34d97b90d81fa5d17361a2e3f8c0cc709e3350a4d25cf088dc04f7bf2504359980c8be489c96b1b8798c60e6da533069d3378d49d4f50f929a2c90')
validpgpkeys=('65ED513993F08DA06F9639A6F13F9E16BCA5BFAD') # Talos (Talos, Cisco Systems Inc.) <research@sourcefire.com>

prepare() {
  cd ${pkgname}-${pkgver}
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
  cd ${pkgname}-${pkgver}
  # --disable-zlib-vcheck because the configure script thinks that
  # zlib 1.2.11 is older than 1.2.2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/clamav \
    --with-dbdir=/var/lib/clamav \
    --with-user=clamav \
    --with-openssl=/usr/include/openssl-1.0/openssl \
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
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/etc/clamav/freshclam.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamd.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamav-milter.conf{.sample,}

  install -Dm 644 ../clamav.sysusers "${pkgdir}"/usr/lib/sysusers.d/clamav.conf
  install -Dm 644 ../clamav.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/clamav.conf
  install -Dm 644 ../clamav.logrotate "${pkgdir}"/etc/logrotate.d/clamav
}

# vim: ts=2 sw=2 et:

