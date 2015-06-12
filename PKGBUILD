# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=seafile-client-cli
pkgver=4.2.4
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile cli client for synchronizing your local files with seafile server."
arch=('any')
url="https://github.com/haiwen/seafile/"
license=('GPL')
depends=('seafile-shared>=4.2.4' 'libevent')
makedepends=('vala' 'sed')
optdepends=()
options=('!libtool' '!emptydirs')
source=("https://github.com/haiwen/seafile/archive/v${pkgver}.tar.gz")

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
sha256sums=('19df0f91be4980c3f0dd7d8241d73007bb25f05572275d054fd8d14e5b88e212')
