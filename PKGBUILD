# Maintainer: Vanush Misha Paturyan <ektich+cfengine-aur@gmail.com>
# https://github.com/zizzfizzix/pkgbuilds
#
# Contributor: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=cfengine
pkgver=3.7.3
pkgrel=2
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='http://www.cfengine.org'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('lmdb' 'openssl' 'pcre' 'libxml2' 'pam')
makedepends=('which')
optdepends=('libvirt' 'postgresql-libs' 'libmariadbclient' 'acl')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/${pkgname}-${pkgver}.tar.gz"
        "cfengine-masterfiles-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-masterfiles-${pkgver}.tar.gz"
        'cf-execd.service'
        'cf-monitord.service'
        'cf-serverd.service'
	'cfengine3.service')
md5sums=('dcd0a8b9490dfafad124c5135900f08b'
         'f7d1260a6fe9f6ce9a00c70c984a7252'
         'a6d35b4460d5478afe03c7b920f09da6'
         '674271fe623d27b0410642cabc1d442e'
         '542358aab95c89017ca6dc65b864c079'
         '2f950573baa3dfa7ee06e011ece2f2d8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-workdir=/var/${pkgname} \
    --with-openssl \
    --with-pcre \
    --with-libacl=check \
    --with-libxml2 \
    --with-libvirt=check \
    --with-lmdb \
    --with-mysql=check \
    --with-postgresql=check

  make
  # now build masterfiles
  cd ${srcdir}/${pkgname}-masterfiles-${pkgver}
  ./configure \
      --prefix=/usr/share/doc/cfengine/CoreBase \
      --with-core=../cfengine-${pkgver}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install

  # masterfiles
  cd ${srcdir}/${pkgname}-masterfiles-${pkgver}
  make DESTDIR=$pkgdir install

  install -D -m644 ${srcdir}/cf-execd.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-execd.service
  install -D -m644 ${srcdir}/cf-serverd.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-serverd.service
  install -D -m644 ${srcdir}/cf-monitord.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-monitord.service
  install -D -m644 ${srcdir}/cfengine3.service \
	  ${pkgdir}/usr/lib/systemd/system/cfengine3.service


  install -d -m755 ${pkgdir}/var/cfengine/bin
  install -d -m755 ${pkgdir}/var/cfengine/masterfiles

  for f in $(ls ${pkgdir}/usr/bin); do
    /bin/ln -s /usr/bin/$f ${pkgdir}/var/cfengine/bin
  done
}

# vim:set ts=2 sw=2 et:
