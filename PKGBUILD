# Maintainer: Jake <ja.ke@posteo.de>
# Based on searx-git, thanks to: 
# Jean Lucas <jean at 4ray dot co> and Reventlov <contact+aur at volcanis dot me>

pkgname=searx
pkgver=0.10.0
pkgrel=1
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
backup=('usr/lib/python2.7/site-packages/searx/settings.yml')
install=searx.install
source=('https://github.com/asciimoo/searx/archive/v0.10.0.zip'
        'searx.install'
        'searx.service')
sha512sums=('2290dde2e26b8b219e8613c2c79b17a6d0ecd9170cf02b7c6cfe6bc1c0a67ca09b60c18d194e7086701218483ae0941e8e2001fd99eedc36b17a6fead7b4f4a3'
            '47d9b0509b0ac637d6bd0aa44213115e974bb3c943f2bce513732648bcea4616bf9fa550ef7d8fbaa580980793a2d8b69a9342d6a6e31604164e75f246fc3107'
            '07fbd0675c1bd05022bc79a3f7eb591d6f8276c1347beb6f99901014f01fd9c19638e8c4c8565b2ca248161d71ce8999474f5f1bc1b26494c6f4b63bfd07ab76')


package() {
  cd $srcdir/searx-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  #Generate a random secret key
  sed -i -e "s/ultrasecretkey/`openssl rand -hex 16`/g" searx/settings.yml

  python2 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python2.7/site-packages/{tests,searx/}

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
