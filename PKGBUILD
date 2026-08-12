# Maintainer: chadsr <git at ross dot ch>

pkgname=rotki
pkgver=1.43.2 # renovate: datasource=github-releases depName=rotki/rotki
pkgrel=3
pkgdesc='A portfolio tracking, analytics, accounting and management application that protects your privacy'
arch=('x86_64' 'aarch64')
url='https://github.com/rotki/rotki'
license=('AGPL-3.0-only')
_electron=electron41
conflicts=("$pkgname-bin")
depends=(
	"$_electron"
	'zlib'
	'hicolor-icon-theme'
)
makedepends=(
	'python'
	'uv'
	'cargo'
	'nodejs'
	'pnpm'
	'nvm'
	'libxcrypt-compat'
)
options=(!lto)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"rotki.sh"
	"rotki.desktop"
	"resources-path.cjs"
)
b2sums=('8c04bfcb727cc1720e362f896f83491fef6db99687574818aa65d799308533f2cfbf784bd781bf35d431553231fc69eb0812f3ec1761cabcf158f4548cb52671'
	'd29df9c9116e94e650552b1bb36fcb546fff001609a264fb4e7fb211d9222d3f974a10bd3108f07d4b5012ebeee27303b422ca96d80f5f6eaf91ccc6a5e3e2d9'
	'5a82adf633e21f6655532b9fb84c9e38135396e39ace6af82258c5f4ee102cde914ec51e1c33b5f110f7751df9cfa42b62c2ebe39bb174eb92fdfbbb62bb6fba'
	'dd7658075a2181d7e41b5abc479b0b2beaad8f7ea0406555d805396aabadf5ed7c978d8a60f27fc1fb480ac0e173e52f05226cf44917d783f6fd76d144cca516')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# shellcheck source=/dev/null
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	_ensure_local_nvm

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
		--manifest-path ./colibri/Cargo.toml

	uv sync --group packaging

	# Rotki doesn't include pyinstaller as a UV dependency, so install it
	uv pip install pyinstaller

	cd frontend
	nvm install
	nvm use
	export CYPRESS_INSTALL_BINARY=0 # Avoid downloading Cypress binary during frontend install
	pnpm install --frozen-lockfile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	_ensure_local_nvm

	# Build colibri rust binary
	export RUSTUP_TOOLCHAIN=stable
	cargo build \
		--frozen \
		--target-dir build/colibri \
		--manifest-path ./colibri/Cargo.toml \
		--release

	mkdir -p build/colibri/bin/
	mv build/colibri/release/colibri build/colibri/bin/

	# Create the Python backend onefile with PyInstaller from rotkehlchen.spec
	export PYTHONOPTIMIZE=2
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	uv run pyinstaller --noconfirm --clean --distpath "${PWD}/build/backend" rotkehlchen.spec

	# Build the Electron frontend
	cd frontend
	nvm use
	export ROTKI_VERSION="$pkgver"
	pnpm run build
	pnpm run electron:package -- --dir \
		-c.electronDist=/usr/lib/$_electron \
		-c.electronVersion="$(cat /usr/lib/$_electron/version)"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	_resources="frontend/app/build/linux-unpacked/resources"

	# App resources
	install -d "$pkgdir/usr/lib/$pkgname"
	install -Dm644 "$_resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -a "$_resources/backend" "$_resources/colibri" "$pkgdir/usr/lib/$pkgname/"

	# Override process.resourcesPath for system electron
	install -Dm644 "$srcdir/resources-path.cjs" "$pkgdir/usr/lib/$pkgname/resources-path.cjs"

	# Launcher
	install -Dm755 "$srcdir/rotki.sh" "$pkgdir/usr/bin/rotki"

	# Desktop file
	install -Dm644 "$srcdir/rotki.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	# Icon
	install -Dm644 frontend/app/public/assets/images/protocols/rotki.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/rotki.svg"

	# License
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
