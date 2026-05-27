# Maintainer: stag-enterprises <git@stag.lol>
# shellcheck shell=bash

pkgname=island-git
_n=${pkgname%-git}
pkgver=r40.05a9d69
pkgrel=3
pkgdesc="Landlock LSM powered, policy based sandboxing tool"
arch=(x86_64 aarch64)
url=https://github.com/landlock-lsm/island
license=(MIT Apache-2.0)
depends=(gcc-libs glibc)
makedepends=(cargo git)
provides=($_n)
conflicts=($_n)
install=$_n.install
source=($_n::git+$url.git)
sha256sums=(SKIP)

_env() {
	cd $_n
	export CARGO_HOME="$srcdir/.cargo"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

pkgver() { _env
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() { _env
	local _l=""
	[ -f Cargo.lock ] && _l="--locked"
	cargo fetch $_l --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() { _env
	cargo build --release --all-features

	_bin=target/release/$_n
	$_bin completion bash   >completion.bash
	$_bin completion zsh    >completion.zsh
	$_bin completion fish   >completion.fish
	$_bin completion elvish >completion.elv
}

check() { _env
	local _s=""
	if ! command -v zsh >/dev/null; then
		echo ": zsh not found skipping shell_hook tests"
		_s="-- --skip shell_hook"
	fi
	_t="$srcdir/test-env"
	mkdir -p "$_t"
	XDG_RUNTIME_DIR="$_t" cargo test --frozen --all-features $_s
}

package() { _env
	install -Dm755 target/release/$_n "$pkgdir/usr/bin/$_n"
	install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE-MIT        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 completion.bash    "$pkgdir/usr/share/bash-completion/completions/$_n"
	install -Dm644 completion.zsh     "$pkgdir/usr/share/zsh/site-functions/_$_n"
	install -Dm644 completion.fish    "$pkgdir/usr/share/fish/vendor_functions.d/$_n.fish"
	install -Dm644 completion.elv     "$pkgdir/usr/share/elvish/lib/$_n.elv"
}
