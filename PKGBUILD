# Maintainer: Martin Rys <rys.rs/contact>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty-git
pkgver=0.0.1.alpha.19.r3.59bf06d
pkgrel=2
pkgdesc="An extremely fast Python type checker and language server, written in Rust."
arch=("x86_64")
url="https://github.com/astral-sh/ty"
license=("MIT")
conflicts=("ty")
depends=(
	python
)
makedepends=(
	git
	maturin
	python-installer
)
options=(!lto)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule update --init --recursive
	# Update Ruff to latest, as ty current resides in Ruff's codebase
	git submodule update --remote --merge ruff
	cp ruff/rust-toolchain.toml .
	cargo fetch --manifest-path ruff/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${pkgname}"
	maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

package() {
	python -m installer --destdir="${pkgdir}" "${srcdir}/${pkgname}/ruff/target/wheels"/*.whl

	install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/${pkgname}/LICENSE"

	install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r "${srcdir}/${pkgname}/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/"

	"${pkgdir}/usr/bin/ty" generate-shell-completion bash | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
	"${pkgdir}/usr/bin/ty" generate-shell-completion elvish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
	"${pkgdir}/usr/bin/ty" generate-shell-completion fish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	"${pkgdir}/usr/bin/ty" generate-shell-completion zsh | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
