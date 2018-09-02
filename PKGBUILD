# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake
pkgver=5.2.2
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
	python python-requests python-wrapt python-ratelimiter
	python-configargparse python-yaml python-appdirs
)
makedepends=(python-setuptools)
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
license=(MIT)
source=("snakemake-$pkgver.tar.gz::https://bitbucket.org/snakemake/snakemake/get/v$pkgver.tar.gz")
sha256sums=('06caca4fa8615fccb2e1c4aa85299d32f985a6c53df670ea9b11665362ab1d62')

prepare() {
	rm -rf "$srcdir/$pkgname-$pkgver"
	mv "$srcdir/$pkgname-$pkgname-"* "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir" || exit 1
	local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
	
	install -d "$pkgdir/etc/bash_completion.d"
	PYTHONPATH="$PKGDIR/usr/lib/python$pyver/site-packages:$PYTHONPATH" \
		"$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
