# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='xtables-addons'
pkgver='2.14'
pkgrel='4'
pkgdesc='Xtables-addons is a set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://${pkgname}.sourceforge.net/"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=('xtables-addons-dkms')
replaces=('xtables-addons-dkms')
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname}/files/Xtables-addons//${pkgname}-${pkgver}.tar.xz"
	"xtables-addons_4.15.patch")
sha256sums=('d215a9a8b8e66aae04b982fa2e1228e8a71e7dfe42320df99e34e5000cbdf152'
            '3cc007d8faa0025e0c2d748b3eb516ad31acbb6781e88efb0b6a7bf0b280db71')
# define 'lts' for linux-lts package
_linux_custom="ARCH"
# define '-lts' for linux-lts package
_linux_localversion=""
_kernver="`pacman -Ql linux${_linux_localversion} | awk '/(\/modules\/)([0-9.-])+-'${_linux_custom}'\/$/ {print $2}'`"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/xtables-addons_4.15.patch"

  ./autogen.sh
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
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
  mv -f "${pkgdir}"/lib/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
}
