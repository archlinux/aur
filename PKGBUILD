# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>
# Contributor: David El-Saig <daud.ici@gmail.com>

pkgname=libnds
pkgver=1.7.1
_pkgverexamples=20170915
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('devkitarm')
optdepends=('maxmod: music and sound solution library for NDS and GBA'
            'default_arm7: helper binary to initialize NDS hardware (needed for most examples)')
source=("https://github.com/devkitPro/libnds/releases/download/v$pkgver/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/nds-examples-$_pkgverexamples.tar.bz2")
sha256sums=('fd6518d185196b9a854d0984a55f22ef6b356b2fd2bb3f72bd1af8c4602c1e14'
            '9696ffa3af67c4a199c79dc4aee070f993e86bc737aabce6c18d078a164b6397')
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
