# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=charge-lnd
pkgver=0.2.8
pkgrel=2
pkgdesc="${pkgname} is a simple policy based fee manager for LND"
url='https://github.com/accumulator/charge-lnd'
depends=('python' 'python-setuptools' 'python-googleapis-common-protos' 'python-grpcio' 'python-protobuf' 'python-six' 'python-termcolor' 'python-colorama' 'python-aiorpcx')
optdepends=('lnd-bin')
makedepends=('python-pip')
checkdepends=()
license=('GPL2')
arch=('any')
install=${pkgname}.install
source=("https://github.com/accumulator/charge-lnd/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}@.service" "${pkgname}.timer" "${pkgname}.sysusers" "${pkgname}.env")
sha256sums=('8f6fff0a1ae9b5a20855cdb2dc2aeef3f1f3cb692b6a02684305e02ea3b1cd50' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm 644 "$srcdir/${pkgname}.env" "$pkgdir/etc/default/${pkgname}"
  install -Dm 644 examples/* -t "$pkgdir/etc/charge-lnd"
  
  install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 "$srcdir"/*.service -t "$pkgdir/usr/lib/systemd/system"
}
