# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=python-etebase
_pkgname=${pkgname}
pkgver=0.32.0
pkgrel=2
pkgdesc="Etebase Python library"
arch=(x86_64)
url="https://github.com/etesync/etebase-py"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs' 'openssl' 'python' 'python-msgpack' 'libsodium')
makedepends=('cargo' 'git' 'python-build' 'python-installer' 'python-maturin')
source=(
	"${_pkgname}::git+https://github.com/etesync/etebase-py.git#tag=v$pkgver"
	"0001-Link-against-system-openssl-libsodium.patch"
)
sha256sums=('d8936ee3efdf50ad4700a650d338a251c1c684feb852a8fae849aef1384de243'
            '81925017f161896ee85892fb66c119fcf59200a5aa7fdffef163f1247e60fea8')

prepare() {
	cd "$_pkgname"

    git apply ../0001-Link-against-system-openssl-libsodium.patch

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  if check_option "debug" "y"; then
    export MATURIN_PEP517_ARGS="--profile dev"
  fi

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 README.md
}
