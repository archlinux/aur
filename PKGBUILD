# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Vanush Misha Paturyan <ektich+cfengine-aur@gmail.com>
# Maintainer: Alexey Shpakovsky <alexey at shpakovsky dot ru>
# https://aur.archlinux.org/cfengine.git 
#
# Contributor: Kuba Serafinowski <zizzfizzix AT gmail DOT com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=cfengine
pkgver=3.15.2
pkgrel=1
pkgdesc='Automated suite of programs for configuring and maintaining Unix-like computers.'
url='https://cfengine.com'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('lmdb' 'pcre' 'libxml2' 'pam' 'libyaml' 'curl' 'openssl')
makedepends=('which' 'inetutils')
optdepends=('libvirt' 'postgresql-libs' 'libmariadbclient' 'acl')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/${pkgname}-${pkgver}.tar.gz"
        "cfengine-masterfiles-${pkgver}.tar.gz::https://cfengine-package-repos.s3.amazonaws.com/tarballs/cfengine-masterfiles-${pkgver}.tar.gz"
        'cf-execd.service'
        'cf-monitord.service'
        'cf-serverd.service'
        'cfengine3.service'
        'CFE-3302.patch')

md5sums=('be04030c007dacd69ad705059a906495'
         'c5cd389a09e33e58e7d944e10013ea1e'
         '6edac71eaac0a19fc5b8129f17d82bb2'
         '199a7867b60a3e4013da4ac42343e22e'
         'f8783637895f6f3dd19a6ba689181d41'
         '4b89518da032b45073e46a993fd7fe26'
         'fbdb0935f146efedb9dcc9f11b5b2ff7')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
  cd ..
  cd ${pkgname}-masterfiles-${pkgver}
  patch -p1 <../CFE-3302.patch
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}

  export CFLAGS="$CFLAGS -fcommon"
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
  cd ..
  # now build masterfiles
  cd ${pkgname}-masterfiles-${pkgver}
  ./configure \
      --prefix=/usr/share/doc/cfengine/CoreBase \
      --with-core=../cfengine-${pkgver}
}

check() {
  cd ${pkgname}-${pkgver}
  make check
  cd ..
  cd ${pkgname}-masterfiles-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
  cd ..

  # masterfiles
  cd ${pkgname}-masterfiles-${pkgver}
  make DESTDIR=$pkgdir install
  cd ..

  install -D -m644 cf-execd.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-execd.service
  install -D -m644 cf-serverd.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-serverd.service
  install -D -m644 cf-monitord.service \
	  ${pkgdir}/usr/lib/systemd/system/cf-monitord.service
  install -D -m644 cfengine3.service \
	  ${pkgdir}/usr/lib/systemd/system/cfengine3.service


  install -d -m755 ${pkgdir}/var/cfengine/bin
  install -d -m755 ${pkgdir}/var/cfengine/masterfiles

  for f in $(ls ${pkgdir}/usr/bin); do
    /bin/ln -s /usr/bin/$f ${pkgdir}/var/cfengine/bin
  done
}

# vim:set ts=2 sw=2 et:
