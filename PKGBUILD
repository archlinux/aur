# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Cortese <mcortese1406@gmail.com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=matthart1983
_pkgname=netwatch
_cratename=${_pkgname}-tui
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="Real-time network diagnostics TUI — like htop for your network"

pkgver=0.25.7
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'cargo' 'nasm')
depends=('glibc' 'libgcc' 'libpcap' 'traceroute')

provides=("${_appname}")

install="${_appname}.install"

options=('!lto' '!strip')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('d44be5962cfa7789d57eb482f086f6c11487c7b53314ead610a6ac2c1cabbbea')

prepare() {
  cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONTRIBUTING.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "INSIGHTS.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "WIKI.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
