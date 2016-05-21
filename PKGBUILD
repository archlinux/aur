# Maintainer: Shalygin Konstantin <k0ste@cn.ru>
# Contributor: Thiago Coutinho <root at thiagoc . net>

pkgname='xtables-addons'
pkgver='2.11'
pkgrel='1'
pkgdesc='Xtables-addons is a set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://${pkgname}.sourceforge.net"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=('xtables-addons-dkms')
replaces=('xtables-addons-dkms')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname}/files/Xtables-addons/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f14f8953a9d3a70157a82883886ff6ec866c61dbea1585edb421478107279921')
_kernver="`pacman -Ql linux| awk '/(\/modules\/)([0-9.-])+-ARCH\/$/ {print $2}'`"

prepare() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc \
    --libexecdir=/usr/lib/iptables \
    --with-xtlibdir=/usr/lib/iptables \
    --with-kbuild="${_kernver}build"
  popd
}

build() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  make
  popd
}

package() {
  pushd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
  mv -f "${pkgdir}"/lib/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
  popd
}
