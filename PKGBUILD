# Maintainer: fnrir <fnr1r0@protonmail.com>
pkgname=vscodium-prod-patcher
pkgver=1.1.0
pkgrel=3
epoch=
pkgdesc="Universal patcher for VSCodium"
arch=(any)
url="https://github.com/fnr1r/$pkgname"
license=('GPL')
groups=()
depends=(
	vscodium
	pyalpm
	python-toml
	python-mashumaro python-tomli python-tomli-w
)
makedepends=(
	python-build python-installer python-wheel
	python-hatchling
)
checkdepends=()
optdepends=(
	"python-inquirer: tui configuration"
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
	"git+$url#tag=v$pkgver"
	vscodium-prod-patcher.hook.in
)
noextract=()
sha256sums=(
	SKIP
	69511beee552992451ffe9fdeda4e42fd69729b973410d7eafe6dc05b7485209
)
validpgpkeys=()

build() {
	sed -E "s|@PACKAGE_NAME@|$pkgname|" \
		< vscodium-prod-patcher.hook.in \
		> vscodium-prod-patcher.hook
	cd "$pkgname"
	python -m build --wheel --no-isolation \
		--outdir dist
	python -m build --wheel --no-isolation \
        --outdir dist \
        src/vscodium_prod_patcher_alpm_ini
}

package() {
	for wheel in "$pkgname/dist"/*.whl; do
		python -m installer --destdir="$pkgdir" "$wheel"
	done
	install -Dm 644 vscodium-prod-patcher.hook \
		"$pkgdir/usr/share/libalpm/hooks/97-vscodium-prod-patcher-self.hook"
}
