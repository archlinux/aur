# Maintainer: MiguelNdeCarvalho <youremail@domain.com>

pkgname=terrabutler
# https://github.com/montblu/terrabutler/releases
pkgver=1.1.0
pkgrel=1
pkgdesc="A Python utility to manage IaC via Terraform by dividing code into categories and changing environments "
arch=(x86_64)
url="https://docs.montblu.eu/terrabutler/"
license=('GPL-3.0')
makedepends=('python' 'python-pip')
source=("https://github.com/montblu/terrabutler/archive/refs/tags/v$pkgver.zip")
sha256sums=('4c4657af3edc20f08c1dc1121af2bcfb3bde374aabf049abf66d4ab80533e459')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i='' "s/dev/$pkgver/g" terrabutler/__init__.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python -m venv "$PWD/venv"
	"$PWD/venv/bin/python" -m pip install -r requirements.txt pyinstaller
	"$PWD/venv/bin/python" -m PyInstaller --clean -y --dist ./dist/terrabutler --workpath /tmp terrabutler/terrabutler.spec
}

package() {
	INSTALL_DIR="${pkgdir}/usr/share/terrabutler"
	BIN_DIR="${pkgdir}/usr/bin"

	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$INSTALL_DIR"
	cp -a "dist/terrabutler/terrabutler/." "$INSTALL_DIR"

	mkdir -p "$BIN_DIR"
	ln -s "/usr/share/terrabutler/terrabutler" "${BIN_DIR}/terrabutler"
}
