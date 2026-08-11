# Maintainer: Ross (chadsr) <git at ross dot ch>

pkgname=openshell
pkgver=0.0.102 # renovate: datasource=github-releases depName=NVIDIA/OpenShell
pkgrel=2
pkgdesc="The safe, private runtime for autonomous AI agents."
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/OpenShell'
license=('Apache-2.0')
install=openshell.install
depends=('z3' 'sqlite')
makedepends=(
	'cargo'
	'clang'  # z3-sys (libclang for bindgen)
	'cmake'  # protobuf-src builds protoc via cmake
	'pandoc' # man pages from deploy/man/*.md
)
optdepends=(
	'bash-completion: bash completions'
	'docker: compute driver'
	'podman: compute driver'
)
conflicts=("$pkgname-bin" "$pkgname-git")
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2c04226f56badbb3b8e41d3cf0f81684c4b29f53d58604e5c3388fc6ac1b34c5c4e81a27304296f5d591bbdb25605d9f1584aeb1fadd18973d5fe208d0a34569')

prepare() {
	cd "OpenShell-$pkgver" || exit

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "OpenShell-$pkgver" || exit
	export CARGO_TARGET_DIR=target
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSHELL_GIT_VERSION="$pkgver"
	export OPENSHELL_IMAGE_TAG="$pkgver"

	# --no-default-features disables telemetry
	cargo build --frozen --release --no-default-features \
		-p openshell-cli \
		-p openshell-server

	# man pages (markdown -> roff via pandoc, matching the RPM)
	pandoc -s -t man deploy/man/openshell.1.md -o openshell.1
	pandoc -s -t man deploy/man/openshell-gateway.8.md -o openshell-gateway.8

	# shell completions
	target/release/openshell completions bash >openshell.bash
	target/release/openshell completions zsh >_openshell
	target/release/openshell completions fish >openshell.fish
}

check() {
	cd "OpenShell-$pkgver" || exit
	export CARGO_TARGET_DIR=target
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSHELL_GIT_VERSION="$pkgver"
	export OPENSHELL_IMAGE_TAG="$pkgver"

	cargo test --frozen --lib \
		-p openshell-cli \
		-p openshell-server
}

package() {
	cd "OpenShell-$pkgver" || exit
	install -Dm0755 target/release/openshell -t "$pkgdir/usr/bin/"
	install -Dm0755 target/release/openshell-gateway -t "$pkgdir/usr/bin/"

	install -Dm0644 deploy/deb/openshell-gateway.service \
		"$pkgdir/usr/lib/systemd/user/openshell-gateway.service"

	install -Dm0644 deploy/rpm/gateway.toml.default \
		"$pkgdir/usr/share/openshell-gateway/gateway.toml.default"

	install -Dm0644 openshell.1 "$pkgdir/usr/share/man/man1/openshell.1"
	install -Dm0644 openshell-gateway.8 "$pkgdir/usr/share/man/man8/openshell-gateway.8"

	install -Dm0644 openshell.bash "$pkgdir/usr/share/bash-completion/completions/openshell"
	install -Dm0644 _openshell "$pkgdir/usr/share/zsh/site-functions/_openshell"
	install -Dm0644 openshell.fish "$pkgdir/usr/share/fish/vendor_completions.d/openshell.fish"

	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
