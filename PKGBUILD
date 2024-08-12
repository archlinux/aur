# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=python-etebase
_pkgname=${pkgname}
pkgver=0.31.7
pkgrel=1
pkgdesc="Etebase Python library"
arch=(x86_64)
url="https://github.com/etesync/etebase-py"
license=('BSD')
depends=('openssl' 'python-msgpack' 'libsodium')
makedepends=('cargo' 'git' 'python-setuptools' 'python-setuptools-rust')
source=(
	"${_pkgname}::git+https://github.com/etesync/etebase-py.git#tag=v$pkgver"
	"0001-Link-against-system-openssl-libsodium.patch"
	"python-3.12-compat.patch"
)
sha256sums=('a85f5886d898f4eefeafd4983f495677e0e2bf94bab5c8edb8a2e5c91b0c7425'
            '89d4cbd5fae9b770751723f49e307711433de818fcefa2849feba95fe8e7ae87'
            '62ed970518f4918dbb8293388e730ee584651bcba9a208ebb1945e1eb3a86b99')

prepare() {
	cd "$_pkgname"
    git apply ../0001-Link-against-system-openssl-libsodium.patch
    git apply ../python-3.12-compat.patch
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
