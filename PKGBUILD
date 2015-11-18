# Maintainer: Dino Morelli <dino@ui3.info>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>

pkgname=darcs-sandbox
_pkgname=darcs
pkgver=2.10.2
pkgrel=1
pkgdesc='Elegant and powerful distributed revision control system. Standalone sandbox build.'
arch=('i686' 'x86_64')
url='http://darcs.net/'
license=('GPL')
depends=('curl' 'libffi')
makedepends=('cabal-install' 'chrpath' 'ghc' 'inotify-tools')
options=('strip')
source=("http://darcs.net/releases/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('6337d3fac04711fa2ef5813558b409c59166c5599b0c9d68c418d21cdccfb327')

# PKGBUILD functions

build() {
   cd ${srcdir}/${_pkgname}-${pkgver}

   # I've seen this cause a problem in the past. If necessary, do a
   # cabal update manually and comment it out here.
   cabal update

   cabal sandbox init
   cabal install --only-dependencies
   cabal configure -O --prefix=/usr

   binPath=${srcdir}/${_pkgname}-${pkgver}/dist/build/${_pkgname}/${_pkgname}

   cabal build

   # This build often weirdly keeps the file open even after the
   # process returns, && doesn't work. So, wait for it:
   inotifywait -e close $binPath

   # Remove bogus rpath data that points to temp build dir
   chrpath -d $binPath
}

package() {
   cd ${srcdir}/${_pkgname}-${pkgver}

   cabal copy --destdir=${pkgdir}

   # darcs is both a binary and a library. This packaging exists
   # solely to give the user the darcs binary. Unfortunately the only
   # way I found to prevent installation of these files was to blow
   # away this dir just prior to packaging:
   rm -r ${pkgdir}/usr/lib

   chmod 755 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
}
