# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-portfolio-returns"
pkgver=2.7.0
pkgrel=1
pkgdesc="Show portfolio returns in Fava"
arch=("any")
url="https://github.com/andreasgerstmayr/fava-portfolio-returns"
license=("GPL-2.0-only")
depends=("beancount" "fava" "python" "python-dateutil" "python-numpy" "python-pandas" "python-protobuf" "python-scipy")
makedepends=("esbuild" "npm" "python-build" "python-hatch-vcs" "python-hatchling" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b5b6c42c03cb3463296e3f33d43ca6128b642dcf4b66c4a8dcf490ff271ba2f')

build(){
 cd "$pkgname-$pkgver/frontend"
 # install scripts are blocked by npm, bundle with the system esbuild instead
 npm ci --ignore-scripts
 esbuild src/extension.ts --bundle --format=esm --loader:.css=file --outfile=../src/fava_portfolio_returns/FavaPortfolioReturns.js --minify
 cd ..
 export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
