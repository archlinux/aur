# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=python-etebase
_pkgname=${pkgname}
pkgver=0.31.8
pkgrel=3
pkgdesc="Etebase Python library"
arch=(x86_64)
url="https://github.com/etesync/etebase-py"
license=('BSD')
depends=('openssl' 'python-msgpack' 'libsodium')
makedepends=('cargo' 'git' 'python-setuptools' 'python-setuptools-rust')
source=(
	"${_pkgname}::git+https://github.com/etesync/etebase-py.git#tag=v$pkgver"
	"0001-Link-against-system-openssl-libsodium.patch"
	"0002-Use-patched-rust-cpython.patch"
)
sha256sums=('e7861c4d252ac48ff94e092bfbbac8977e4b441543308e72f65f329bd6258211'
            'f4710ab35a16e1ab869021417ea5b2158307056008784ed43522534679cdc5aa'
            'b500a8e83600862b390f4d41254659d9ad7957fc8628769dcfbdfb8ba48e0a85')

prepare() {
	cd "$_pkgname"

    git apply ../0001-Link-against-system-openssl-libsodium.patch
    git apply ../0002-Use-patched-rust-cpython.patch

	if check_option "debug" "y"; then
		sed -i -e 's/binding=Binding.RustCPython/&, debug=True/' setup.py
	fi
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
