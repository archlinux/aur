# Maintainer: Vanush Misha Paturyan <ektich+cfengine-aur@gmail.com>
# https://aur.archlinux.org/cfengine.git 
#
# Contributor: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=cfengine
pkgver=3.10.0
pkgrel=1
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='http://www.cfengine.org'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('lmdb' 'pcre' 'libxml2' 'pam' 'libyaml' 'curl')
makedepends=('which')
optdepends=('libvirt' 'postgresql-libs' 'libmariadbclient' 'acl')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/${pkgname}-${pkgver}.tar.gz"
        "cfengine-masterfiles-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-masterfiles-${pkgver}.tar.gz"
        'cf-execd.service'
        'cf-monitord.service'
        'cf-serverd.service'
	'cfengine3.service')

md5sums=('6ea3ad2cd2adb972ccbd2eb7d8c95bbb'
         '4a465dd9dec3fc68c8548953f58cf9c2'
         '6edac71eaac0a19fc5b8129f17d82bb2'
         '199a7867b60a3e4013da4ac42343e22e'
         'f8783637895f6f3dd19a6ba689181d41'
         '4b89518da032b45073e46a993fd7fe26')

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
