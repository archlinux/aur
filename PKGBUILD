# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=unsloth
pkgname="$_pkgbase-git"
pkgver=0.1.800.beta.r56.g0ac2e79
pkgrel=1
pkgdesc='Local UI to run and train LLMs and diffusion models'
arch=('x86_64')
url='https://github.com/unslothai/unsloth'
license=('Apache-2.0' 'AGPL-3.0-or-later')
depends=(
	'python'
	'python-typer'
	'python-pydantic'
	'python-yaml'
	'python-nest-asyncio'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'npm'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install=setup.install
source=(
	"$_pkgbase::git+https://github.com/unslothai/unsloth.git"
	"unsloth-setup"
	"unsloth-studio.desktop"
)
sha256sums=('SKIP'
            '14444b022bd50269d474df655e74c3309959c1bd312214b7b431ed341b26a222'
            '7eb6fb0d8576c26ab9e647dc4a69b546fc8f9a972a66a0f7f44eec0695610b6f')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	# Build the Vite/TypeScript frontend
	cd "$_pkgbase/studio/frontend"
	npm install
	npm run build
	cd "$srcdir/$_pkgbase"

	rm -rf dist
	python -m build --wheel
}

package() {
	cd "$_pkgbase"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Ship install.sh so users can run it post-install to create the per-user
	# studio venv (~/.unsloth/studio/unsloth_studio) with PyTorch etc.
	install -Dm755 install.sh "$pkgdir/usr/share/$_pkgbase/install.sh"

	# Convenience wrapper to run the setup installer from PATH.
	install -Dm755 "$srcdir/unsloth-setup" "$pkgdir/usr/bin/unsloth-setup"

	install -Dm644 "$srcdir/unsloth-studio.desktop" \
		"$pkgdir/usr/share/applications/unsloth-studio.desktop"

	install -Dm644 "studio/frontend/public/rounded-512.png" \
		"$pkgdir/usr/share/icons/hicolor/512x512/apps/unsloth-studio.png"
	install -Dm644 "studio/src-tauri/icons/128x128.png" \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/unsloth-studio.png"
	install -Dm644 "studio/src-tauri/icons/32x32.png" \
		"$pkgdir/usr/share/icons/hicolor/32x32/apps/unsloth-studio.png"
}
