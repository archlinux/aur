# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=22.4.0
pkgrel=2
pkgdesc='OSP Server for openvas'
arch=('x86_64')
url="https://github.com/greenbone/ospd-openvas"
license=('GPL')
depends=('python-ospd' 'python-redis' 'python-psutil' 'python-packaging' 'openvas-scanner' 'python-paho-mqtt' 'python-gnupg')
provides=('python-ospd-openvas')
conflicts=('python-ospd-openvas')
makedepends=('python-setuptools' 'python-poetry' 'python-installer')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd-openvas/archive/v${pkgver}.tar.gz"
        "ospd-openvas"
        "ospd-openvas.service")
sha512sums=('9ceaca7843c406361aeaa6c15386c150c449c08586382f95074cf346a4ebf7dd57ee97cda2784758845d03852488989ad18963eba0f01c4bb190fafa3480df9b'
            '3461820543ac6bc0cd50026023a6271e015123366fc44ce66ead1221d52c9e534063881f3b46a50a6e43ec9caff697376c35f1ce2cd22944e7b58f02070a78a8'
            'ddaa5ad183265df4a89661acde7f0c8a5d1fd4c0748e3ca2dd267d3e7e05e6975a62023833bdd048ab97076c9ec839e7ad2fd463ef16b246e5813e328956b50e')

backup=(
        "etc/default/ospd-openvas"
       )

check() {
  cd "$srcdir/$pkgname-$pkgver"
    LANG=en_US.UTF-8 pytest
}

package() {
  cd "$pkgname-$pkgver"

  #python setup.py install --root="$pkgdir" --optimize=1
  poetry build 

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "$pkgdir" dist/*.whl
  install -d $pkgdir/etc/default
  install -m 644 $srcdir/ospd-openvas $pkgdir/etc/default
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/ospd-openvas.service $pkgdir/usr/lib/systemd/system
}
