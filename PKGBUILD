# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# Override download agent to bypass strict user-agent blocking
DLAGENTS=('http::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u'
          'https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 --user-agent "PKGBUILD" -o %o %u')

_pkgauthor=superradcompany
_pkgname=microsandbox
_pkgexec=msb
_cratename=${_pkgname}
pkgname=${_cratename}
pkgdesc="Easy, fast and local-first microVM runtime"

pkgver=0.8.3
pkgrel=2
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgexec}")

makedepends=('clang' 'cargo')
depends=('glibc' 'libgcc')

options=('!strip' '!lto')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
sha256sums=('a2c21dc89f4fae5f8bfe1d30eba356806c477d64b9ef3a61593c88c3173e0da7'
            'a276ca3381fefb9cde42fccae847856085c76027557d62eee83f057eb6c53433')


prepare() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	export CC="clang"
	export CXX="clang++"

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked

	mkdir -p "./completions"

	"./target/release/${_pkgname}" completion zsh > "./completions/${_pkgexec}.zsh"
	"./target/release/${_pkgname}" completion bash > "./completions/${_pkgexec}.bash"
	"./target/release/${_pkgname}" completion fish > "./completions/${_pkgexec}.fish"
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -dm755 "${pkgdir}"/usr/{bin,lib}

	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgexec}"
	ln -sf ../lib/${_pkgname}/${_pkgexec} "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "completions/${_pkgexec}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgexec}"
	install -Dm644 "completions/${_pkgexec}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgexec}"
	install -Dm644 "completions/${_pkgexec}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgexec}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
