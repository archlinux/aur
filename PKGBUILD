# Maintainer: Jake <ja.ke@posteo.de>
# Based on searx-git, thanks to: 
# Jean Lucas <jean at 4ray dot co> and Reventlov <contact+aur at volcanis dot me>

pkgname=searx
pkgver=0.10.0
pkgrel=2
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=('python2-flask'
        'python2-flask-babel'
        'python2-requests'
        'python2-lxml'
        'python2-yaml'
        'python2-dateutil'
        'python2-pygments'
        'python2-certifi'
        'python2-pyasn1-modules'
        'python2-ndg-httpsclient'
        'python2-pysocks')
conflicts=('searx-git')
backup=('etc/searx/settings.yml')
install=searx.install
source=('https://github.com/asciimoo/searx/archive/v0.10.0.zip'
        'searx.install'
        'searx.service')
sha512sums=('2290dde2e26b8b219e8613c2c79b17a6d0ecd9170cf02b7c6cfe6bc1c0a67ca09b60c18d194e7086701218483ae0941e8e2001fd99eedc36b17a6fead7b4f4a3'
            '984a7ed8a3bc2b7ad3703b58c50597959140d49242581449a6d616fd0c7ad021073a18962e76bad158c454860d5a77b89f207bcecd4e26273e1f46c5ef66d62f'
            '52beddcb3f31ef93eb6f722295ce34ab90bbdabf6697f9f42a53bb348b0c622040b2ba452b17c98f3d6f2b98a8a4461e26546a62a0328e761717f8a9040a241f')


package() {
  cd $srcdir/searx-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searx/settings.yml

  python2 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python2.7/site-packages/{tests,searx/}
  
  mkdir -p $pkgdir/etc/searx
  mv $pkgdir/usr/lib/python2.7/site-packages/searx/settings.yml $pkgdir/etc/searx/
  ln -s /etc/searx/settings.yml $pkgdir/usr/lib/python2.7/site-packages/searx/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
