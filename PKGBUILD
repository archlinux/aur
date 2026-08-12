# Maintainer: Kaj Kowalski <info@kajkowalski.nl>

# Source package: builds the `runner` + `run` binaries from the tagged
# GitHub source tarball with cargo. `pkgver`/`sha256sums` are rewritten by
# CI (.github/workflows/aur-release.yml) on every release; the values below
# are only a checked-in reference snapshot.
pkgname=runner-run
pkgver=0.25.1
pkgrel=1
pkgdesc='Universal project task runner'
arch=('x86_64' 'aarch64')
url='https://github.com/kjanat/runner'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
checkdepends=('just')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kjanat/runner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('238e6d525db500cf9936b0168ad3fa6dc7efd287642dcace27412460b65004fe')

prepare() {
	cd "runner-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "runner-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --frozen --release --bin runner --bin run
	env CARGO_TARGET_DIR=target/man \
		cargo run --frozen --features man -- man --output man
}

check() {
	cd "runner-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	# Integration tests shell out to `just` only (checkdepends); no network.
	cargo test --frozen --release
}

package() {
	cd "runner-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" target/release/runner target/release/run
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	# Shell completions. `runner completions <shell>` is the only generator
	# (a `run completions` subcommand does not exist) and emits a single
	# stream covering BOTH `runner` and `run` with the path of the invoking
	# `runner` binary baked in via `current_exe()`. Strategy:
	#   1. Generate the combined stream for each shell.
	#   2. sed-rewrite the baked target/release paths to /usr/bin/{runner,run}.
	#      Longer match first, `…/run` is a prefix of `…/runner`.
	#   3. awk-split bash + zsh on their start-of-line boundaries so each
	#      command gets its own autoload file. Fish stays as one file.
	local g="$srcdir/_compl"
	local bin_runner="$srcdir/runner-$pkgver/target/release/runner"
	local bin_run="$srcdir/runner-$pkgver/target/release/run"
	mkdir -p "$g"
	"$bin_runner" completions bash >"$g/bash.combined"
	"$bin_runner" completions zsh  >"$g/zsh.combined"
	"$bin_runner" completions fish >"$g/fish.combined"
	"$bin_runner" completions pwsh >"$g/runner.ps1"
	sed -i -e "s|$bin_runner|/usr/bin/runner|g" \
		-e "s|$bin_run|/usr/bin/run|g" \
		"$g/bash.combined" "$g/zsh.combined" "$g/fish.combined" "$g/runner.ps1"
	awk -v r="$g/runner.bash" -v n="$g/run.bash" \
		'/^_clap_complete_run\(\) \{$/ {o=n} {print > (o?o:r)}' "$g/bash.combined"
	awk -v r="$g/_runner" -v n="$g/_run" \
		'/^#compdef run$/ {o=n} {print > (o?o:r)}' "$g/zsh.combined"
	install -Dm0644 "$g/runner.bash" "$pkgdir/usr/share/bash-completion/completions/runner"
	install -Dm0644 "$g/run.bash"    "$pkgdir/usr/share/bash-completion/completions/run"
	install -Dm0644 "$g/_runner"     "$pkgdir/usr/share/zsh/site-functions/_runner"
	install -Dm0644 "$g/_run"        "$pkgdir/usr/share/zsh/site-functions/_run"
	# Fish autoloads completion files by command basename; `runner.fish` is
	# sourced on `runner<TAB>` but never on `run<TAB>`. Install the (identical)
	# combined stream under both names so each command's first tab works in
	# a fresh shell, without depending on session order.
	install -Dm0644 "$g/fish.combined" "$pkgdir/usr/share/fish/vendor_completions.d/runner.fish"
	install -Dm0644 "$g/fish.combined" "$pkgdir/usr/share/fish/vendor_completions.d/run.fish"
	# PowerShell has no system autoload dir on Linux; pwsh users dot-source
	# this file from their `$PROFILE`:  . /usr/share/runner/runner.ps1
	install -Dm0644 "$g/runner.ps1" "$pkgdir/usr/share/runner/runner.ps1"

	# Man pages rendered into ./man by build(). makepkg gzips them (zipman).
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" man/*.1
}
