# Maintainer: chadsr <git at ross dot ch>

pkgname=rotki
pkgver=1.43.2 # renovate: datasource=github-releases depName=rotki/rotki
pkgrel=2
pkgdesc='A portfolio tracking, analytics, accounting and management application that protects your privacy'
arch=('x86_64' 'aarch64')
url='https://github.com/rotki/rotki'
license=('AGPL-3.0-only')
provides=("$pkgname")
conflicts=("$pkgname-bin")
depends=(
	'gtk3'
	'nss'
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
)
sha512sums=('7056697b15864f7fbed3d932b007453ec829a2ea4130c346f86a694f5215c43beaf7f3dd2d8ad33b7273db8ed65b8936ac8c4df668b8dfefdb45a829ebdbfe35'
	'eb0bda9312d9b7f09d758c7b13dc60acb32af5119b63e526c04b52bf15630cc80d0a69d867aa062253c332592e5e6490ea63f8f765023032d4994a6a2fe05cca'
	'ecaa5f356d0fabe9b6baa1432c6f047f9acfc75d5dc0e859dab06e182b34c9442cefcff1efac8cec826dc943c7f0f85e5809aea60dea21c99b41927f17e5117a')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# shellcheck source=/dev/null
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	cd "$srcdir/$pkgname-$pkgver" || exit
	_ensure_local_nvm

	uv sync --group packaging

	# Rotki doesn't include pyinstaller as a UV dependency, so install it
	uv pip install pyinstaller

	cd frontend || exit
	nvm install
	nvm use
	export CYPRESS_INSTALL_BINARY=0 # Avoid downloading Cypress binary during frontend install
	pnpm install --frozen-lockfile
}

build() {
	cd "$srcdir/$pkgname-$pkgver" || exit
	_ensure_local_nvm

	# Build colibri rust binary
	cargo build \
		--target-dir build/colibri \
		--manifest-path ./colibri/Cargo.toml \
		--release

	mkdir -p build/colibri/bin/
	mv build/colibri/release/colibri build/colibri/bin/

	# Create the Python backend onefile with PyInstaller from rotkehlchen.spec
	export PYTHONOPTIMIZE=2
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	uv run pyinstaller --noconfirm --clean --distpath "${PWD}/build/backend" rotkehlchen.spec

	# Build the Electron frontend and package into an unpacked directory (--dir)
	cd frontend || exit
	nvm use
	export ROTKI_VERSION="$pkgver"
	pnpm run build
	pnpm run electron:package -- --dir
}

package() {
	cd "$srcdir/$pkgname-$pkgver" || exit

	install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin"

	# Move the unpacked electron app produced by electron-builder --dir
	mv frontend/app/build/linux-unpacked/* "$pkgdir/opt/$pkgname/"

	install -Dm755 "$srcdir/rotki.sh" "$pkgdir/usr/bin/rotki"

	install -Dm644 "$srcdir/rotki.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 frontend/app/public/assets/images/protocols/rotki.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rotki.svg"

	# License
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
