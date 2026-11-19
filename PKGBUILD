# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-dashboards"
pkgver=2.0.3
pkgrel=1
pkgdesc="Custom Dashboards for Beancount in Fava"
arch=("any")
url="https://github.com/andreasgerstmayr/fava-dashboards"
license=("MIT")
depends=("beanquery" "fava" "python" "python-flask" "python-yaml")
makedepends=("esbuild" "npm" "python-build" "python-hatch-vcs" "python-hatchling" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('235cbe136d001e4c3915404a5613930d57046f14a7647bf90c6a2cb6b0d82e5f')

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
