# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=duplicity-dev
pkgver=0.8.00
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
	'python-b2'
	'python-boto'
	'python-paramiko'
	'python-pydrive'
	'python-swiftclient'
	'python-requests-oauthlib'
)
provides=('duplicity')
conflicts=('duplicity')
source=("https://code.launchpad.net/duplicity/0.8-series/0.8.00/+download/duplicity-$pkgver.tar.gz"{,.sig})
md5sums=('e6a48e847e1778548133bc3723548723'
		 'SKIP')
validpgpkeys=('9D95920CED4A8D5F8B086A9F8B6F8FF4E654E600')

prepare() {
	cd "duplicity-$pkgver"
	sed -i 's_^#!.*/usr/bin/env.*python2$_#!/usr/bin/env python_' \
		bin/rdiffdir \
		duplicity/compilec.py
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
