# Maintainer: Juanma Hernandez <juanmah@gmail.com>

pkgname=meteocat-wallpaper-git
pkgver=0.9.0.r44.7b9082f
pkgrel=1
pkgdesc="Generate and set meteo.cat wallpapers with radar overlays"
arch=('any')
url="https://github.com/juanmah/meteocat"
license=('custom')
depends=('python' 'python-requests' 'python-typer' 'python-tqdm' 'python-rich' 'python-pydantic' 'python-pillow' 'python-cairosvg' 'python-gobject' 'cairo' 'glib2' 'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'git')
optdepends=('gsettings: for setting the desktop wallpaper')
source=("${pkgname}::git+https://github.com/juanmah/meteocat.git" "config.yaml")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    local _version=$(grep '^version = ' pyproject.toml | sed 's/version = "\(.*\)"/\1/')
    printf "%s.r%s.%s" "$_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    /usr/bin/python -m build --wheel
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "$srcdir/config.yaml" "$pkgdir/usr/lib/python3.14/site-packages/meteocat/config.yaml"
}
