# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Moritz Rudert (helios) <helios@planetcyborg.de>
# Contributer: Janusz Lewandowski <lew21@enves.pl>
# Contributor: ushi <ushi+arch@honkgong.info>
# Contributor: dequis <dx@dxzone.com.ar>
# Contributor: sxw <sxw@chronowerks.de>
# Maintainer: Erich Eckner <arch at eckner dot net>

pkgname=jabberd2
pkgver=r1175.376e632
_commit=${pkgver#*.}
pkgrel=17
pkgdesc='Scalable, architecturally sound, and extensible XMPP server'
arch=('i686' 'pentium4' 'x86_64' 'armv6h')
url='http://jabberd2.org/'
license=('GPL')
options=('!libtool')
depends=('udns' 'expat' 'gsasl' 'libidn' 'openssl')
optdepends=('sqlite3' 'postgresql-libs')
makedepends=('git' 'sqlite3' 'postgresql-libs' 'autoconf-archive')
install=install
source=(
  "${pkgname}::git+https://github.com/${pkgname}/${pkgname}.git#commit=${_commit}"
  'pam_jabberd'
)
sha512sums=('SKIP'
            'e6507a2a7e226398253623bb46db7ae853b01649b7ac00f3eee0a9b57c2ef0e8ac1f90c4934269f5fe2b7667e56572bed233b847d0b66a3fd37a88b7ed8adc31')
conflicts=('jabberd2-git')

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

pkgver() {
  printf "r%s.%s" "$(
    git -C "${srcdir}/${pkgname}" rev-list --count ${_commit}
  )" "$(
    git -C "${srcdir}/${pkgname}" rev-parse --short ${_commit}
  )"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  libtoolize --force
  aclocal
  autoheader
  automake --add-missing --force-missing
  autoconf
}

build() {
  cd "${srcdir}/${pkgname}"

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib \
    --sysconfdir=/etc/jabberd \
    --enable-sqlite \
    --enable-pgsql \
    --enable-pam \
    --enable-pipe \
    --enable-anon \
    --enable-debug

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/etc/pam.d/"
  install ../pam_jabberd "${pkgdir}/etc/pam.d/jabberd"

  install -d "${pkgdir}/usr/share/jabberd/"
  install tools/{db-setup.*,pipe-auth.pl,jabberd-authpipe-pam-0.1.pl} "${pkgdir}/usr/share/jabberd/"

  chmod -R o= "${pkgdir}/etc/jabberd/"

  rm -fr "${pkgdir}/usr/etc"
  rm -f "${pkgdir}/etc/jabberd/"jabberd-*.conf
  rm -f "${pkgdir}/etc/jabberd/"{,templates/}*.dist
}
