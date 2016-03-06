# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=v0.8.1.r112.ge893d94
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="http://searx.me"
license=('AGPL')
depends=('python2-flask' 'python2-flask-babel' 'python2-requests' 'python2-lxml' 'python2-yaml' 'python2-dateutil' 'python2-pygments' 'python2-certifi' 'python2-pyasn1-modules' 'python2-ndg-httpsclient')
makedepends=('git')
install=searx.install
backup=('usr/lib/python2.7/site-packages/searx/settings.yml')
source=('git+https://github.com/asciimoo/searx.git'
        'searx.install'
        'searx.service')
sha512sums=('SKIP'
            '47d9b0509b0ac637d6bd0aa44213115e974bb3c943f2bce513732648bcea4616bf9fa550ef7d8fbaa580980793a2d8b69a9342d6a6e31604164e75f246fc3107'
            '07fbd0675c1bd05022bc79a3f7eb591d6f8276c1347beb6f99901014f01fd9c19638e8c4c8565b2ca248161d71ce8999474f5f1bc1b26494c6f4b63bfd07ab76')

pkgver() {
  cd $srcdir/searx

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd $srcdir/searx

  sed -i 's/certifi==2015.11.20.1/certifi==2016.2.28/' requirements.txt
  sed -i 's/pygments==2.0.2/pygments==2.1.3/' requirements.txt
  sed -i 's/python-dateutil==2.4.2/python-dateutil==2.5.0/' requirements.txt

  python2 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python2.7/site-packages/{tests,searx/}

  install -Dm 644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
