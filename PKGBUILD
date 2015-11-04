# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-shared
pkgver=4.4.2
pkgrel=1
pkgdesc="Shared components of seafile: seafile-daemon, libseafile, libseafile python bindings, manuals"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/haiwen/seafile/"
license=('GPL')
depends=('ccnet>=4.4.2' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'fuse')
makedepends=('vala' 'intltool')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-shared.install
source=("seafile-v${pkgver}.tar.gz::https://github.com/haiwen/seafile/archive/v${pkgver}.tar.gz"
        "libseafile.in.patch")

prepare() {
     cd "${srcdir}"/seafile-${pkgver}
      patch -Np1 -i ../libseafile.in.patch
}

build ()
{
	cd "$srcdir/seafile-${pkgver}"
	./autogen.sh
	./configure --disable-server --disable-console --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
}

package ()
{
	cd "${srcdir}/seafile-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Remove seafile binary
	rm -rf "${pkgdir}/usr/bin/seafile"
	# Remove cli client binary
	rm -rf "${pkgdir}/usr/bin/seaf-cli"

	install -D -m644 ${srcdir}/seafile-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
sha256sums=('d1dbfaf22b879858cd1899e8c2b01ee8beaba4b84f5dba301adc8eabfca64e03'
            'a2d7f7cf0c59aba97650af62b3cefd0ceb71a1007c34d9369a88e5769c7f6076')
