# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zccache
pkgver=1.15.6
pkgrel=2
pkgdesc='compiler cache for C/C++/Rust; drop in replacement for sccache and ccache'
arch=(x86_64)
url="https://github.com/zackees/$pkgname"
license=(AGPL-3.0-only)
depends=(glibc
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('9860f58903c891846d55e1a9a9480693579678701d8cb8f8a94108f926858a0f')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --release --frozen --features "$pkgname-bin"
}

check() {
	_srcenv
	local skipped=(
		cli_cache_root::cache_root_default_branch_reports_default_source_when_env_unset
		cli_cache_root::cache_root_default_prints_absolute_path
		cli_cache_root::cache_root_env_branch_reports_env_source
		cli_cache_root::cache_root_json_reports_daemon_namespace_and_derived_endpoint
		cli_cache_root::cache_root_relative_env_path_is_absolute_in_output
		cli_cache_root::daemon_namespace_does_not_move_cargo_registry_archives
		cli_cli_crash_test::cli_panic_writes_dump_with_zccache_stem
		cli_cli_crash_test::cli_sigsegv_writes_dump_with_zccache_stem
		cli_defender_exclusions::non_windows_add_and_remove_exit_zero
		cli_defender_exclusions::non_windows_check_exits_zero_with_known_message
		cli_defender_exclusions::non_windows_check_json_emits_supported_false
		cli_no_spawn_guard::guard_accepts_true_value_variant
		cli_no_spawn_guard::session_start_refuses_to_spawn_under_no_spawn
		cli_no_spawn_guard::start_refuses_to_spawn_under_no_spawn
		cli_no_spawn_guard::zero_value_does_not_trip_guard
		cli_rust_plan_lifecycle::rust_plan_auto_backend_without_gha_env_uses_local_backend
		cli_rust_plan_lifecycle::rust_plan_explicit_gha_backend_without_env_reports_backend_unavailable
		cli_rust_plan_lifecycle::rust_plan_full_mode_cli_restores_target_tree_and_prunes_incremental
		cli_rust_plan_lifecycle::rust_plan_session_stats_lookup_errors_surface_in_json
		cli_rust_plan_lifecycle::rust_plan_validate_json_reports_compatibility_error_without_cache_mutation
		cli_wrapper_startup_budget::compiler_wrapper_passthrough_stays_within_budget
		cli_wrapper_startup_budget::development_namespace_is_not_rehashed_per_invocation
		single_binary_distribution::zccache_copy_dispatches_as_download_daemon
	)
	cargo test --frozen -p $pkgname --test cli -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
