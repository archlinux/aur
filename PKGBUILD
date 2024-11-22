# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=python-etebase
_pkgname=${pkgname}
pkgver=0.31.8
pkgrel=2
pkgdesc="Etebase Python library"
arch=(x86_64)
url="https://github.com/etesync/etebase-py"
license=('BSD')
depends=('openssl' 'python-msgpack' 'libsodium')
makedepends=('cargo' 'git' 'python-setuptools' 'python-setuptools-rust')
source=(
	"${_pkgname}::git+https://github.com/etesync/etebase-py.git#tag=v$pkgver"
	"0001-Link-against-system-openssl-libsodium.patch"
)
sha256sums=('e7861c4d252ac48ff94e092bfbbac8977e4b441543308e72f65f329bd6258211'
            '89d4cbd5fae9b770751723f49e307711433de818fcefa2849feba95fe8e7ae87')

prepare() {
	cd "$_pkgname"
    git apply ../0001-Link-against-system-openssl-libsodium.patch
}

build() {
  cd "${_pkgname}"

  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 README.md
}
