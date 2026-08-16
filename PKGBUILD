# Maintainer: Axel H. <noirbizarre@gmail.com>
#
# Source package. `0.4.0` and `b4efce706ffbc5503546570b6efec7a5429ca0e9dc12dcf0992cf2dd16f8084b` are substituted by
# .github/workflows/aur.yaml from the published release, and the result is
# pushed to the AUR. Edit this template, never the PKGBUILD in the AUR
# repository: that one is regenerated at every release.

pkgname=git-tpl
pkgver=0.4.0
pkgrel=1
pkgdesc="Git-native project templates"
arch=('x86_64' 'aarch64')
url="https://github.com/noirbizarre/git-tpl"
license=('MIT')

# zlib because libgit2 links the system one rather than bundling it: the binary
# really does need libz.so.1, and namcap errors on a needed library left
# undeclared.
depends=('gcc-libs' 'glibc' 'zlib')

# cmake, because `git2` is built with `vendored-libgit2` — libgit2 is compiled
# from source rather than linked against the system one, so a C toolchain is a
# build-time requirement even though nothing here is a C project.
makedepends=('cargo' 'cmake')

conflicts=('git-tpl-bin')

# !lto is not optional, and the failure it prevents is obscure. makepkg enables
# LTO globally, which puts `-flto=auto` into CFLAGS — and CFLAGS is what the
# libgit2-sys build script compiles vendored libgit2 with. The resulting
# libgit2.a holds LLVM bitcode rather than objects, and the link ends in a
# screenful of `undefined symbol: git_repository_open`. Nothing is lost by
# disabling it: Cargo.toml already sets `lto = true` on the release profile, so
# the Rust side is link-time optimised either way.
#
# !debug for a plainer reason: that same profile sets `strip = true`, so there
# is no debug data to split into a -debug package.
options=('!lto' '!debug')

# This project tags without a `v` prefix, so the tag is `$pkgver` as-is.
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b4efce706ffbc5503546570b6efec7a5429ca0e9dc12dcf0992cf2dd16f8084b')

prepare() {
	cd "$pkgname-$pkgver"
	# Arch's Rust packaging guidelines: vendor the dependency graph up front so
	# build() can run offline with `--frozen`. Cargo.lock is tracked, so this
	# resolves exactly the graph upstream CI tested.
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# No Git identity is exported here on purpose: the test harness scrubs
	# GIT_AUTHOR_* and GIT_COMMITTER_* from the environment and configures each
	# temporary repository itself, so anything set here would be discarded.
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	# Named exactly `git-tpl`: Git resolves `git tpl` only through an
	# executable with that name on PATH.
	install -Dm755 target/release/git-tpl "$pkgdir/usr/bin/git-tpl"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
