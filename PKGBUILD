# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grit-cli
_pkgname=${pkgname%-cli}
pkgver=0.5.0
pkgrel=1
pkgdesc='LLM coded port of git to Rust'
url='https://grit-scm.com'
_url="https://github.com/gitbutlerapp/$_pkgname"
arch=(x86_64)
license=(GPL-2.0-only MIT)
depends=(glibc # libc.so ld-linux-x86-64.so
         libgcc libgcc_s.so)
makedepends=(cargo)
checkdepends=(git)
options=(!lto)
conflicts=($_pkgname)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('662a2e6c7847065d00569e28c83c91b8d03a3f5538f3923818590329bcb6b175')

_grit="target/release/$_pkgname"

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	export CARGO_BIN_EXE_grit="$_grit"
	local skipped=(
		ignore::gitignore_glob_tests::dir_star_extension_matches_nested_path
		ignore::gitignore_glob_tests::nested_dir_star_extension
		ls_files_full_name_from_subdir_no_pathspec
		ls_files_full_name_from_subdir_with_pathspec
		ls_tree_full_name_from_subdir_no_pathspec
		ls_tree_full_name_from_subdir_with_pathspec
		ls_tree_full_name_is_not_full_tree
		sha256_abbreviated_rev_parse_resolves
		sha256_clone_fetch_push_roundtrip
		sha256_commit_graph_write_and_read
		sha256_commit_produces_sha256_oid_resolvable_by_grit
		sha256_diff_raw_modify_and_delete
		sha256_diff_raw_null_oid_is_64_zeros
		sha256_fast_import_creates_sha256_objects
		sha256_fsck_clean_loose_and_packed
		sha256_grit_reads_git_delta_pack
		sha256_init_and_commit_roundtrip_readable_by_git
		sha256_log_reads_real_git_repo
		sha256_multi_pack_index_write_and_read
		sha256_notes_resolve
		sha256_reads_git_written_pack
		sha256_reflog_records_64_hex_oids
		sha256_reftable_reflog_roundtrip
		sha256_reftable_refs_roundtrip
		sha256_repack_pack_verified_by_git
		sha256_rev_list_reads_real_git_repo
		sha256_show_reads_real_git_repo
		sha256_split_index_roundtrip
	)
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_grit"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
