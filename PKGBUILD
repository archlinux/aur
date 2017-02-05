# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>
# Contributor: David El-Saig <daud.ici@gmail.com>

pkgname=libnds
pkgver=1.6.1
_pkgverexamples=20170124
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('devkitarm')
optdepends=('maxmod: music and sound solution library for NDS and GBA'
            'default_arm7: helper binary to initialize NDS hardware (needed for most examples)')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/nds-examples-$_pkgverexamples.tar.bz2")
sha256sums=('8d214836b2028496a4c656d70b4a12cb04b9fdc7aebaf6bb759fb8ce00889baf'
            '226056abd92d866bfaa46eda125d7c0281d2630556fbd619c0bdfdde9b571863')
noextract=("nds-examples-$_pkgverexamples.tar.bz2")
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make -j1
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  install -d "$DEVKITPRO"/examples/nds
  bsdtar xf nds-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/nds
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 libnds_license.txt "$pkgdir"/usr/share/licenses/libnds/libnds_license.txt
}
