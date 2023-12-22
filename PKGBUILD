# Maintainer: Luis Pais <ca.aur.text-generation-cli-git@bentopais.pt>
pkgname=text-generation-cli-git
_binname=tg-cli
pkgver=r0.1.0
pkgrel=1
pkgdesc="A CLI frontend for text generation APIs."
arch=('x86_64')
url="https://gitlab.com/ai-cli/text-generation-cli"
license=('EUPL1.2')
depends=(
	'openssl'
	'gcc-libs'
	'glibc'
)
makedepends=(
	'git'
	'cargo'
)
provides=("${_binname}")
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "r$(cat Cargo.toml | grep 'version =' | cut -d \" -f 2 | head -n 1)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${pkgname}"
	./build.sh
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
}
