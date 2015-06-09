# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=ubuntu-tweak
pkgver=0.8.7
pkgrel=1
pkgdesc="An easy configuration tool for system and desktop settings"
arch=(any)
url="http://ubuntu-tweak.com/"
license=(GPL)
depends=(compiz-ubuntu python2 gconf libunique3 hicolor-icon-theme
         python2-defer python2-lxml)
# Also depends on polkit-gnome or polkit-qt
makedepends=(python2-distutils-extra python2-distribute)
options=(!emptydirs)
install=${pkgname}.install
source=("https://launchpad.net/${pkgname}/${pkgver%.*}.x/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        https://github.com/chenxiaolong/AUR-Files/raw/4073120d7dcf89bd237b771717b632cbe45d394d/ubuntu-tweak/0001-Arch-Linux-fixes.patch)
sha512sums=('edf17c276a3744ef5c42fe5d12f40fa530997fd91ae3f3703651afa60302817397b8123ca7543c5652d692166731ef25e8c556d4498451cc6b4a5ab673a33a21'
            'd779424e82e4843fcaeff39ba6dfdd66bd7ed8793d0aaa5640e716e819d9ffbefe53989cddec9379edc31309d20a55a16eaa93fc33743fba3687c0286e292f81')

prepare() {
  cd "${pkgname}-${pkgver}"

  # - Removes any apt/dpkg/deb related functions
  # - Removes any checks and references to other distros and replaces them
  #   with something appropriate for Arch Linux
  # - Remove any features that require root (only Login manager right now)
  #   since they use a PolicyKit API exposed by aptdaemon.
  # - Remove code that handles ut:// URL's
  patch -p1 -i ../0001-Arch-Linux-fixes.patch
}

package() {
  cd "${pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  # Python 2 fix
  sed -i 's|\(#!.*bin.*python$\)|\12|g' $(grep -rl '#!.*python[ ]*$' "${pkgdir}")
}
