# Maintainer:  Sparadox <etienne.lafarge at gmail.com>
# Contributor:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=19.1
pkgrel=1
pkgdesc="The standard for customising cloud instances"
arch=('any')
url="https://cloud-init.io"
license=('GPL3')
depends=('systemd' 'sudo' 'python-yaml' 'python-configobj'
         'python-jsonschema' 'python-jsonpatch' 'net-tools'
         'python-requests' 'python-argparse' 'python-oauthlib'
         'python-jinja' 'dhclient')
makedepends=('python' 'python-setuptools' 'pkgconf')
optdepends=('python-cheetah3: support for cheetah templates')
backup=('etc/cloud/cloud.cfg' 'etc/cloud/cloud.cfg.d/05_logging.cfg')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-lib.patch
        archlinux.cloud.cfg)
sha256sums=('75be8cbff1431883227c05356cb69400f20bbb2666fd05e085f846ecf1d153cb'
            '0ace6a9e4156145e5b50bd5fa75d6aeefe8e5c10a63f8d9e0d3c7be4c9b53942'
            '0fb03b5827d0c7540633b62f1855c9d2731d8e9bf7946d5e1ab60426f1289484')

prepare(){
  cd $pkgname-$pkgver

  patch -Np1 -i ../fix-lib.patch

  sed -e 's:/etc/systemd:/usr/lib/systemd:g' -e 's:\"/lib\":\"/usr/lib\":g' -i setup.py
}

package() {
  cd $pkgname-$pkgver

  python ./setup.py install --root="$pkgdir" --init-system systemd

  install -m644 ../archlinux.cloud.cfg "$pkgdir"/etc/cloud/cloud.cfg
}
