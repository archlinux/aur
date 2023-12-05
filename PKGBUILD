# Maintainer: kmille github@androidloves.me

pkgname=riseup-vpn-configurator
pkgver=1.0.4
pkgrel=1
pkgdesc="a simple command line tool to get RiseupVPN up and running"
arch=('any')
url="https://github.com/kmille/riseup-vpn-configurator"
license=('GPL3')
backup=('etc/riseup-vpn.yaml')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(openvpn openvpn-reconnect python python-jinja python-requests python-yaml python-pyasn1 python-pyasn1-modules python-psutil python-icmplib)
source=(https://github.com/kmille/riseup-vpn-configurator/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b4a595dd0213d4ccef85bfec99a4a0608cff2c6fd0d36ce06de6ee8aad257ec6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 0600 "$srcdir/$pkgname-$pkgver/riseup_vpn_configurator/riseup-vpn.yaml" "$pkgdir"/etc/riseup-vpn.yaml
}
