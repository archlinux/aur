# Maintainer: zoe < chp321 at gmail >
# Contributor: D. Can Celasun <dcelasun at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=pytrainer
pkgver=2.0.0rc1
pkgrel=1
pkgdesc='A tool to log your sport activities.'
arch=('any')
url='https://github.com/pytrainer/pytrainer/wiki'
license=('GPL')
depends=('python2-distribute' 'python2-lxml' 'python2-matplotlib' 'python2-sqlalchemy-migrate' 'pywebkitgtk' 'python2-sqlparse')
optdepends=('garmintools: "Garmin via garmintools" plugin'
            'gdal: "Elevation correction" plugin'
            'gpsbabel: "Garmin via GPSBabel 1.3.5" plugin'
            'perl: garmin-fit plugin'
            'zenity: garmintools and gpsbabel plugins')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/$pkgname/$pkgname/archive/v${pkgver}.tar.gz"
        $pkgname.sh
        #pathfix.patch
        )
md5sums=('1a29bd8749a7ce218e1959e918b60211'
         'b39a8511bc63e6d65a615d26defbb05f'
         #'c80aa188dce3a5675b15a703873bf3ad'
         )


package() {
  cd "$pkgname-$pkgver"

  #patch -Np2 < "$srcdir/pathfix.patch"
  sed -i 's/\/share\/pytrainer\//\/pytrainer\//' $srcdir/$pkgname-$pkgver/bin/$pkgname
  sed -i 's/\/share\/locale/\/locale/' $srcdir/$pkgname-$pkgver/bin/$pkgname
  

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
