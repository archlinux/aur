# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=duplicity-dev
pkgver=0.8.08
pkgrel=1
pkgdesc="A utility for encrypted, bandwidth-efficient backups using the rsync algorithm. Development version"
arch=(x86_64)
url="http://duplicity.nongnu.org/"
license=('GPL')
depends=(
	'librsync'
	'python-fasteners'
	'python-future'
	'python-requests'
	'python-urllib3'
)
makedepends=('python-setuptools')
# Note: these are based entirely on the requirements.txt file.
# Install whatever ones you need for your use case.
optdepends=(
	'python-azure'
	'python-b2sdk'
	'python-boto'
	'python-paramiko'
	'python-pydrive'
	'python-swiftclient'
	'python-requests-oauthlib'
)
provides=('duplicity')
conflicts=('duplicity')

# source=("https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-$pkgver.tar.gz"{,.asc})
# # developer’s gpg key is not available from keyservers, as of 2019-12-19
source=("https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-$pkgver.tar.gz")

sha512sums=(
    '968ba458b896874ba1af41753927a01446649ea1864128f3a8ac62e31416656e36844ae62a3408e3d82588da3c23929c714bbdb01b6472a80c2f695801985a15'
)

prepare() {
	cd "duplicity-$pkgver"
	sed -i 's_^#!.*/usr/bin/env.*python2$_#!/usr/bin/env python_' \
		bin/rdiffdir \
		compilec.py
}

build() {
	cd "duplicity-$pkgver"
	python setup.py build
}

package() {
	cd "duplicity-$pkgver"
	python setup.py install --root="$pkgdir"

	# fix broken documentation permissions until upstream does (FS#27301)
	chmod -R +r "$pkgdir/usr/share/doc/duplicity-$pkgver"
}
