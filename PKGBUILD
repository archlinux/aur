# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx-py3
pkgver=0.13.1
pkgrel=2
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
install=searx.install
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.install'
        'searx.service')
sha512sums=('6c43d451d9ebc00f39ac5cdd74b95da420cb545f4f2dc4aa6ad03df4df6d1472fde909f535b0ea3bf2333b39329f203cd640f103b165392be7519bb35b6b3967'
            'ad2d321f4d4c60f8aae9b577e9bbaa4558a927c198f849c610657e3994a780e6f402fe70ff36201075b1a82eddabd1b4a2c7e517a6ae5996b2b1c9ae8323c2c3'
            '64ab805f7e0089d9b638c2972687ba60331304b3d63bfff138ce8b7903d999f40854067c384cafbc6c635afc335bd084b758cbb7c5cac397d97ed1f31e67ac6e')


package() {
  cd $srcdir/searx-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searx/settings.yml

  python3.6 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,requirements*,tests,searx}
  
  mkdir -p $pkgdir/etc/searx
  mv $pkgdir/usr/lib/python3.6/site-packages/searx/settings.yml $pkgdir/etc/searx/
  ln -s /etc/searx/settings.yml $pkgdir/usr/lib/python3.6/site-packages/searx/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
