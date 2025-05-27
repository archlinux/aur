# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitbutler
pkgver=0.14.26
pkgrel=1
url="https://github.com/${pkgname}app/$pkgname"
pkgdesc='Version control client, backed by Git, powered by Tauri/Rust/Svelte'
arch=(x86_64)
license=(LicenseRef-FSL-1.1-MIT)
depends=(gtk4
         webkit2gtk-4.1
         openssl
         libgit2)
makedepends=(cargo
             cargo-tauri
             cmake
             jq
             nodejs-lts-jod
	     pnpm)
_archive="$pkgname-release-$pkgver"
source=("$url/archive/release%2F$pkgver/$_archive.tar.gz"
	unvendor.patch)
sha256sums=('4a9321dc1b20c40c4527647a167cc05b4a63b51cb310b9818a3f4018b40470ee'
            '5a88854ac7fbdf1edbb342de8ec4ef6d0fc7e8a7fcc3499bc7fabc1215f047dc')

prepare() {
	cd "$_archive"

	# do not vendor system libraries
	patch -Np1 -i "$srcdir/unvendor.patch"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pnpm install --frozen-lockfile

	# disable ad-hoc pre-build script (we do it by hand in build(), see below)
	# disable updater artifacts (breaks build with "Unable to find a bundled project for the updater")
	# todo: disable updater completely (.plugins.updater |= null)
	# inject version (see scripts/release.sh)
	jq '.
		| (.build.beforeBuildCommand |= "")
		| (.bundle.createUpdaterArtifacts |= false)
		| (.version |= $pkgver)
		' \
		--arg pkgver "$pkgver" \
		crates/gitbutler-tauri/tauri.conf.release.json \
		>tauri.conf.arch.json
}

build() {
	cd "$_archive"
	export CFLAGS+=' -ffat-lto-objects'
	export CXXFLAGS+=' -ffat-lto-objects'
	export RUSTFLAGS+=' --cfg tokio_unstable'
	export RUSTC_BOOTSTRAP=1
	export CARGO_TARGET_DIR="$PWD/target"

	# keep in sync with crates/gitbutler-tauri/tauri.conf.release.json
	pnpm build:desktop -- --mode production
	cargo build \
		--release --bins \
		-p gitbutler-git
	# keep in sync with crates/gitbutler-tauri/inject-git-binaries.sh
	local _triple="$(rustc -vV | sed -n 's/host: //p')"
	for bin in target/release/gitbutler-git-{askpass,setsid}; do
		cp -av "$bin" "crates/gitbutler-tauri/${bin##*/}-${_triple}"
	done
	# tauri does not have "bare files" bundler, piggyback on the deb one
	cargo tauri build \
		--bundles deb \
		--config tauri.conf.arch.json
}

package() {
	cd "$_archive"
	cp -vdR --preserve=mode,timestamps \
		target/release/bundle/deb/*/data \
		-T "$pkgdir"

	# rename the .desktop file to match the Tauri app ID, in order to
	# provide expected behavior w/ enableGTKAppId in tauri.conf.json
	mv "$pkgdir/usr/share/applications"/{GitButler.desktop,com.gitbutler.app.desktop}

	install -Dm644 LICENSE.md \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
