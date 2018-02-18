# Maintainer:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=17.2
pkgrel=2
pkgdesc="The standard for customising cloud instances"
arch=('any')
url="https://cloud-init.io"
license=('GPL3')
depends=('systemd' 'python2-yaml' 'python2-cheetah' 'python2-prettytable'
         'python2-oauth' 'python2-boto' 'python2-configobj'
         'python2-jsonpatch' 'python2-jsonpointer' 'net-tools'
         'python2-requests' 'python2-argparse' 'python2-oauthlib'
         'python2-jinja')
makedepends=('python2' 'python2-setuptools')
backup=('etc/cloud/cloud.cfg' 'etc/cloud/cloud.cfg.d/05_logging.cfg')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-logging.patch
        fix-lib.patch
        archlinux.cloud.cfg)
sha256sums=('f00338767a8877c8d72fe64a78d3897da822b3c1f47779ae31adc4815275594f'
            '0c1d5976eda3a74c4c3b78701ea1109f3a3022df7a623359154924b67e64d356'
            '0ace6a9e4156145e5b50bd5fa75d6aeefe8e5c10a63f8d9e0d3c7be4c9b53942'
            '344531c5e7c19e540c2381f19ee87807a1d478a21a24d7e143429479efd5de49')

prepare(){
  cd $pkgname-$pkgver

  patch -Np1 -i ../fix-logging.patch
  patch -Np1 -i ../fix-lib.patch

  find . -name \*.py -exec sed -i '1s/python$/&2/' {} +
  sed -i '1s/python$/&2/' tools/read*
  sed -e 's:/etc/systemd:/usr/lib/systemd:g' -e 's:\"/lib\":\"/usr/lib\":g' -i setup.py
}

package() {
  cd $pkgname-$pkgver

  python2 ./setup.py install --root="$pkgdir" --init-system systemd

  install -m644 ../archlinux.cloud.cfg "$pkgdir"/etc/cloud/cloud.cfg
}
