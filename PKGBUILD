# Maintainer: Alexander Görtz <aur@nyloc.de>

_pkgname=atticmatic
pkgname=atticmatic-hg
pkgver=0.1.7.r9_feba6a4d5d12
pkgrel=1
pkgdesc="A simple Python wrapper script for the Attic backup software that initiates a backup and prunes any old backups according to a retention policy."
arch=('i686' 'x86_64')
url="http://torsion.org/atticmatic/"
license=('GPLv3')
depends=('attic' 'python-ruamel.yaml')
makedepends=('mercurial')
source=("$pkgname"::'hg+https://torsion.org/hg/atticmatic')
sha512sums=('SKIP')
conflicts=('atticmatic')
provides=('atticmatic')

# This is a workaround for a missing file in 0.1.7.r9_feba6a4d5d12
prepare() {
  cd "$srcdir/$pkgname"
  touch atticmatic/commands/__init__.py
}

pkgver() {
  cd "$srcdir/$pkgname"
  hg log -r tip --template '{latesttag}.r{latesttagdistance}_{node|short}\n'
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -D -m644 sample/config "$pkgdir/etc/$_pkgname/config.example"
  install -D -m644 sample/excludes "$pkgdir/etc/$_pkgname/excludes.example"
  install -D -m644 sample/atticmatic.cron "$pkgdir/etc/$_pkgname/atticmatic.cron.example"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
