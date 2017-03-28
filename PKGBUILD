# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme)
pkgver=1.9.0
pkgrel=1
pkgdesc="A C wrapper library for GnuPG"
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('1b29fedb8bfad775e70eafac5b0590621683b2d9869db994568e6401f4034ceb'
            'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr --disable-fd-passing --disable-static \
              --disable-gpgsm-test
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_gpgme() {
  depends=('libgpg-error' 'gnupg>=2')
  options=('!emptydirs')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # split qgpgme
  rm -r "${pkgdir}"/usr/include/{qgpgme,QGpgME}/
  rm -r "${pkgdir}"/usr/lib/{cmake/QGpgme/,libqgpgme.*}
}

package_qgpgme() {
  pkgdesc="Qt bindings for GPGme"
  depends=('gpgme' 'qt5-base')

  cd ${pkgbase}-${pkgver}/lang/qt
  make DESTDIR="${pkgdir}" install
}
