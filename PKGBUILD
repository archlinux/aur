# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=duplicity-bzr
pkgver=930
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm.'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/duplicity/'
license=('GPL')
depends=('gnupg' 'librsync' 'ncftp' 'python2-paramiko')
optdepends=('lftp: FTPS backend'
            'python2-boto: Amazon S3 backend'
            'python2-gobject: GIO backend'
            'gvfs: GIO backend'
            'python2-gdata: Google Docs backend'
            'python2-httplib2: Ubuntu One backend'
            'python2-oauthlib: Ubuntu One backend'
            'rsync: rsync backend')
makedepends=('bzr')
source=(bzr+lp:duplicity)
sha512sums=('SKIP')
#_bzrtrunk='https://code.launchpad.net/~duplicity-team/duplicity/trunk'
#_bzrmod=${pkgname}
conflicts=("${pkgname//-bzr/}")

pkgver() {
  cd "${srcdir}/${pkgname//-bzr/}"
  bzr revno
}

prepare() {
  cd "${srcdir}/${pkgname//-bzr/}"

  python2 dist/makedist ${pkgver}
  tar -C "${srcdir}" -xf \
      "${srcdir}/${pkgname//-bzr/}/${pkgname//-bzr/}-${pkgver}.tar.gz"
}

build() {
  cd "${srcdir}/${pkgname//-bzr/}-${pkgver}"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python$_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python$_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}/${pkgname//-bzr/}-${pkgver}"
  
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # fix broken documentation permissions until upstream does (FS#27301)
  chmod 644 "${pkgdir}/usr/share/man/man1/${pkgname//-bzr/}.1"
  chmod 644 "${pkgdir}/usr/share/man/man1/rdiffdir.1"
  chmod 644 "${pkgdir}/usr/share/doc/${pkgname//-bzr/}-${pkgver}"/*
}
