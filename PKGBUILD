# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_mintrel=betsy
_pkgname=nemo-seahorse
pkgname="${_pkgname}-nonautilus"
pkgver=2.8.0
pkgrel=2
pkgdesc="An extension for Nemo which allows encryption and decryption of OpenPGP files using GnuPG. (without nautilus dependency)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('libcryptui' 'nemo' 'gcr>=3.4.0' 'gpgme>=1.2.0' )
makedepends=('intltool' 'gnupg' 'gnome-common' 'gnome-keyring')
groups=('nemo-extensions')
conflicts=('nemo-seahorse' 'seahorse-nautilus' 'nemo-seahorse-git')
optdepends=('seahorse: For seahorse support')
provides=('nemo-seahorse')
install=${pkgname}.install
options=('!libtool' '!emptydirs')

source=("${pkgname}.install"
	"http://packages.linuxmint.com/pool/main/n/$_pkgname/${_pkgname}_${pkgver}%2b${_mintrel}.tar.gz")
md5sums=('bb1003e1d7217fd9b9610f8cdd5a07aa'
         'eaeb054acb8a8b70b809723a1a46056a')


prepare() {
  cd ${_pkgname}-${pkgver}+${_mintrel}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  msg2 "Adding support for gpg newer than version 2.0"
  sed -i "s/1.2 1.4 2.0/1.2 1.4 2.0 2.1/" configure.ac
}

build() {
  cd ${_pkgname}-${pkgver}+${_mintrel}
    
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir="/usr/lib/${_pkgname}" \
    --disable-static
  make
}

package() {
  cd ${_pkgname}-${pkgver}+${_mintrel}
  make DESTDIR="${pkgdir}" install
}

