# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Moritz Rudert (helios) <helios@planetcyborg.de>
# Contributer: Janusz Lewandowski <lew21@enves.pl>
# Contributor: ushi <ushi+arch@honkgong.info>
# Maintainer: dequis <dx@dxzone.com.ar>
# Maintainer: sxw <sxw@chronowerks.de>

pkgname=jabberd2
_pkgname=jabberd
pkgver=2.6.1
pkgrel=1
pkgdesc='Scalable, architecturally sound, and extensible XMPP server'
arch=('i686' 'x86_64' 'armv6h')
url='http://jabberd2.org/'
license=('GPL')
options=('!libtool')
depends=('udns' 'expat' 'gsasl' 'libidn' 'openssl')
optdepends=('sqlite3' 'postgresql-libs')
makedepends=('sqlite3' 'postgresql-libs' 'autoconf-archive')
install=install

source=(
  "https://github.com/jabberd2/jabberd2/releases/download/jabberd-${pkgver}/jabberd-${pkgver}.tar.xz"
  "https://patch-diff.githubusercontent.com/raw/jabberd2/jabberd2/pull/129.patch"
  'pam_jabberd'
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

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < ../129.patch
  libtoolize --force
  aclocal
  autoheader
  automake --add-missing --force-missing
  autoconf
}

build() {
  cd "${srcdir}/jabberd-${pkgver}"

  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib \
    --sysconfdir=/etc/jabberd \
    --enable-sqlite \
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

sha512sums=('845347d2b812f6232ac84771e276c0783636406d73ae3cedbc5c28119f33c40a1c995827050c0227d7260dadba81434692059ff5a0b911e1c0c92f821e33eeea'
            'f3bdd2d35ca76e13532b890aff4d36d925f9832ffb300a70b637a6d68c6fa56761bdc67a1bc3befbfe3a3465ee4ca6f271d053df3e29f7a2708b7835c9d4dd00'
            'e6507a2a7e226398253623bb46db7ae853b01649b7ac00f3eee0a9b57c2ef0e8ac1f90c4934269f5fe2b7667e56572bed233b847d0b66a3fd37a88b7ed8adc31')
