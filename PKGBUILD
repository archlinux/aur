# Maintainer:  Please see AUR page for contact info.
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Fernando Jiménez Solano <fjim at sdfeu dot org>
# Contributor: Evangelos Foutras <evangelos at foutrelis dot com>
# Contributor: Link Dupont <link @ subpop dot net>
# Contributor: Pierre Bourdin <pierre at pi3rrot dot net>
# Contributor: Alexander von Gluck IV <kallisti5 at unixzen dot com>
# Contributor: dieghen89 <dieghen89 at gmail dot com>

pkgname=cherokee-git
pkgver=1.2.104.r5816
pkgrel=2
pkgdesc="A very fast, flexible and easy to configure Web Server"
arch=('i686' 'x86_64')
url="http://www.cherokee-project.com/"
license=('GPL2')
depends=('openssl' 'pcre' 'python2')
makedepends=('libldap' 'pam' 'libmariadbclient' 'php-fpm' 'ffmpeg' 'geoip' 'rrdtool')
optdepends=('libldap: ldap validator'
            'pam: pam validator' 
	    'php-fpm: php5 support'
            'libmariadbclient: mysql validator'
            'ffmpeg: Audio/Video streaming handler'
            'geoip: GeoIP rule module'
            'rrdtool: RRDtool based information collector')
backup=('etc/cherokee/cherokee.conf'
        'etc/logrotate.d/cherokee'
        'etc/pam.d/cherokee')
options=('!libtool')
provides=('cherokee')
conflicts=('cherokee')
source=(
  "$pkgname::git+https://github.com/cherokee/webserver.git"
  'cherokee.logrotate'
  'cherokee.service')
sha256sums=('SKIP'
            '20e26d633f8c1cd90eb21f41dd163b73a83846e405b1ce995e072c4efefc522e'
            '2838afb60dbdfd946c767b8b7170297860baf1638feb7f1075e2d3cf04838407')

pkgver() {
  cd "$srcdir/$pkgname"

  printf "%s.r%s" \
    "$(git describe --abbrev=0 --tags|sed 's/^v//')" \
    "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Use subdirectory for logs
  sed -i -r 's|(%localstatedir%/log)|\1/cherokee|' cherokee.conf.sample.pre

  # Use Python 2 in cherokee-admin
  sed -i 's|"python"|"python2"|' cherokee/main_admin.c
}

build() {
  cd "$srcdir/$pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --with-wwwroot=/srv/cherokee/http \
    --with-cgiroot=/src/cherokee/cgi-bin \
    --with-wwwuser=http \
    --with-wwwgroup=http \
    --disable-static \
    --with-php=/usr/bin/php-fpm \
    --with-python=/usr/bin/python2 \
    --enable-os-string="Arch Linux"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir"/ install

  # PAM configuration file for cherokee
  install -D -m644 pam.d_cherokee "$pkgdir"/etc/pam.d/cherokee

  # Fix ownership of /var/lib/cherokee/graphs
  chown -R http:http "$pkgdir"/var/lib/cherokee/graphs

  # Use Python 2 (mostly fixed upstream, from the Cherokee PKGBUILD)
  sed -i 's/env python$/&2/' "$pkgdir"/usr/bin/CTK-run

  # Compile Python scripts
  python2 -m compileall "$pkgdir"
  python2 -O -m compileall "$pkgdir"

  # Move files to their resting places
  install -d -o http -g http "$pkgdir"/var/log/cherokee
  install -Dm644 "$srcdir"/cherokee.logrotate "$pkgdir"/etc/logrotate.d/cherokee
  install -Dm644 "$srcdir"/cherokee.service "$pkgdir"/usr/lib/systemd/system/cherokee.service

  # It seems /var/run is now owned by filesystem... Ah! The irony. Oh! The pain!
  rmdir "$pkgdir"/var/run
}

# vim: ft=sh:ts=2:sw=2:et
