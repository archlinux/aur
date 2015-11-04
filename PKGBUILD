# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client-cli
pkgver=4.4.2
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile cli client for synchronizing your local files with seafile server."
arch=('any')
url="https://github.com/haiwen/seafile/"
license=('GPL')
depends=('seafile-shared>=4.4.2' 'libevent')
makedepends=('vala')
options=('!libtool' '!emptydirs')
source=("seafile-client-cli-v${pkgver}.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}.tar.gz")

build ()
{
	cd "$srcdir/seafile-${pkgver}"
	./autogen.sh
	./configure --disable-server --enable-client --disable-console --prefix=/usr PYTHON=/usr/bin/python2
	make -j1

	# Fix cli client's python 2 requirement
	sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' ${srcdir}/seafile-${pkgver}/app/seaf-cli
}

package ()
{
	# Install cli client
	install -D -m755 ${srcdir}/seafile-${pkgver}/app/seaf-cli ${pkgdir}/usr/bin/seaf-cli

	# Install license
	install -D -m644 ${srcdir}/seafile-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
sha256sums=('d1dbfaf22b879858cd1899e8c2b01ee8beaba4b84f5dba301adc8eabfca64e03')
