# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-server
pkgver=5.0.2
pkgrel=4
pkgdesc="Next-generation open source cloud storage with advanced features on privacy protection and teamwork. (Server components, without seahub)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL3')
depends=('seafile-shared=5.0.2' 'python2-mako' 'python2-dateutil' 'python2-webpy' 'python2-pip' 'python2-virtualenv' 'python2-flup' 'python2-six' 'libevhtp-seafile=1.2.9' 'git')
makedepends=('vala' 'intltool')
conflicts=('django' 'django-rest-framework', 'seafile')
options=('!libtool' '!emptydirs')
install=seafile-server.install
source=("https://github.com/haiwen/seafile/archive/v${pkgver}-server.tar.gz"
    "seafile-admin_virtualenv.patch"
    "seafile-server.install"
    "seafile-server@.service"
    "seahub-preupgrade"
    "create-default-conf-dir.patch"
    "0001-Revert-server-put-pids-folder-out-of-seafile-data.patch")

prepare () {
    cd "${srcdir}/seafile-${pkgver}-server"
    patch -p1 -i ${srcdir}/seafile-admin_virtualenv.patch
    patch -p1 -i ${srcdir}/0001-Revert-server-put-pids-folder-out-of-seafile-data.patch
    patch -p1 -i ${srcdir}/create-default-conf-dir.patch
}

build () {
    cd "${srcdir}/seafile-${pkgver}-server"
    ./autogen.sh
    ./configure --enable-server --disable-client --disable-python --prefix=/usr PYTHON=/usr/bin/python2
    make -j1
}

package () {
    # Install library and header files
    cd "${srcdir}/seafile-${pkgver}-server"
    make DESTDIR="${pkgdir}" install

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

    # Install systemd service
    install -D -m644 "${srcdir}/seafile-server@.service" "${pkgdir}/usr/lib/systemd/system/seafile-server@.service"

    # Install seahub preupgrade script
    install -D -m755 "${srcdir}/seahub-preupgrade" "${pkgdir}/usr/bin/seahub-preupgrade"
}

sha256sums=('ce34339bdad50afb9bacb3cbf854e3c33a311dfb868b2ec32a812ca78845b43f'
            '876e67526fabf83bfeb5ff50f05b2f4725f3d9bf784025707b67022a1a311f20'
            '1f25ed346ce4fef23234f62db5d25a99cf5f72ac823ec7ca09260daaf8b2eff7'
            'ae1ed38f94304d27e4ef1ca66e15d544f99681c1e743c510c54d4a112f050421'
            '2a1e079cbea3543f356e6e9571f3d7d2a4b0ab75131ee417115d738ea191c4fb'
            '6bd632f8741b039bad961af3d6850b651e25b7e7a3018d6e2789f350ff93bb78'
            'b1748e826d8e7cccdd825b99864b74dfb5795312f8878d63e9a87105f4382e29')
