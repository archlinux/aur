# Maintainer: Zosoled <zosoled@codecow.xyz>

pkgname=nano-vanity-git
_pkgname=${pkgname%-git}
_author=PlasmaPower
pkgver=r88.caa7274
pkgrel=3
pkgdesc='Vanity address generator for nano cryptocurrency.'

arch=(x86_64)
url=https://github.com/${_author}/${_pkgname}
license=(BSD-2-Clause)
provides=(${_pkgname}=${pkgver})
conflicts=(${_pkgname})

depends=(
	glibc
	gcc-libs
	ocl-icd
)
makedepends=(
	git
	rust
)
optdepends=(
	'cuda: NVIDIA GPU support'
	'rocm-opencl-runtime: AMD GPU support for GFX8 and later cards'
)

source=(
	${_pkgname}-${pkgver}::git+${url}.git
	LICENSE::https://raw.githubusercontent.com/${_author}/${_pkgname}/master/LICENSE
)

sha512sums=(
	'SKIP'
	'd4e9f56bec22cc7a82f107378defbe500a2adc49489842182e7ab2344953c14da77de5003e275e9978f99af44938bb8524d4a514ed91cf04f1b1dc88086f2b05'
)

pkgver() {
	cd "${srcdir}"/${_pkgname}-${pkgver}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}"/${_pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}"/${_pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}"/${_pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}"/${_pkgname}-${pkgver}
	install -Dm0755 -t "${pkgdir}"/usr/bin target/release/${_pkgname}
	install -Dm0644 -t "${pkgdir}"/usr/share/licenses/${_pkgname} LICENSE
}
