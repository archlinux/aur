# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake
pkgver=5.4.2
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
	python python-requests python-wrapt python-ratelimiter
	python-configargparse python-yaml python-appdirs
	python-docutils python-datrie python-jsonschema
)
makedepends=(python-setuptools python-gitpython)
optdepends=(
	'graphviz: For DAG visualization'
	'python-jinja: For report generation'
	'python-networkx: For report generation'
	'python-biopython: For GenBank/NCBI Entrez support'
	'python-easywebdav: For WebDAV support'
	'python-pysftp: For SFTP support'
	'python-boto3: For AWS support'
	'python-moto: For AWS support'
	'python-dropbox: For Dropbox support'
	'python-ftputil: For FTP support'
	'xrootd: For XRootD support'
	'python-psutil: For benchmarking'
)
license=(MIT)
source=("snakemake-$pkgver.tar.gz::https://bitbucket.org/snakemake/snakemake/get/v$pkgver.tar.gz")
sha256sums=('51e08ba773d835f08a752078286b8bb5ac81be82778a7bec7b09195c03f2b888')

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
	PYTHONPATH="$pkgdir/usr/lib/python$pyver/site-packages:$PYTHONPATH" \
		"$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
