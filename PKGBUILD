# Maintainer:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=18.2
pkgrel=1
pkgdesc="The standard for customising cloud instances"
arch=('any')
url="https://cloud-init.io"
license=('GPL3')
depends=('systemd' 'sudo' 'python2-yaml' 'python2-cheetah' 'python2-prettytable'
         'python2-oauth' 'python2-boto' 'python2-configobj'
         'python2-jsonschema' 'python2-jsonpatch' 'python2-jsonpointer' 'net-tools'
         'python2-requests' 'python2-argparse' 'python2-oauthlib'
         'python2-jinja')
makedepends=('python2' 'python2-setuptools')
backup=('etc/cloud/cloud.cfg' 'etc/cloud/cloud.cfg.d/05_logging.cfg')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-lib.patch
        archlinux.cloud.cfg)
sha256sums=('0224969ebdae6eadffc5f40823bb206d8b05d99a1b730018535102f38b155249'
            '0ace6a9e4156145e5b50bd5fa75d6aeefe8e5c10a63f8d9e0d3c7be4c9b53942'
            '109dd4500593c2fb7b2f7bf05eaf1835be8062c4f7b3025a0371184a691950da')

prepare(){
  cd $pkgname-$pkgver

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
