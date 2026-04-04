# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian Faltoni <sebastian.faltoni@gmail.com>

pkgname=dbmail-git
_pkgname=dbmail
pkgver=v3.5.5.r27.gfcecf6fd
pkgrel=1
pkgdesc="Fast and scalable sql based mail services"
arch=('x86_64')
url="https://github.com/dbmail/dbmail"
license=('GPL-2.0-or-later')
depends=(
  'glib2'
  'glibc'
  'gmime3'
  'libevent'
  'libzdb'
  'libxcrypt'
  'mhash'
  'openssl'
  'systemd-libs'
)
makedepends=(
  'asciidoc'
  'docbook-xsl'
  'docbook-xml'
  'git'
  'libldap'
  'libsieve'
  'mariadb-libs'
  'postgresql-libs'
  'sqlite'
  'systemd'
  'xmlto'
)
optdepends=(
  'libldap: for LDAP authentication'
  'libsieve: for dbmail-sieve'
)
provides=('dbmail')
conflicts=('dbmail')
source=("git+https://github.com/dbmail/dbmail.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/-\(alpha\|beta\|rc\)/\1/g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
#  patch -p1 < ../noop-fetch-response-fix2.patch
  sed -i 's|nogroup|nobody|g' dbmail.conf
  sed -i \
    -e 's|@runstatedir@|/run|g' \
    -e 's|dbmail:dbmail|nobody:nobody|g' \
    systemd/*.service.in
  sed -i \
    -e 's|dbmail dbmail|nobody nobody|g' \
    systemd/*.tmpfiles.in

  autoreconf -fiv
}

build() {
  local configure_options=(
    --enable-manpages
    --enable-systemd
    --prefix=/usr
    --runstatedir=/run
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-ldap
    --with-sieve
  )

  cd $_pkgname
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname

  install -dm0755 "$pkgdir"/usr/lib/systemd/system
  install -dm0755 "$pkgdir"/usr/lib/tmpfiles.d
  install -dm0755 "$pkgdir"/usr/share/dbmail
  install -dm0755 "$pkgdir"/var/log/dbmail
  make DESTDIR="$pkgdir" install

  install -Dm644 dbmail.conf "$pkgdir"/etc/dbmail.conf.sample
  cp -r sql/* "$pkgdir"/usr/share/dbmail/
  cp -a contrib "$pkgdir"/usr/share/dbmail/
  cp dbmail.schema "$pkgdir"/usr/share/dbmail/
}
