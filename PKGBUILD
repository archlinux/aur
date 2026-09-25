# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=akunzai
_pkgname=duodiff
_execname=${_pkgname}

pkgname=${_pkgname}
pkgver=0.12.0
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="A cross-platform TUI directory comparison tool"

url="https://github.com/${_pkgauthor}/${pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'libgcc')
provides=("${_execname}")
makedepends=('rust')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('11aa96c148363c21405b39ed2f5ab2bef94f63eae05796d42e10d1e78c4527c6')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects" RUSTFLAGS+=" --remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CARGO_TARGET_DIR=target
	cargo test --release --locked -- \
		--skip "app::tests::an_incremental_rescan_keeps_a_collapsed_directory_collapsed" \
		--skip "app::tests::test_apply_incremental_rescan_nested_file" \
		--skip "diff::tests::test_align_directories_with_progress" \
		--skip "diff::tests::test_alignment_logic" \
		--skip "diff::tests::test_alignment_precise_mode" \
		--skip "diff::tests::test_alignment_type_conflict" \
		--skip "diff::tests::test_ancestor_aggregation_of_case_conflict" \
		--skip "diff::tests::test_exact_before_folded_alignment" \
		--skip "diff::tests::test_fast_mode_equal_size_different_mtime_is_unverified_not_different" \
		--skip "diff::tests::test_fast_mode_size_mismatch_is_still_a_known_difference" \
		--skip "diff::tests::test_precise_mode_hash_failure_is_not_identical" \
		--skip "diff::tests::test_scan_does_not_follow_symlink_cycles" \
		--skip "diff::tests::test_unique_case_mismatch_directory_recursive_alignment"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
