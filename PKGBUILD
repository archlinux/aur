# Maintainer: John Lane <archlinux at jelmail dot com>

# Please note some issues with this package
# The latest release (0.2) does not work so this package builds 'master'
# as a temporary workaround. Also, upstream does not package this as a
# python library so this is worked around by this packager.
# The 'correct' code is left in place but commented out for now.
# I will correct this when upstream version bumps master.

pkgname=cdrip-tools
#pkgver=0.2
pkgver=master
pkgrel=1
pkgdesc="Command-line accuraterip verifier and rip offset fixer"
url="https://github.com/spadev/cdrip-tools/tree/v${pkgver}"
arch=('i686' 'x86_64')
license=(GPL3)
depends=(python libsndfile)
#source=("https://github.com/spadev/${pkgname}/archive/v${pkgver}.zip")
source=("https://github.com/spadev/${pkgname}/archive/${pkgver}.zip")
sha512sums=('43493a2f7b0f8cd0fc9f3de82cc3d1f0bb81b770e468ba7bf3259c89cbd7de3d1ba1295d1f628cf3dc7d65ab8fbc4cca7d73b85309932dd81eb0369d9137c20a')

build() {
  cd $srcdir/$pkgname-$pkgver
  cc -o ckcdda ckcdda.c
  cc -o splitaudio -l sndfile splitaudio.c

  # nasty library hack - change name to something less generic
  sed -i -e 's/^import utils/import cdrip_utils as utils/' \
         -e 's/^from utils/from cdrip_utils/' *.py
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm755 arverify.py $pkgdir/usr/bin/arverify
  install -Dm755 fixoffset.py $pkgdir/usr/bin/fixoffset
  install -Dm755 splitaudio $pkgdir/usr/bin/
  install -Dm755 ckcdda $pkgdir/usr/bin/

  # nasty library hack - install renamed library (hopefully in site-packages!)
  pylibdir=$(python -c "import sys; print(sys.path[-1]);")
  install -Dm755 utils.py $pkgdir${pylibdir}/cdrip_utils.py

}

