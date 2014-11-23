# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Gonzalo Lorca <human at vtr.net>
# Contributor: David El-Saig <daud.ici@gmail.com>

pkgname=libnds
pkgver=1.5.9
_pkgverexamples=20140401
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('custom')
depends=('devkitarm')
optdepends=('maxmod: music and sound solution library for NDS and GBA'
            'default_arm7: helper binary to initialize NDS hardware (needed for most examples)')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/nds-examples-$_pkgverexamples.tar.bz2")
sha256sums=('7d79462c7cc69c929087a26d0c089648a0cc8a972d8463aa1894b0647204b3e0'
            '51ef0e5a5c278a3fba59e43b8e8d8cb27e2f622f5f82655eb16b0d46bf1f3c77')
noextract=("nds-examples-$_pkgverexamples.tar.bz2")
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  install -d "$DEVKITPRO"/examples/nds
  bsdtar -x -f nds-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/nds
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 libnds_license.txt "$pkgdir"/usr/share/licenses/libnds/libnds_license.txt
}
