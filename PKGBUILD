# Maintainer: jzbor <zborof at posteo dot de>
pkgname=sdiff-gtk
_name=$pkgname
pkgver=0.1.0
pkgrel=2
pkgdesc="GTK+ frontend for Stable Diffusion"
arch=(any)
url="https://github.com/jzbor/$_name"
license=('MIT')
groups=()
depends=(python python-gobject python-diffusers python-pillow python-pytorch python-transformers python-accelerate)
makedepends=(python-poetry python-installer)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "$_name" "$_name.desktop")
noextract=()
sha512sums=('ca329071b9d6486ab026f302049cb39f9952faf2047d398dece181a0a31be8fb1eab5455031c04a56dd66920e0cca44cf944e3aa1d966306cefa13267e1c4b85' SKIP SKIP)
validpgpkeys=()

build() {
	cd "$_name-$pkgver"
	poetry build
}

package() {
	# install launcher skript
	local site_packges_escaped="$(python -c 'import site; print(site.getsitepackages()[0])' | sed 's/\//\\\//g')"
	install -D "$_name" "$pkgdir/usr/bin/$_name"
	sed -i "s/PYTHON_SITEPACKAGES/$site_packges_escaped/g" "$pkgdir/usr/bin/$_name"

	# install desktop file
	install -D "$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"

	# install actual python wheel
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
