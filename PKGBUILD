# Maintainer:  Sparadox <etienne.lafarge at gmail.com>
# Co-Maintainer: flaccid aka Chris Fordham <chris@fordham.id.au>
# Contributor:  kpcyrd <git@rxv.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=cloud-init
pkgver=19.2
pkgrel=1
pkgdesc="The defacto multi-distribution package that handles early initialization of a cloud instance."
arch=('any')
url="https://cloud-init.io/"
license=('GPL3')
depends=(
  'dhclient'
  'net-tools'
  'python-argparse'
  'python-configobj'
  'python-jinja'
  'python-jsonpatch'
  'python-jsonschema'
  'python-oauthlib'
  'python-requests'
  'python-six'
  'python-yaml'
  'sudo'
  'systemd'
)
makedepends=(
  'python'
  'python-setuptools'
  'pkgconf'
  'patch'
)
optdepends=(
  'python-cheetah3: support for cheetah templates'
)
backup=(
  'etc/cloud/cloud.cfg'
  'etc/cloud/cloud.cfg.d/05_logging.cfg'
)
source=(
  "https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
  fix-lib.patch
  archlinux.cloud.cfg
)
sha256sums=(
  'f5ead1b3c782c159669f8f8779c45d16a986c7405425d75f915ec55301d83a07'
  '0ace6a9e4156145e5b50bd5fa75d6aeefe8e5c10a63f8d9e0d3c7be4c9b53942'
  '0fb03b5827d0c7540633b62f1855c9d2731d8e9bf7946d5e1ab60426f1289484'
)

prepare(){
  pushd "$pkgname-$pkgver" >/dev/null
    patch -Np1 -i "$srcdir/fix-lib.patch"
    sed -e 's:/etc/systemd:/usr/lib/systemd:g' -e 's:\"/lib\":\"/usr/lib\":g' -i setup.py
  popd
}

package() {
  pushd "$pkgname-$pkgver" >/dev/null
    python ./setup.py install --root="$pkgdir" --init-system systemd
  popd

  install -m644 "$srcdir/archlinux.cloud.cfg" "$pkgdir/etc/cloud/cloud.cfg"
}
