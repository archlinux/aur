# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
pkgname=opensmtpd-extras
pkgver=5.7.1
pkgrel=2
pkgdesc="Additional filters, tables, queues, etc. for OpenSMTPd"
arch=('i686' 'x86_64')
url="https://opensmtpd.org"
license=('custom:opensmtpd')
depends=('opensmtpd')
makedepends=('python2' 'lua' 'perl' 'libmariadbclient' 'postgresql-libs' 'hiredis' 'sqlite' 'libasr' 'openssl')
optdepends=('python2: python support for filters, tables, scheduler, and queues'
            'clamav: clamav filters'
            'lua: lua support for filters'
            'perl: perl support for filters'
            'spamassassin: spamassassin filters'
            'libmariadbclient: mysql support for tables'
            'postgresql-libs: postgresql support for tables'
            'hiredis: redis support for tables'
            'sqlite: sqlite support for tables')
backup=('etc/smptd/filter-regex.conf')
source=("https://www.opensmtpd.org/archives/$pkgname-$pkgver.tar.gz")
sha256sums=('b56dc24427afe7d6156c85232427fe33a260aca8873eb118d0229dff3a248dce')

prepare() {
  cd "$pkgname-$pkgver"

  # Fix for python2
  sed -i 's/python-config/python2-config/g' configure

  # Fix config file locations
  sed -i 's;/etc/mail/filter-regex.conf;/etc/smtpd/filter-regex.conf;g' "extras/wip/filters/filter-regex/filter_regex.c"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/smtpd \
    --libexecdir=/usr/lib/smtpd \
    --with-sock-dir=/run \
    --with-privsep-path=/var/empty \
    --with-privsep-user=smtpd \
    --with-queue-user=smtpq \
    --with-filter-clamav \
    --with-filter-dkim-signer \
    --with-filter-dnsbl  \
    --with-filter-lua \
    --with-filter-monkey \
    --with-filter-pause \
    --with-filter-perl  \
    --with-filter-python \
    --with-filter-regex \
    --with-filter-spamassassin \
    --with-filter-trace \
    --with-filter-void \
    --with-queue-null \
    --with-queue-python \
    --with-queue-ram \
    --with-table-ldap \
    --with-table-mysql \
    --with-table-postgres \
    --with-table-redis \
    --with-table-socketmap \
    --with-table-passwd \
    --with-table-python \
    --with-table-sqlite \
    --with-scheduler-ram \
    --with-scheduler-python
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "extras/wip/filters/filter-regex/filter-regex.conf" "$pkgdir/etc/smtpd/filter-regex.conf"
  install -Dm644 "extras/wip/queues/queue-python/scripts/queue_ram.py" "$pkgdir/usr/share/opensmtpd/queues/queue-python/scripts/queue_ram.py"
}
