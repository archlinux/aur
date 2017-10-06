# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_pkgname=nemo-seahorse
pkgname="${_pkgname}-nonautilus"
pkgver=3.4.1
pkgrel=1
pkgdesc="An extension for Nemo which allows encryption and decryption of OpenPGP files using GnuPG. (without nautilus dependency)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('libcryptui' 'nemo>=3.2' 'gcr>=3.4.0' 'gpgme>=1.2.0' )
makedepends=('intltool' 'gnupg' 'gnome-common' 'gnome-keyring')
groups=('nemo-extensions')
conflicts=('nemo-seahorse' 'seahorse-nautilus' 'nemo-seahorse-git')
optdepends=('seahorse: For seahorse support')
provides=('nemo-seahorse')
options=('!libtool' '!emptydirs')

#source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
source=("git+https://github.com/linuxmint/nemo-extensions.git#tag=deee5be100eed694f4dfa995be7213ef3eb7998b")
md5sums=('SKIP')


prepare() {
#  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
  cd "${srcdir}/nemo-extensions/${_pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  msg2 "Adding support for gpg newer than version 2.1"
  sed -i "s/1.2 1.4 2.0 2.1/1.2 1.4 2.0 2.1 2.2/" configure.ac
}

build() {
#  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
  cd "${srcdir}/nemo-extensions/${_pkgname}"

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
#  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
  cd "${srcdir}/nemo-extensions/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
