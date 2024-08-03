# Maintainer: Zosoled <zosoled@codecow.xyz>

pkgname=nano-vanity-git
_pkgname=${pkgname%-git}
pkgver=r88.caa7274
pkgrel=1
pkgdesc="Vanity address generator for nano cryptocurrency."

arch=(x86_64)
_repo=PlasmaPower/${_pkgname}
url=https://github.com/${_repo}
license=(BSD-2-Clause)
depends=(glibc gcc-libs ocl-icd)
makedepends=(git cargo rustup)
provides=(${_pkgname}=${pkgver})
conflicts=(${_pkgname})

source=(
	${_pkgname}-${pkgver}::git+${url}.git
	LICENSE::https://raw.githubusercontent.com/${_repo}/master/LICENSE
)

sha512sums=(
	"SKIP"
	"SKIP"
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

	# install -dm755 ${pkgdir}/usr/lib/${pkgname%-git}
	# cp -r ${srcdir}/${pkgname%-git}/dist/linux-unpacked/* ${pkgdir}/usr/lib/${pkgname%-git}

	# install -dm755 ${pkgdir}/usr/bin
	# ln -s /usr/lib/${pkgname%-git}/${pkgname%-git} ${pkgdir}/usr/bin/${pkgname%-git}

	install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
}
