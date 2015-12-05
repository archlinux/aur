# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-shared
pkgver=5.0.2
pkgrel=1
pkgdesc="Shared components of seafile: seafile-daemon, libseafile, libseafile python bindings, manuals"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL3')
depends=('ccnet=5.0.2' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'fuse')
makedepends=('vala' 'intltool')
options=('!libtool' '!emptydirs')
install=seafile-shared.install
source=("seafile-v${pkgver}-server.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}-server.tar.gz"
    "libseafile.in.patch")

prepare() {
    cd "${srcdir}"/seafile-${pkgver}-server
    patch -Np1 -i ../libseafile.in.patch
}

build () {
    cd "${srcdir}"/seafile-${pkgver}-server
    ./autogen.sh
    ./configure --disable-server --disable-console --prefix=/usr PYTHON=/usr/bin/python2
    make -j1
}

package () {
    cd "${srcdir}"/seafile-${pkgver}-server
    make DESTDIR="${pkgdir}" install
    # Remove seafile binary
    rm -rf "${pkgdir}/usr/bin/seafile"
    # Remove cli client binary
    rm -rf "${pkgdir}/usr/bin/seaf-cli"
}

sha256sums=('ce34339bdad50afb9bacb3cbf854e3c33a311dfb868b2ec32a812ca78845b43f'
            'a2d7f7cf0c59aba97650af62b3cefd0ceb71a1007c34d9369a88e5769c7f6076')
