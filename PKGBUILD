# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-testing
pkgver=9.3beta1
pkgrel=1
_majorver=9.3
pkgdesc="Beta version of the PostgreSQL database (includes both server and libs)"
arch=('i686' 'x86_64')
url="https://wiki.postgresql.org/wiki/HowToBetaTest"
license=('custom:PostgreSQL')
backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2' 'readline>=6.0' 'openssl>=1.0.0')
makedepends=('python2' 'perl')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support')
conflicts=('postgresql-libs' 'postgresql' 'postgresql-testing')
provides=("postgresql-libs=$_pkgver" "postgresql=$_pkgver")
source=("http://ftp.postgresql.org/pub/source/v$pkgver/postgresql-$pkgver.tar.bz2"
        postgresql-run-socket.patch
        postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
install=postgresql.install

build() {
  cd $srcdir/postgresql-$pkgver

  patch -Np1 < ../postgresql-run-socket.patch
  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety
  #--with-krb5 \
  #--with-tcl \

  make
  make -C contrib
}

package() {
  cd $srcdir/postgresql-$pkgver

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"
  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
md5sums=('f11cfe12cf04b5bf7f94de79e4ef7ec6'
         '75c579eed03ffb2312631f0b649175b4'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '89b48774b0dae7c37fbb0e907c3c1db8'
         '1c5a1f99e8e93776c593c468e2612985'
         'ea7f9f914900e60835d20cb95010e63c')
