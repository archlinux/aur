# Maintainer: Vittorio Gambaletta <archlinux@vittgam.net>
# Original PKGBUILD maintainer: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='xtables-addons-rawnat'
pkgver='2.11'
pkgrel='1'
pkgdesc='xtables-addons-rawnat is a set of additional extensions for the Xtables packet filter that is present in the Linux kernel. This includes the RAWNAT patch.'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://github.com/VittGam/${pkgname}"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=('xtables-addons' 'xtables-addons-dkms')
provides=('xtables-addons' 'xtables-addons-dkms')
install="${pkgname}.install"
source=("https://github.com/VittGam/${pkgname}/archive/v${pkgver}-rawnat.tar.gz")
sha512sums=('02fd586556721c0d5f235606572bf3eb40893d67418667e69062aafff6fb05a32bca29f271768431544234dd898df38a1f9edd75ce0bab240692cd02024ba6de')
_kernver="`pacman -Ql linux| awk '/(\/modules\/)([0-9.-])+-ARCH\/$/ {print $2}'`"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-rawnat"
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
  cd "${srcdir}/${pkgname}-${pkgver}-rawnat"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-rawnat"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
  mv -f "${pkgdir}"/lib/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
}
