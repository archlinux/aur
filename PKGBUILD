# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Michael Rasmussen <michael@michaelsnet.us>
# Contributor: Matt Kemp <matt@mattikus.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=mod_gnutls
pkgver=0.8.3
pkgrel=1
pkgdesc="Apache module for the GnuTLS library"
arch=('i686' 'x86_64')
url="https://mod.gnutls.org/"
license=('Apache')
depends=('apache' 'gnutls')
optdepends=('aprmemcache')
install=${pkgname}.install
source=("http://mod.gnutls.org/downloads/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('3517dddef04e0cb64c4805799d1b749bb6273f99c3ac33634677210fbe60292b'
            'SKIP')

#Thomas Klute <thomas2.klute@uni-dortmund.de>
validpgpkeys=('B471C74C72A7F6EC9FFA46E361459C5287768C53')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf -fiv
    ./configure --with-apxs=/usr/bin/apxs
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -ir 's/@${APXS_BIN} -i -n gnutls mod_gnutls.so/mkdir -p $(DESTDIR)$(AP_LIBEXECDIR)\n\t@${APXS_BIN} -i -S LIBEXECDIR=$(DESTDIR)$(AP_LIBEXECDIR) -n gnutls mod_gnutls.so/' src/Makefile
    make DESTDIR="${pkgdir}/" install
    libtool --finish "${pkgdir}/usr/lib/httpd/modules"
}
