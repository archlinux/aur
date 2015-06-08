# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_mintrel=rafaela
_pkgname=nemo-seahorse
pkgname="${_pkgname}-nonautilus"
pkgver=2.6.0
pkgrel=1
pkgdesc="An extension for Nemo which allows encryption and decryption of OpenPGP files using GnuPG. (without nautilus dependency)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('gconf' 'libcryptui' 'nemo' 'gcr>=3.4.0')
makedepends=('intltool' 'gnupg' 'gnome-common' 'gnome-keyring')
groups=('nemo-extensions')
conflicts=('nemo-seahorse' 'seahorse-nautilus' 'nemo-seahorse-git')
provides=('nemo-seahorse')
install=${pkgname}.install
options=('!libtool' '!emptydirs')

source=("${pkgname}.install"
	"http://packages.linuxmint.com/pool/main/n/$_pkgname/${_pkgname}_${pkgver}%2b${_mintrel}.tar.gz")
md5sums=('bb1003e1d7217fd9b9610f8cdd5a07aa'
         'aa0f8d834d81d152eda0b93fba725b42')


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

