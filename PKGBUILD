# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='xtables-addons'
pkgver='3.29'
pkgrel='1'
pkgdesc='Set of additional extensions for the Xtables packet filter that is present in the Linux kernel'
arch=('x86_64' 'aarch64')
license=('GPL2')
url="https://inai.de/projects/${pkgname}"
depends=('iptables' 'glibc' 'linux')
makedepends=('linux-api-headers' 'linux-headers' 'libtool' 'gcc' 'pkg-config')
conflicts=("${pkgname}-dkms")
replaces=("${pkgname}-dkms")
source=("https://inai.de/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('eb4a2238a1e928f817f5eb2a58ffb830e2e3bea31fac936d7565c7f2069a38b1')
# define '-lts' for linux-lts package
_linux_custom=""
_kernver="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"

prepare() {
  cd "${pkgname}-${pkgver}"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --libdir="/usr/lib" \
    --mandir="/usr/share/man" \
    --docdir="/usr/share/doc" \
    --libexecdir="/usr/lib/iptables" \
    --with-xtlibdir="/usr/lib/xtables" \
    --with-kbuild="${_kernver}build"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish "${pkgdir}/usr/lib"
  mv -f "${pkgdir}"/lib/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
  rm ${pkgdir}${_kernver}modules.*
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
