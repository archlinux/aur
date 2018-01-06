# $Id: PKGBUILD 209036 2017-01-25 11:24:26Z jsteel $
# Maintainer:  Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=0.7.9
pkgrel=1
pkgdesc="The standard for customising cloud instances"
arch=('any')
url="http://cloud-init.io"
license=('GPL3')
depends=('systemd' 'python2-yaml' 'python2-cheetah' 'python2-prettytable'
         'python2-oauth' 'python2-boto' 'python2-configobj'
         'python2-jsonpatch' 'python2-jsonpointer' 'net-tools'
         'python2-requests' 'python2-argparse' 'python2-oauthlib'
         'python2-jinja')
makedepends=('python2' 'python2-setuptools')
backup=('etc/cloud/cloud.cfg' 'etc/cloud/cloud.cfg.d/05_logging.cfg')
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        fix-logging.patch
        archlinux.cloud.cfg)
md5sums=('0a83072b25a0f96c539fa6cd45c05347'
         '269cf6bd2337ca2fea3197aefeee5277'
         '4c03c6d2d35c42086ed07f487f01c08a')

prepare(){
  cd $pkgname-$pkgver

  patch -Np1 -i ../fix-logging.patch

  find . -name \*.py -exec sed -i '1s/python$/&2/' {} +
  sed -i '1s/python$/&2/' tools/read*
  sed -e 's:/etc/systemd:/usr/lib/systemd:g' -e 's:\"/lib\":\"/usr/lib\":g' -i setup.py
}

package() {
  cd $pkgname-$pkgver

  python2 ./setup.py install --root="$pkgdir" --init-system systemd

  install -m644 ../archlinux.cloud.cfg "$pkgdir"/etc/cloud/cloud.cfg
}
