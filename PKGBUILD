# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=v0.10.0.r12.gaaf5d50
pkgrel=2
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('git' 'openssl')
depends=('python2-flask' 'python2-flask-babel' 'python2-requests' 'python2-lxml' 'python2-yaml' 'python2-dateutil' 'python2-pygments' 'python2-certifi' 'python2-pyasn1-modules' 'python2-ndg-httpsclient' 'python2-pysocks')
backup=('usr/lib/python2.7/site-packages/searx/settings.yml')
install=searx.install
source=('git+https://github.com/asciimoo/searx.git'
        'searx.install'
        'searx.service')
sha1sums=('SKIP'
          '12cc6464dfd578ce10180bea12e60f3a139b7138'
          '2002036b99b7dbe403585d47aa050635c8eebfea')

pkgver() {
  cd $srcdir/searx

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $srcdir/searx

  sed -i "s|==|>=|g" requirements.txt

  msg2 "Generating ultra-secret key..."
  sed -i "s/ultrasecretkey\" # change this!/`openssl rand -hex 128`\"/g" searx/settings.yml
  sleep 2
}

package() {
  cd $srcdir/searx

  python2 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python2.7/site-packages/{tests,searx/}

  install -Dm 0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
