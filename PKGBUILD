# Maintainer: zoe < chp321 at gmail >
# Contributor: D. Can Celasun <dcelasun at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=pytrainer
pkgver=1.10.0
pkgrel=3
pkgdesc='A tool to log your sport activities.'
arch=('any')
url='https://github.com/pytrainer/pytrainer/wiki'
license=('GPL')
depends=('python2-distribute' 'python2-lxml' 'python2-matplotlib' 'python2-migrate' 'pywebkitgtk' 'python2-sqlparse')
optdepends=('garmintools: "Garmin via garmintools" plugin'
            'gdal: "Elevation correction" plugin'
            'gpsbabel: "Garmin via GPSBabel 1.3.5" plugin'
            'perl: garmin-fit plugin'
            'zenity: garmintools and gpsbabel plugins')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/$pkgname/$pkgname/archive/v${pkgver}.tar.gz"
        $pkgname.sh
        pathfix.patch)
md5sums=('66d2c18fccca2f862914f99c4110ccc4'
         'b39a8511bc63e6d65a615d26defbb05f'
         'c80aa188dce3a5675b15a703873bf3ad')
sha256sums=('3e019ab0bb564017e13e6d8736b23597fd9b21433ebfbe597ed5430c86b98250'
            'a0bd23c619d6c5c9bc79e90dba2b5951b3405c08764ca927de385b894759449c'
            'b098e66cbc0e0f53e1ee222eb313417c7589928b66ce7b756c677f73b964fe1e')

package() {
  cd "$pkgname-$pkgver"

  patch -Np2 < "$srcdir/pathfix.patch"

  # Fix python paths
  find "$srcdir/" -name '*.py' -exec \
    sed -ri 's@^#!\s*/usr/bin/(python|env python)$@#!/usr/bin/env python2@' {} +

  # Install
  export PYTHON="/usr/bin/env python2"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  # install launcher
  mv "$pkgdir"/usr/{bin,share/$pkgname}/$pkgname
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
