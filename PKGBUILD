# Maintainer: Jake <ja.ke@posteo.de>

pkgname=searx-py3
pkgver=0.13.0
pkgrel=1
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
sha512sums=('f8c3099654b728b43a1115cdfaa35d91d6b9837a3cdf90900b63693cc2e5acb631148caffd45dd310514cd95cece570265a01fc8cd1c7a8e28856e7507c841ce'
            'a29390b2ac3be68700cc30db900e2c65947f91b9f73ce38ac26bbdbb5e2b9c5729cd85849d57d3e1d02e1e91b7cf440a460a5e16d1592bf11fce6942f46651fe'
            '64ab805f7e0089d9b638c2972687ba60331304b3d63bfff138ce8b7903d999f40854067c384cafbc6c635afc335bd084b758cbb7c5cac397d97ed1f31e67ac6e')


package() {
  cd $srcdir/searx-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searx/settings.yml

  python3.6 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python3.6/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python3.6/site-packages/{tests,searx/}
  
  mkdir -p $pkgdir/etc/searx
  mv $pkgdir/usr/lib/python3.6/site-packages/searx/settings.yml $pkgdir/etc/searx/
  ln -s /etc/searx/settings.yml $pkgdir/usr/lib/python3.6/site-packages/searx/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
