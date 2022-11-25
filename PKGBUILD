# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=charge-lnd
pkgver=0.2.13
pkgrel=1
pkgdesc="${pkgname} is a simple policy based fee manager for LND"
url='https://github.com/accumulator/charge-lnd'
depends=('python' 'python-setuptools' 'python-googleapis-common-protos' 'python-grpcio' 'python-protobuf' 'python-six' 'python-termcolor' 'python-colorama' 'python-aiorpcx')
optdepends=('lnd-bin' 'lnd')
makedepends=('python-pip')
checkdepends=()
license=('GPL2')
arch=('any')
install=${pkgname}.install
backup=("etc/default/${pkgname}")
source=("https://github.com/accumulator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}@.service" "${pkgname}.timer" "${pkgname}.sysusers" "${pkgname}.env")
sha256sums=('15b4c238f8d6436bc9dc29e8dfbb3fa4fa92c2069fdc3fd8dce10ce5bff28701' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
  install -Dm 644 "$srcdir"/*.timer -t "$pkgdir/usr/lib/systemd/system"
}
