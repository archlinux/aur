# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Aurélien Wailly <aurelien.wailly@gmail.com>

pkgname=netcf
pkgver=0.1.9
pkgrel=2
pkgdesc="A library for configuring network interfaces"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://fedorahosted.org/netcf/"
depends=('augeas>=0.7.4' 'netcfg' 'libxslt' 'libxml2' 'libnl')
makedepends=('gcc')
options=(!libtool)
source=("https://fedorahosted.org/released/netcf/$pkgname-$pkgver.tar.gz"
	"netcf-libnl3.patch::https://bugs.archlinux.org/task/29908?getfile=8775")
md5sums=('4d62010a79d56c12438969da9035b63c'
         'a509be4b819f669fac21e1eaa621e3e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/netcf-libnl3.patch
  aclocal
  automake --add-missing || true
  autoreconf
#  CFLAGS="`pkg-config --cflags libnl-3.0` -DRTNL_LINK_NOT_FOUND=-1"
  CFLAGS="-DNETCF_TRANSACTION=\"true\"" ./configure --prefix=/usr \
	--disable-static \
	--with-init-script=none
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
