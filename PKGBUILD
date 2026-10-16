# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=soldr
pkgver=0.9.33
pkgrel=1
pkgdesc='leverage crgx and zccache to run Rust tools with cached results'
arch=(x86_64)
url="https://github.com/zackees/$pkgname"
license=(AGPL-3.0-only)
depends=(glibc
         libgcc
         rustup)
makedepends=(cargo)
checkdepends=(clang)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('33021aca299071aabeb121dd5e95c368d67ae54f2d0353bb7b29394b11163b2a')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
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
	cargo build --release --frozen
}

check() {
	_srcenv
	local skipped=(
		binaries::tests::channel_scoped_lookup_uses_the_installer_watchdog_not_generic_silence
		cargo_front_door::line_endings::tests::crlf_probe_runs_once_for_lexical_aliases_of_a_repo
		cargo_front_door::line_endings::tests::no_warning_probe_result_is_cached_for_the_process 
		cargo_front_door::orphan_rmeta::tests::prune_leaves_rmeta_alone_while_another_build_holds_the_lock
		cli_cargo_basic::cargo_build_warns_in_yellow_when_git_autocrlf_is_true
		cook::tests::index_cooked_artifact_skips_archive_pack_when_daemon_unavailable
		install::acquire::tests::shallow_clone_rev_checks_out_exact_sha
		install::remote_ref::tests::new_upstream_commit_is_used_on_reinstall
		prepare_cmd::tests::apply_blessed_prep_env_exports_mingw_and_syslib_env
		prepare_cmd::tests::apply_blessed_prep_env_exports_msvc_target_env
		prepare_cmd::tests::darwin_prepare_exports_blessed_env_for_deferred_cook
		prepare_cmd::tests::rustup_add_target_scopes_to_pinned_toolchain_channel
		prepare_cmd::tests::rustup_add_target_uses_soldr_managed_rustup_state
		prepare_cmd::tests::rustup_target_add_timeout_is_an_explicit_safety_ceiling
	)
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
