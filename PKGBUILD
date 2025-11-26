# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=git-next
pkgver=2025.2.1
pkgrel=1
pkgdesc='Trunk-based development manager for a solo developer'
url="https://git.kemitix.net/kemitix/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(dbus
         gcc-libs
         glibc)
makedepends=(cargo
             clang)
checkdepends=(git)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29ad7daa1b497fcac32676180f805eab3203cd98cf2587e1342fd9a79d58b4ea')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
		git::repository::open::tests::commit_log::should_return_5_in_commit_log_when_searching_for_5th_item
		git::repository::open::tests::commit_log::should_return_capacity_25_in_commit_log_when_searching_for_garbage
		git::repository::open::tests::commit_log::should_return_single_item_in_commit_log_when_not_searching
		git::repository::open::tests::read_file::should_error_on_missing_file
		git::repository::open::tests::read_file::should_return_file
		git::validation::tests::positions::validate::where_branches_are_all_valid_should_return_positions
		git::validation::tests::positions::validate::where_dev_branch_is_not_based_on_main_should_error
		git::validation::tests::positions::validate::where_dev_branch_is_not_based_on_next_should_reset_next_branch_to_next_commit_on_dev_and_retryable_error
		git::validation::tests::positions::validate::where_next_branch_is_not_based_on_main_and_reset_of_next_fails_should_error
		server::tests::gitdir_validate_should_fail_a_git_repo_with_wrong_remote
		server::tests::gitdir_validate_should_pass_a_valid_git_repo
		server::tests::repo_details_find_default_push_remote_finds_correct_remote
    )
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
