# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=4.2.2
pkgrel=1
pkgdesc="Next-generation open source cloud storage with advanced features on privacy protection and teamwork. (Server components, without seahub)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL3')
depends=('seafile-shared>=4.2.4' 'python2-mako' 'python2-dateutil' 'python2-webpy' 'python2-pip' 'python2-virtualenv' 'python2-flup' 'python2-six' 'libevhtp-seafile<=1.2.9' 'fuse')
makedepends=('vala' 'intltool')
optdepends=()
provides=()
conflicts=('django' 'django-rest-framework', 'seafile')
options=('!libtool' '!emptydirs')
install=seafile-server.install
source=("https://github.com/haiwen/seafile/archive/v${pkgver}-server.tar.gz"
        "seafile-admin_virtualenv.patch"
        "seafile-server.install"
        "seafile-server@.service"
        "seahub-preupgrade"
        "0001-Revert-server-put-pids-folder-out-of-seafile-data.patch")

prepare ()
{
	cd "${srcdir}/seafile-${pkgver}-server"
	patch -p1 -i ${srcdir}/seafile-admin_virtualenv.patch
	patch -p1 -i ${srcdir}/0001-Revert-server-put-pids-folder-out-of-seafile-data.patch
}

build ()
{
	cd "${srcdir}/seafile-${pkgver}-server"
	./autogen.sh
	./configure --enable-server --disable-client --disable-python --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
}

package ()
{
	# Install library and header files
	cd "${srcdir}/seafile-${pkgver}-server"
	make DESTDIR="${pkgdir}/" install

	# Remove files already installed by seafile-shared
	# to maintain compatibility
	rm -rf "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/include"

	# Install all scripts
	mkdir -p "${pkgdir}/usr/share/$pkgname"
	cp -r -p "${srcdir}/seafile-${pkgver}-server/scripts" "${pkgdir}/usr/share/$pkgname/scripts"
	# Remove win32-specific scripts
	rm -rf "${pkgdir}/usr/share/$pkgname/scripts/upgrade/win32"
	# Fix all script's  python 2 requirement 
	egrep -s -l -r '#!/usr/bin/env python' "${pkgdir}" | xargs sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g'
	# Fix upgrade script's invald use of $INSTALLPATH to find seafile binaries
	sed -i 's|${INSTALLPATH}/seafile/bin|/usr/bin|g' "${pkgdir}/usr/share/seafile-server/scripts/upgrade/upgrade_2.2_3.0.sh"

	# Workaround for strange behaviour in the Makefile, which
	# installs python bindings in the package root directory,
	# even though they were disabled
	rm -rf "${pkgdir}/seaserv"
	rm -rf "${pkgdir}/seafile"

	# Install license
	install -D -m644 "${srcdir}/seafile-${pkgver}-server/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	# Install systemd service
	install -D -m644 "${srcdir}/seafile-server@.service" "${pkgdir}/usr/lib/systemd/system/seafile-server@.service"

	# Install seahub preupgrade script
	install -D -m755 "${srcdir}/seahub-preupgrade" "${pkgdir}/usr/bin/seahub-preupgrade"
}
sha256sums=('8c131d5fb9f42023aca851fc1d32c4ef774063c3bc751860b88c68a2daceb295'
            '4127284c1d8a4d071925cbcc870ca460fd736e2d53e8ab5806ccf3dd03d5e537'
            '315e753e8f5dc41cc88a0b65c7db68c097d67674c8b466319486da6a749f541f'
            '943ed1bb7d4908b452ce8b7abff26e56f3f24582f6a2cf6e0dc4bf2bffd0a6d8'
            '6a04e89eee4030d06d79f21912c7aa531dfc7beb5d3f51b66ec2bd62f95401ec'
            'b1748e826d8e7cccdd825b99864b74dfb5795312f8878d63e9a87105f4382e29')
