# Maintainer:  Sparadox <etienne.lafarge at gmail.com>
# Contributor:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=18.5
pkgrel=3
pkgdesc="The standard for customising cloud instances"
arch=('any')
url="https://cloud-init.io"
license=('GPL3')
depends=('systemd' 'sudo' 'python-yaml' 'python-cheetah3' 'python-prettytable'
         'python-boto' 'python-configobj'
         'python-jsonschema' 'python-jsonpatch' 'python-jsonpointer' 'net-tools'
         'python-requests' 'python-argparse' 'python-oauthlib'
         'python-jinja' 'dhclient')
makedepends=('python' 'python-setuptools' 'pkgconf')
backup=('etc/cloud/cloud.cfg' 'etc/cloud/cloud.cfg.d/05_logging.cfg')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-lib.patch
        archlinux.cloud.cfg)
sha256sums=('650d1eb38ea488b3ea8cc9d7b0fb975bb3c9a3e5ca7dcaf924892f5f9813da92'
            '0ace6a9e4156145e5b50bd5fa75d6aeefe8e5c10a63f8d9e0d3c7be4c9b53942'
            '109dd4500593c2fb7b2f7bf05eaf1835be8062c4f7b3025a0371184a691950da')

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
