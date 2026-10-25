# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=steve-git
pkgver=r12355.8b9fbef1dc
pkgrel=1
pkgdesc="Steve: a coding agent for the terminal, forked from OpenAI Codex, for self-hosted and non-OpenAI model providers"
arch=(x86_64 aarch64)
url="https://github.com/handley-lab/steve"
license=(Apache-2.0)
depends=(gcc-libs glibc openssl zlib xz bzip2 brotli zstd libcap pcre2)
makedepends=(git rust python clang cmake pkgconf ripgrep)
optdepends=('bubblewrap: system sandbox helper, preferred over the bundled one')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto !debug)
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

_target() {
	rustc -vV | sed -n 's/^host: //p'
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cargo fetch --locked --target "$(_target)" --manifest-path codex-rs/Cargo.toml
	# Steve links Codex's prebuilt V8, downloaded and checksum-verified by its own helper.
	STEVE_REPO_ROOT="$PWD" PYTHONPATH="$PWD/scripts" python - "$(_target)" "$srcdir/v8" <<'EOF'
import sys
from pathlib import Path
from codex_package.targets import TARGET_SPECS
from codex_package.v8 import fetch_codex_v8_artifacts
artifacts = fetch_codex_v8_artifacts(TARGET_SPECS[sys.argv[1]], cache_root=Path(sys.argv[2]))
Path(sys.argv[2], "env").write_text(
    f"RUSTY_V8_ARCHIVE={artifacts.archive}\nRUSTY_V8_SRC_BINDING_PATH={artifacts.binding}\n")
EOF
}

build() {
	cd "$srcdir/${pkgname%-git}"
	set -a
	. "$srcdir/v8/env"
	set +a
	export STEVE_REPO_ROOT="$PWD" PYTHONPATH="$PWD/scripts"
	export CARGO_TARGET_DIR="$srcdir/target" CARGO_NET_OFFLINE=true
	export STABLE_GIT_COMMIT="$(git rev-parse HEAD)"
	python scripts/build_codex_package.py \
		--target "$(_target)" --variant steve --cargo-profile release \
		--package-version "0.0.0+g$(git rev-parse --short=10 HEAD)" --rg-bin /usr/bin/rg \
		--package-dir "$srcdir/package" --force
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -dm755 "$pkgdir/usr/lib" "$pkgdir/usr/bin"
	cp -a "$srcdir/package" "$pkgdir/usr/lib/steve"
	ln -s ../lib/steve/bin/steve "$pkgdir/usr/bin/steve"
	install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
}
