# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker-git
_pkgname=pacemaker
pkgver=1.1.16.r34.gefb87a0
pkgrel=1
pkgdesc="advanced, scalable high-availability cluster resource manager"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${_pkgname}/"
license=('GPL2')
makedepends=('git' 'libxml2' 'inkscape' 'libqb-git')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python' 'libxslt' 'corosync-git' 'libesmtp')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  CPPFLAGS=-D_FORTIFY_SOURCE=0 \
  ./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --enable-systemd \
              --disable-upstart \
              --with-ais \
              --with-corosync \
              --with-cman \
              --with-cs-quorum \
              --with-nagios \
              --with-snmp \
              --with-esmtp \
              --with-acl
#             --with-nagios-plugin-dir=DIR
#             --with-nagios-metadata-dir=DIR
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:
