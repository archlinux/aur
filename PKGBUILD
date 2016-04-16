# Maintainer: Shalygin Konstantin <k0ste@cn.ru>
# Contributor: Thiago Coutinho <root at thiagoc . net>

pkgname='xtables-addons'
pkgver='2.10'
pkgrel='5'
pkgdesc='Xtables-addons is a set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://${pkgname}.sourceforge.net"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=('xtables-addons-dkms')
replaces=('xtables-addons-dkms')
install="${pkgname}.install"
source=("http://sourceforge.net/projects/${pkgname}/files/Xtables-addons/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2a2d92ae924437d757f55514502c6ef3aeccc6106f729c702efe703ad30f4007')
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
    --with-kbuild="${_kernver}/build"
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
