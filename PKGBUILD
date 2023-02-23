# Maintainer: kmille github@androidloves.me

pkgname=riseup-vpn-configurator
pkgver=0.1.2
pkgrel=2
pkgdesc="a simple command line tool to get RiseupVPN up and running"
arch=('any')
url="https://github.com/kmille/riseup-vpn-configurator"
license=('GPL3')
backup=('etc/riseup-vpn.yaml')
makedepends=(python-poetry-core python-build python-installer python-wheel)
depends=(openvpn openvpn-reconnect python python-jinja python-requests python-yaml python-pyasn1 python-pyasn1-modules python-psutil python-ping3)
source=(https://github.com/kmille/riseup-vpn-configurator/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('58590e48dac56b3f87149f1620c020d510340e62b284a2161f156c14f40afb7e')

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
