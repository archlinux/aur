# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Moritz Rudert (helios) <helios@planetcyborg.de>
# Contributer: Janusz Lewandowski <lew21@enves.pl>
# Contributor: ushi <ushi+arch@honkgong.info>
# Maintainer: dequis <dx@dxzone.com.ar>

pkgname=jabberd2
pkgver=2.5.0
pkgrel=1
pkgdesc='Scalable, architecturally sound, and extensible XMPP server'
arch=('i686' 'x86_64' 'armv6h')
url='http://jabberd2.org/'
license=('GPL')
options=('!libtool')
depends=('udns' 'expat' 'gsasl' 'libidn' 'openssl')
optdepends=('sqlite3' 'postgresql-libs' 'libmysqlclient')
makedepends=('sqlite3' 'postgresql-libs' 'libmysqlclient')
install=install

source=(
  "https://github.com/jabberd2/jabberd2/releases/download/jabberd-${pkgver}/jabberd-${pkgver}.tar.xz"
  'pam_jabberd'
)

sha256sums=(
  '9ec4a8be6c01fe68cccee347e08aab34399205ecfe3557985debc368b86aeb8a'
  '89809dbf3f42f9df4690c3f98c1c74174f53774859d88374947b4123552c2dc8'
)

backup=(
  'etc/jabberd/c2s.xml'
  'etc/jabberd/jabberd.cfg'
  'etc/jabberd/router-filter.xml'
  'etc/jabberd/router-users.xml'
  'etc/jabberd/router.xml'
  'etc/jabberd/s2s.xml'
  'etc/jabberd/sm.xml'
  'etc/jabberd/templates/roster.xml'
  'etc/pam.d/jabberd'
)

build() {
  cd "${srcdir}/jabberd-${pkgver}"

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib \
    --sysconfdir=/etc/jabberd \
    --enable-sqlite \
    --enable-mysql \
    --enable-pgsql \
    --enable-pam \
    --enable-pipe \
    --enable-anon

  make
}

package() {
  cd "${srcdir}/jabberd-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/etc/pam.d/"
  install ../pam_jabberd "${pkgdir}/etc/pam.d/jabberd"

  install -d "${pkgdir}/usr/share/jabberd/"
  install tools/{db-setup.*,pipe-auth.pl,jabberd-authpipe-pam-0.1.pl} "${pkgdir}/usr/share/jabberd/"

  chmod o= "${pkgdir}/etc/jabberd/"

  rm -fr "${pkgdir}/usr/etc"
  rm -f "${pkgdir}/etc/jabberd/"jabberd-*.conf
  rm -f "${pkgdir}/etc/jabberd/"{,templates/}*.dist
}
