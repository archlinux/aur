# Maintainer: Benjamin Bukowski <b at bkwsk dot de>
# Maintainer: Ido Kanner <idokan at@at gmail dot . dot . com>
pkgname=firebirdsql-server
_pkgver=4.0.2
pkgver=${_pkgver}.2816
pkgrel=1
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=('x86_64')
url="http://www.firebirdsql.org/"
license=('custom:IPL' 'custom:IDPL')
makedepends=('unzip')
depends=('libtommath' 'libedit' 'libtomcrypt' 'libiconv')
provides=("libfbclient=${pkgver}")
conflicts=('firebird-superserver' 'firebird-classicserver' 'libfbclient' 'firebird')
install=firebird-server.install
backup=('etc/firebird/firebird.conf' 'etc/firebird/fbtrace.conf' 'etc/firebird/databases.conf' 'var/lib/firebird/system/security4.fdb')
source=("https://github.com/FirebirdSQL/firebird/releases/download/v${_pkgver}/Firebird-${pkgver}-0.tar.xz"
        'firebird-tmpfiles.conf'
        'firebird-sysusers.conf'
        'firebird.service')
sha256sums=('fb28140cec1eb32ea683bdf552dd1d6b7d455db61282fcf96fae18b3103af6c6'
            '4ae6765011641202b7f8220c7c8190f097c6f615a02a8445837059ec164622a5'
            'b106ca58628c9e1d1983533897f1d18d6262c1cc3e62651f361a104ff679c161'
            'dc2a65713dd1539bef122daeff1f632871ec080cf4955a0a5c32aeb7309d3c78')

build() {
  cd "${srcdir}/Firebird-${pkgver}-0"

  ./autogen.sh \
    --prefix=/usr \
    --with-fbbin=/usr/bin \
    --with-fbsbin=/usr/lib/firebird/bin \
    --with-fbconf=/etc/firebird \
    --with-fbdoc=/usr/share/doc/firebird \
    --with-fbglock=/run/firebird \
    --with-fbhelp=/usr/share/doc/firebird/help \
    --with-fbinclude=/usr/include/firebird \
    --with-fblib=/usr/lib \
    --with-fblog=/var/log/firebirdsql \
    --with-fbmsg=/usr/lib/firebird/msg \
    --with-fbplugins=/usr/lib/firebird/plugins \
    --with-fbsecure-db=/var/lib/firebird/system \
    --with-fbsample=/usr/share/doc/firebird/sample \
    --with-fbsample-db=/var/lib/firebird/data \
    --with-fbintl=/usr/lib/firebird/intl \
    --without-fbmisc \
    --with-editline \
    --with-system-editline

	sed -i /TERMLIB\ :=\ -lyes/d gen/make.defaults

  make
}

package() {
  cd "${srcdir}/Firebird-${pkgver}-0/gen"

  ./install/makeInstallImage.sh

  cd "${srcdir}/Firebird-${pkgver}-0"

  cp -av gen/buildroot/* "${pkgdir}/"

  install -Dm644 "${srcdir}/firebird-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/firebird.conf"
  install -Dm644 "${srcdir}/firebird-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/firebird.conf"
  install -Dm644 "${srcdir}/firebird.service" "${pkgdir}/usr/lib/systemd/system/firebird.service"
  install -Dm644 "${pkgdir}/etc/firebird/IPLicense.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/etc/firebird/IDPLicense.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Remove unused files and dirs
  rm "${pkgdir}/etc/firebird/IPLicense.txt"
  rm "${pkgdir}/etc/firebird/IDPLicense.txt"
  rm "${pkgdir}/etc/firebird/README.md"
  rm "${pkgdir}/etc/firebird/CHANGELOG.md"
  rm -rf "${pkgdir}/var/log"
  rm -rf "${pkgdir}/run"

  mv "${pkgdir}/usr/bin/isql" "${pkgdir}/usr/bin/isql-fb"

  chmod -R 755 "${pkgdir}/usr/share/doc/firebird"
  chmod -R 750 "${pkgdir}/var/lib/firebird"
  chown -R 184:184 "${pkgdir}/var/lib/firebird"
}

# vim:set ts=2 sw=2 et:

