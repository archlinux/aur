# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=v0.10.0.r1.g8d4dd3c
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('git' 'openssl')
depends=('python2-flask' 'python2-flask-babel' 'python2-requests' 'python2-lxml' 'python2-yaml' 'python2-dateutil' 'python2-pygments' 'python2-certifi' 'python2-pyasn1-modules' 'python2-ndg-httpsclient' 'python-pysocks')
backup=('usr/lib/python2.7/site-packages/searx/settings.yml')
install=searx.install
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

prepare() {
  cd $srcdir/searx

  # Break stuff... for science
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

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
