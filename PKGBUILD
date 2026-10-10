# Maintainer: chadsr <git at ross dot ch>

pkgname=openshell
pkgver=0.1.3 # renovate: datasource=github-releases depName=NVIDIA/OpenShell
pkgrel=1
pkgdesc="The safe, private runtime for autonomous AI agents."
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/OpenShell'
license=('Apache-2.0')
install=openshell.install
depends=('z3' 'sqlite' 'git')
makedepends=(
	'cargo'
	'cmake'  # aws-lc-sys (TLS)
	'pandoc' # man pages
)
checkdepends=('openssh') # forward_ssh_command_overrides_user_multiplexing_and_forking
optdepends=(
	'bash-completion: bash completions'
	'docker: compute driver'
	'podman: compute driver'
	'openssh: ssh access and port forwarding'
)
conflicts=("$pkgname-bin" "$pkgname-git")
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d0650d08f39c946a950ac7cb772da4626be6ddd49957069f1f64eb06fccd1d0b6fdfd7524d870bfff05794f138d0112a7d85c9a3870f781bfe45deef583879d3')

prepare() {
	cd "OpenShell-$pkgver"

	# stamp pkgver like openshell.spec; sync lock for --frozen
	sed -i "s/^version = \"0.0.0\"/version = \"$pkgver\"/" Cargo.toml
	grep -q "version = \"$pkgver\"" Cargo.toml || {
		echo "Cargo.toml version stamp failed" >&2
		return 1
	}
	sed -i "/^name = \"openshell-/{n;s/^version = \"0.0.0\"$/version = \"$pkgver\"/}" Cargo.lock

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "OpenShell-$pkgver"
	export CARGO_TARGET_DIR=target
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSHELL_GIT_VERSION="$pkgver"
	export OPENSHELL_IMAGE_TAG="$pkgver"
	export GIT_CEILING_DIRECTORIES="$PWD" # prevent git-describing the enclosing repo
	export AWS_LC_SYS_USE_SYSTEM=0        # always build vendored aws-lc

	# telemetry-free gateway; separate build to avoid telemetry via feature unification
	cargo build --frozen --release -p openshell-gateway \
		--no-default-features --features defaults-without-telemetry

	cargo build --frozen --release --no-default-features \
		-p openshell-cli \
		-p openshell-prover-cli

	# man pages (markdown -> roff)
	pandoc -s -t man deploy/man/openshell.1.md -o openshell.1
	pandoc -s -t man deploy/man/openshell-gateway.8.md -o openshell-gateway.8

	# shell completions
	target/release/openshell completions bash >openshell.bash
	target/release/openshell completions zsh >_openshell
	target/release/openshell completions fish >openshell.fish
}

check() {
	cd "OpenShell-$pkgver"
	export CARGO_TARGET_DIR=target
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export OPENSHELL_GIT_VERSION="$pkgver"
	export OPENSHELL_IMAGE_TAG="$pkgver"
	export GIT_CEILING_DIRECTORIES="$PWD"
	export AWS_LC_SYS_USE_SYSTEM=0

	cargo test --frozen --lib -p openshell-gateway \
		--no-default-features --features defaults-without-telemetry

	cargo test --frozen --lib --no-default-features \
		-p openshell-cli \
		-p openshell-prover-cli
}

package() {
	cd "OpenShell-$pkgver"
	install -Dm0755 target/release/openshell -t "$pkgdir/usr/bin/"
	install -Dm0755 target/release/openshell-gateway -t "$pkgdir/usr/bin/"
	install -Dm0755 target/release/openshell-prover -t "$pkgdir/usr/bin/"

	install -Dm0644 deploy/deb/openshell-gateway.service \
		"$pkgdir/usr/lib/systemd/user/openshell-gateway.service"

	install -Dm0644 deploy/rpm/gateway.toml.default \
		"$pkgdir/usr/share/openshell-gateway/gateway.toml.default"

	install -Dm0644 deploy/rpm/QUICKSTART.md \
		"$pkgdir/usr/share/doc/openshell-gateway/QUICKSTART.md"
	install -Dm0644 deploy/rpm/CONFIGURATION.md \
		"$pkgdir/usr/share/doc/openshell-gateway/CONFIGURATION.md"
	install -Dm0644 deploy/rpm/TROUBLESHOOTING.md \
		"$pkgdir/usr/share/doc/openshell-gateway/TROUBLESHOOTING.md"

	install -Dm0644 openshell.1 "$pkgdir/usr/share/man/man1/openshell.1"
	install -Dm0644 openshell-gateway.8 "$pkgdir/usr/share/man/man8/openshell-gateway.8"

	install -Dm0644 openshell.bash "$pkgdir/usr/share/bash-completion/completions/openshell"
	install -Dm0644 _openshell "$pkgdir/usr/share/zsh/site-functions/_openshell"
	install -Dm0644 openshell.fish "$pkgdir/usr/share/fish/vendor_completions.d/openshell.fish"

	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
