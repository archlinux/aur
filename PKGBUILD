# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='xtables-addons'
pkgver='3.26'
pkgrel='1'
pkgdesc='Set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://inai.de/projects/${pkgname}"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=("${pkgname}-dkms")
replaces=("${pkgname}-dkms")
source=("https://inai.de/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0b52df2117bacf2e32d1d3f98d09dbf88b274390733d3955699b108acaf9f2a6')
# define '-lts' for linux-lts package
_linux_custom=""
_kernver="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"

prepare() {
  cd "${pkgname}-${pkgver}"

  autoreconf -fvi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc \
    --libexecdir=/usr/lib/iptables \
    --with-xtlibdir=/usr/lib/xtables \
    --with-kbuild="${_kernver}build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
  mv -f "${pkgdir}"/lib/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
  rm ${pkgdir}${_kernver}modules.*
}
