# https://gitlab.archlinux.org/archlinux/packaging/packages/python-mitmproxy-wireguard

pkgname=python-mitmproxy-wireguard
_pyname=mitmproxy_wireguard
pkgver=0.1.23
pkgrel=1
pkgdesc='WireGuard frontend for mitmproxy'
arch=('x86_64')
url='https://github.com/decathorpe/mitmproxy_wireguard'
license=('MIT')
depends=('python')
makedepends=('maturin' 'python-installer' 'cargo')
options=(!lto)
source=("https://github.com/decathorpe/mitmproxy_wireguard/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('de58db775454090efe4eb917731a0efb86fa30ca2a701f209148548900c8f09269839ecbcaa5cc31166d9dcbab0bd1924addf409e55d534ada488eb0a7f06c8b')

build() {
  cd ${_pyname}-${pkgver}
  maturin build --release --strip
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${_pyname}-${pkgver}
  python -m installer --destdir=test_dir target/wheels/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  python -c 'import mitmproxy_wireguard'
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
