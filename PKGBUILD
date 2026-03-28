# Maintainer: FlowerCA77 <ca538468142@outlook.com>
packager="FlowerCA77 <ca538468142@outlook.com>"

pkgname=(
	"claudes-c-compiler"
	"claudes-c-compiler-doc"
	"claudes-c-compiler-src"
)
pkgver=0.1.0.r6f1b99a
pkgrel=1
pkgdesc="Claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, AArch64, and RISC-V 64"
arch=(x86_64)
url="https://github.com/anthropics/claudes-c-compiler"
license=('CC0-1.0')
depends=(glibc)
makedepends=(
	cargo
)
optdepends=(
	'gcc: Enable optional cargo features gcc_assembler,gcc_linker,gcc_m16 (build with --features gcc_assembler,gcc_linker,gcc_m16)'
	'aarch64-linux-gnu-gcc: Cross-compile toolchain for AArch64 (optional, for building ccc-arm)'
	'riscv64-linux-gnu-gcc: Cross-compile toolchain for RISC-V 64 (optional, for building ccc-riscv)'
	'i686-linux-gnu-gcc: Cross-compile toolchain for i686 (optional, for building ccc-i686)'
	'qemu: Useful for running cross-compiled binaries (optional)'
	'rust: Rust toolchain providing cargo and rustc (optional; cargo is the build tool required — install rust if cargo not available)'
	'rustup: Optional alternative toolchain manager (AUR) — only if users prefer rustup-managed toolchains (optional)'
)
options=('!emptydirs')

# Pin to the current commit observed when this PKGBUILD was generated.
# Versioning: upstream crate version + short commit marker
source=("git+https://github.com/anthropics/claudes-c-compiler.git#commit=6f1b99acb2f4ec2414592136c2009fe7713deec3")
sha512sums=('SKIP')

prepare() {
	cd "$srcdir/claudes-c-compiler"

	export RUSTUP_TOOLCHAIN=stable

	# If upstream doesn't include Cargo.lock (common for VCS sources),
	# generate/update it so later --locked/frozen builds work.
	if [ ! -f Cargo.lock ]; then
		cargo update
	fi

	# Try to fetch dependencies for the host target; fall back to no-target
	# if rustc isn't available in the build environment.
	host_trip=$(rustc -Vv 2>/dev/null | awk '/host:/{print $2}')
	if [ -n "$host_trip" ]; then
		cargo fetch --locked --target "$host_trip"
	else
		cargo fetch --locked
	fi
}

build() {
	cd "$srcdir/claudes-c-compiler"

	export CARGO_TARGET_DIR=target

	# Build release binaries. Default build uses the repository's builtin
	# assembler/linker. To enable GCC fallback, rebuild with the features
	# described in README (see optdepends above).
	cargo build --release --locked

	# Build API documentation from Rust doc comments. Install into a
	# separate -doc split package to avoid bloating the runtime package.
	cargo doc --no-deps --locked --all-features
}

# Main runtime package: install binaries and documentation
package_claudes-c-compiler() {
	cd "$srcdir/claudes-c-compiler"

	install -Dm755 "target/release/ccc" "$pkgdir/usr/bin/ccc"
	install -Dm755 "target/release/ccc-x86" "$pkgdir/usr/bin/ccc-x86"
	install -Dm755 "target/release/ccc-arm" "$pkgdir/usr/bin/ccc-arm"
	install -Dm755 "target/release/ccc-riscv" "$pkgdir/usr/bin/ccc-riscv"
	install -Dm755 "target/release/ccc-i686" "$pkgdir/usr/bin/ccc-i686"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/claudes-c-compiler/LICENSE"
}

# Documentation split package: install rustdoc HTML and README/notice
package_claudes-c-compiler-doc() {
	cd "$srcdir/claudes-c-compiler"

	mkdir -p "$pkgdir/usr/share/doc/claudes-c-compiler"

	# Copy generated rustdoc HTML
	if [ -d "target/doc" ]; then
		cp -a target/doc/* "$pkgdir/usr/share/doc/claudes-c-compiler/"
	fi

	# Upstream README contains an important human-written notice. Include it
	# verbatim so users see the warning alongside the docs.
	cat > "$pkgdir/usr/share/doc/claudes-c-compiler/UPSTREAM_NOTICE" << 'EOF'
With the exception of this one paragraph that was written by a human, 100% of the code and documentation in this repository was written by Claude Opus 4.6. A human guided some of this process by writing test cases that Claude was told to pass, but never interactively pair-programmed with Claude to debug or to provide feedback on code quality. As a result, I do not recommend you use this code! None of it has been validated for correctness. Claude wrote this exclusively on a Linux host; it probably will not work on MacOS/Windows — neither I nor Claude have tried. The docs may be wrong and make claims that are false. See our blog post for more detail.
EOF

	if [ -f README.md ]; then
		install -Dm644 README.md "$pkgdir/usr/share/doc/claudes-c-compiler/README.md"
	fi
}

# Split package: include a source tarball under /usr/src
package_claudes-c-compiler-src() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/src"

	# Create a deterministic source tarball of the checked-out commit
	tar -C "$srcdir" -czf "$pkgdir/usr/src/claudes-c-compiler-$pkgver.tar.gz" "claudes-c-compiler"

	install -Dm644 "$srcdir/claudes-c-compiler/LICENSE" "$pkgdir/usr/share/licenses/claudes-c-compiler-src/LICENSE"
	mkdir -p "$pkgdir/usr/share/doc/claudes-c-compiler-src"
	if [ -f "$srcdir/claudes-c-compiler/README.md" ]; then
		install -Dm644 "$srcdir/claudes-c-compiler/README.md" "$pkgdir/usr/share/doc/claudes-c-compiler-src/README.md"
	fi
}

