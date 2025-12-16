# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitbutler
pkgver=0.18.3
pkgrel=2
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
             npm
             pnpm)
options=(!lto)
_archive="$pkgname-release-$pkgver"
source=("$url/archive/release%2F$pkgver/$_archive.tar.gz")
sha256sums=('07f9ce886adc6fadda764d8aa19bd84f62fcc3cba31558dbe24628bdfd0ebaa8')

prepare() {
	cd "$_archive"

	cargo fetch --locked --target "$(rustc --print host-tuple)"
	pnpm install --frozen-lockfile

	# disable ad-hoc pre-build script (we do it by hand in build(), see below)
	# disable updater artifacts (breaks build with "Unable to find a bundled project for the updater")
	# todo: disable updater completely (.plugins.updater |= null)
	# inject version (see scripts/release.sh)
	jq '.
			| (.build.beforeBuildCommand |= "")
			| (.bundle.createUpdaterArtifacts |= false)
			| (.version |= $pkgver)
			| (.bundle.externalBin |= $externalbin)
		' \
		--arg pkgver "$pkgver" \
		--argjson externalbin '["gitbutler-git-setsid", "gitbutler-git-askpass", "but"]' \
		crates/gitbutler-tauri/tauri.conf.release.json \
		> tauri.conf.arch.json
}

build() {
	cd "$_archive"
	export RUSTFLAGS+=' --cfg tokio_unstable'
	export RUSTC_BOOTSTRAP=1
	export CARGO_TARGET_DIR="$PWD/target"
	export OPENSSL_NO_VENDOR=true
	export LIBGIT2_NO_VENDOR=1
	export TURBO_TELEMETRY_DISABLED=1

	# keep in sync with crates/gitbutler-tauri/tauri.conf.release.json
	pnpm build:desktop -- --mode production
	cargo build \
		--release \
		--bins \
		-p gitbutler-git \
		-p but
	# keep in sync with crates/gitbutler-tauri/inject-git-binaries.sh
	for bin in target/release/{gitbutler-git-{askpass,setsid},but}; do
		cp -av "$bin" "crates/gitbutler-tauri/${bin##*/}-$(rustc --print host-tuple)"
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
