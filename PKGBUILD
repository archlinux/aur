# Maintainer: Dino Morelli <dino@ui3.info>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>

pkgname=darcs
pkgver=2.10.1
pkgrel=1
pkgdesc='Elegant and powerful distributed revision control system'
arch=('i686' 'x86_64')
url='http://darcs.net/'
license=('GPL')
depends=('curl' 'libffi')
makedepends=('ghc' 'cabal-install')
options=('strip')
source=("http://darcs.net/releases/${pkgname}-${pkgver}.tar.gz")

sha256sums=('f1ef65b43780e7593ca1afdae5ecf44ed91d62cc1be360693a52c5ff7b57ee94')

# PKGBUILD functions

build() {
   cd ${srcdir}/${pkgname}-${pkgver}

   # I've seen this cause a problem in the past. If necessary, do a
   # cabal update manually and comment it out here.
   cabal update

   cabal sandbox init
   cabal install --only-dependencies
   cabal configure -O --prefix=/usr
   cabal build
}

package() {
   cd ${srcdir}/${pkgname}-${pkgver}

   cabal copy --destdir=${pkgdir}

   # darcs is both a binary and a library. This packaging exists
   # solely to give the user the darcs binary. Unfortunately the only
   # way I found to prevent installation of these files was to blow
   # away this dir just prior to packaging:
   rm -r ${pkgdir}/usr/lib

   chmod 755 ${pkgdir}/usr/share/man/man1/${pkgname}.1
}
