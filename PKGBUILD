# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake
pkgver=7.16.1
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
	python
	python-wrapt
	python-requests
	python-ratelimiter
	python-yaml
	python-configargparse
	python-appdirs
	python-datrie
	python-jsonschema
	python-docutils
	python-gitpython
	python-psutil
	jupyter-nbformat
	python-toposort
	python-connection_pool
	'python-pulp>=2.0'
	'python-smart_open>=3.0'
	python-stopit
	python-tabulate
	python-yte
	python-jinja
	python-reretry
)
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=(
	'python-pygments: For report generation'
	'python-biopython: For GenBank/NCBI Entrez support'
	'python-easywebdav: For WebDAV support'
	'python-pysftp: For SFTP support'
	'python-boto3: For AWS support'
	'python-moto: For AWS support'
	'python-dropbox: For Dropbox support'
	'python-ftputil: For FTP support'
	'python-xrootd: For XRootD support'
	'slacker: For messaging'
)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('db485c8c9cfea3f0f8e229e4b410ab2727d7cbe4d6c6c197d30dd0ef1cd58989')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
	
	install -d "$pkgdir/etc/bash_completion.d"
	PYTHONPATH="$pkgdir/usr/lib/python$pyver/site-packages:$PYTHONPATH" \
		"$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
