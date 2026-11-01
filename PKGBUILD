# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-dashboards"
pkgver=2.0.2
pkgrel=1
pkgdesc="Custom Dashboards for Beancount in Fava"
arch=("any")
url="https://github.com/andreasgerstmayr/fava-dashboards"
license=("MIT")
depends=("beanquery" "fava" "python" "python-flask" "python-yaml")
makedepends=("esbuild" "npm" "python-build" "python-hatch-vcs" "python-hatchling" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5845994b01c33daf482f1412e84581b9ed4fee4e7651eb2dfc7cf1e04caba348')

build(){
 cd "$pkgname-$pkgver/frontend"
 # install scripts are blocked by npm, bundle with the system esbuild instead
 npm ci --ignore-scripts
 esbuild src/extension.ts --bundle --format=esm --loader:.css=file --outfile=../src/fava_dashboards/FavaDashboards.js --minify
 cd ..
 export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
