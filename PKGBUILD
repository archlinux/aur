# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='xtables-addons'
pkgver='3.18'
pkgrel='1'
pkgdesc='Xtables-addons is a set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://inai.de/projects/${pkgname}"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=('xtables-addons-dkms')
replaces=('xtables-addons-dkms')
source=("https://inai.de/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a77914a483ff381663f52120577e5e9355ca07cca73958b038e09d91247458d5')
# define '-lts' for linux-lts package
_linux_custom=""
_kernver="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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
    --with-xtlibdir=/usr/lib/xtables \
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
  rm ${pkgdir}${_kernver}modules.*
}
