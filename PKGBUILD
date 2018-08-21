# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx-py3
_pkgname=searx
pkgver=0.14.0
pkgrel=3
pkgdesc="A privacy-respecting, hackable metasearch engine (python3 based)"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'python-certifi'
        'python-flask'
        'python-flask-babel'        
        'python-lxml'
        'python-idna'
        'python-pygments'
        'python-pyopenssl'
        'python-dateutil'        
        'python-yaml'
        'python-requests'
        'python-pysocks')
conflicts=('searx-git' 'searx')
backup=('etc/searx/settings.yml')
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.sysusers'
        'searx.service')
sha512sums=('97478d0dd61201510542d6574e7d59f43159fc30608257b8d31200567591e6fc0c1a41a6614e74e29988e4f76d0eae276688e060a6fe7d021fa29e23bbc80b76'
            '0f4e134ffb7d36807a0591b92e10d2d74a790aeba50d90dc6bdff634353a1e9ed48c572dcf724483daa9eceb5505dc9b79a1b5a8c28a228b300a01b1eafcdc9f'
            '64ab805f7e0089d9b638c2972687ba60331304b3d63bfff138ce8b7903d999f40854067c384cafbc6c635afc335bd084b758cbb7c5cac397d97ed1f31e67ac6e')


package() {
  cd $srcdir/$_pkgname-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $_pkgname/settings.yml

  python3.7 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python3.7/site-packages/{README.rst,requirements*,tests,searx}
  
  mkdir -p $pkgdir/etc/$_pkgname
  mv $pkgdir/usr/lib/python3.7/site-packages/$_pkgname/settings.yml $pkgdir/etc/$_pkgname/
  ln -s /etc/$_pkgname/settings.yml $pkgdir/usr/lib/python3.7/site-packages/$_pkgname/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
}
