# Maintainer: Pandada8 < pandada8@gmail.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2-fast
pkgver=1.19.0
pkgrel=1
pkgdesc='Aria2 Download utility with little patch to maximize aria2 download connections'
arch=('i686' 'x86_64')
url='http://aria2.sourceforge.net/'
license=('GPL')
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates')
checkdepends=('cppunit')
provides=('aria2')
conflicts=('aria2')
source=("http://downloads.sourceforge.net/aria2/aria2-${pkgver}.tar.bz2" "aria2-1.16.patch")

build() {
  cd aria2-${pkgver}

  patch -Np1 < ../aria2-1.16.patch

  ./configure \
    --prefix=/usr \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

check() {
  cd aria2-${pkgver}

  make check
}

package() {
  cd aria2-${pkgver}

  make DESTDIR=${pkgdir} install

  # add bash completion (aria2 automatically installs to a temporary target directory)
  install -d ${pkgdir}/usr/share/bash-completion/completions
  install -m644 ${pkgdir}/usr/share/doc/aria2/bash_completion/aria2c \
    ${pkgdir}/usr/share/bash-completion/completions
  rm -rf ${pkgdir}/usr/share/doc/aria2/bash_completion
}
md5sums=('ad6eb57511a05ce823e194eb71a7e9fa'
         'b4e0837bd7c255b645c9a8bbdd550e3f')
