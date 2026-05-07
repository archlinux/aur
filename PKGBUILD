# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=unsloth
pkgname="$_pkgbase"
pkgver=0.1.39.beta
pkgrel=1
pkgdesc='Web UI for training and running open models locally'
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
	'nvm'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install=setup.install
source=(
	"$_pkgbase::git+https://github.com/unslothai/unsloth.git#tag=v${pkgver/.beta/-beta}"
	"unsloth-setup"
	"fix-assistant-ui-message-repository-import.patch"
)
sha256sums=('d3b04de1e5611421ef210dc06c5bb665edd312fc37e4916925a6a4e41d48a321'
            '14444b022bd50269d474df655e74c3309959c1bd312214b7b431ed341b26a222'
            '2e446190015ccb8d403fc91d2b59fd7f3237230f1c6bd48034d43c624a5f0689')

prepare() {
	cd "$_pkgbase"
	patch -p1 < "$srcdir/fix-assistant-ui-message-repository-import.patch"
}

build() {
	# Build the Vite/TypeScript frontend
	cd "$_pkgbase/studio/frontend"
	npm install
	npm run build
	cd "$srcdir/$_pkgbase"

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
}
