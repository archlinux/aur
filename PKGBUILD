# $Id: PKGBUILD 309613 2018-03-20 14:11:49Z dvzrv $
# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=lash
pkgver=0.6.0~rc2
_relver=0.6.0.594
pkgrel=13
pkgdesc="A session management system for JACK and ALSA"
arch=('x86_64')
url="http://lash.nongnu.org/"
license=('GPL2')
depends=('jack' 'python2')
makedepends=('gtk2')
optdepends=('gtk2: For lash_panel, lash_save_button and lash_synth')
source=("https://download.savannah.gnu.org/releases/lash/${pkgname}-${pkgver}.tar.bz2"
        "fix-manual-generation.patch")
sha512sums=('704e24ccadccb469e820be5fb58dd4d953a8fc2903cd857a290267a87dda596639ec381d5cb7cdfcd715df7d98d6570e52731bddd17f8a3425edd8b699632401'
            '25bb9f97bc6ff7543fea39242bc321b40cd35ba042248671e958348f9e250f810ea1e4753918aceba799b0fdd886184af57a7c497796034b999ca8d6b85e1252')

prepare() {
  cd "${pkgname}-${_relver}"
  patch -Np0 -i "../fix-manual-generation.patch"
  # Python2 fixes
  export PYTHON="python2"
  sed -i "s#env python#&2#" clients/lash_control
}

build() {
  cd "${pkgname}-${_relver}"
  export LDFLAGS="-ldl -lm"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${_relver}"
  make DESTDIR="${pkgdir}" install
  # docs
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
