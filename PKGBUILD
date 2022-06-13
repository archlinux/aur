# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=bcml-git
_name=BCML
pkgver=r1178.95cab60
pkgrel=1
pkgdesc="Breath of the Wild Cross-Platform Mod Loader: A mod merger and manager for BOTW"
arch=('x86_64')
url="https://github.com/NiceneNerd/BCML"
license=('GPL3')
depends=(
		'python>=3.7'
		'p7zip'
		'python-numpy'
		'python-aamp'
		'python-byml'
		'python-botw-utils'
		'python-botw_havok'
		'python-oead'
		'python-pycrosskit'
		'python-pyqtwebengine'
		'python-qtpy'
		'python-pywebview'
		'python-pyaml'
		'python-requests'
		'python-rstb'
		'python-xxhash'
)
makedepends=(
			'git'
			'npm'
			'nodejs>=14.0.0'
			'mkdocs'
			'mkdocs-material'
			'python-installer'
			'gendesk'
			'cargo-nightly'
			'maturin'
			'cmake'
)
optdepends=('cemu')
source=('git+https://github.com/NiceneNerd/BCML' "${_name}.png::https://i.imgur.com/OiqKPx0.png")
sha256sums=('SKIP'
            'f20788bc2187b7b5d40d8b63a97b9cacdd986f8d0d77c6c456561e7fbd68179a')

pkgver() {
	cd "${srcdir}/${_name}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	gendesk --pkgname "${_name}" --pkgdesc "${pkgdesc}" --exec "bcml %u" --mimetypes "x-schema-handler/bcml"
}

build() {
	cd "${srcdir}/${_name}/bcml/assets"
	npm install --cache "${srcdir}/npm-cache"
	npm run build

	cd "${srcdir}/${_name}"
	mkdocs build -d ./bcml/assets/help
	
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target

	maturin build --release
}

package() {
	cd "${srcdir}/${_name}"
	python -m installer --destdir="$pkgdir" target/wheels/*.whl
	install -Dm644 "${srcdir}/${_name}.desktop" "$pkgdir/usr/share/applications/${_name}.desktop"
	install -Dm644 "${srcdir}/${_name}.png" "$pkgdir/usr/share/pixmaps/${_name}.png"
}
