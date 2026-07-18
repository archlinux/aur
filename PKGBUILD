# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Cortese <mcortese1406@gmail.com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=matthart1983
_pkgname=viper
_cratename=${_pkgname}-py
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="A fast Python interpreter written in Rust — beats CPython 3.12 on 9/10 benchmarks"

pkgver=0.2.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'cargo' 'nasm')
depends=('glibc' 'libgcc')

provides=("${_appname}")

options=('!lto' '!strip')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('55911d115fe03c27cc6fa473369df24abb3b555f55def30553f47e3240fd9b11')

prepare() {
  cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"

  sed -e "s|Viper v[0-9\.]* — Python interpreter|Viper v${pkgver} — Python interpreter|g" -i "src/main.rs"
}

build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "SPEC.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "WIKI.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
