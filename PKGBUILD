# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgbase=gpgme
pkgname=(gpgme qgpgme)
pkgver=1.8.0
pkgrel=2
pkgdesc="A C wrapper library for GnuPG"
arch=('i686' 'x86_64')
url="http://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('libgpg-error' 'gnupg' 'qt5-base')
source=("https://www.gnupg.org/ftp/gcrypt/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"{,.sig}
        '0001-remove-a-forgotten-instance-of-libsuffix.patch')
sha256sums=('596097257c2ce22e747741f8ff3d7e24f6e26231fa198a41b2a072e62d1e5d33'
         'SKIP'
         'fb743604a031b9f8be816ccb643a78ed12a660d7cbeb8519387d7f44c7d33c8a')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 < "${srcdir}/0001-remove-a-forgotten-instance-of-libsuffix.patch"
}

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
