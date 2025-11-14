# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase=libluise
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgbase}-bin"
)
pkgver=0.1.1
pkgrel=3
pkgdesc="Programming interface for the Wallbraun LCD-USB-Interface."
# url="https://packages.gentoo.org/packages/dev-libs/luise"
url="https://web.archive.org/web/20140102061822/http://wallbraun-electronics.de/"
arch=(
  'i686'
  'x86_64'
)
license=("LGPL-2.1-only") # See https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/luise/luise-0.1.1-r2.ebuild
depends=(
  'glibc'
  'libusb-compat'
)
makedepends=(
  'patchelf'
)
optdepends=()
provides=(
  "${_pkgbase}=${pkgver}"
  "${_pkgbase}.so"
  "luise=${pkgver}"  # That's actually the name of this used in gentoo. The official name seems to be 'LUIse'.
)
conflicts=(
  "${_pkgbase}"
  "${_pkgbase}.so"
  "luise"
)
options+=('staticlibs')
source=(
  "https://dev.gentoo.org/~conikost/files/LUIse_${pkgver}.tar.gz"
  # https://web.archive.org/web/20251114004035/https://dev.gentoo.org/~conikost/files/LUIse_0.1.1.tar.gz
  "description.txt"
)
sha256sums=(
  'c197a82d3b043d40b3d1ebbe2aa5ed7e7b74955bbc1d2316657fd8e27ce16ed0'
  'e8c31a6d6ea4125fdeafb8c18d298cd9e7f0438a28d1c3293a890b9a88a4d337'
)

package() {
  cd "${srcdir}/LUIse_${pkgver}"

  case "${CARCH}" in
    'i686')
      install -Dvm755 "32bit/libluise.so.${pkgver}" "${pkgdir}/usr/lib/libluise.so.${pkgver}"
      ln -svr "${pkgdir}/usr/lib/libluise.so.${pkgver}"  "${pkgdir}/usr/lib/libluise.so"
      install -Dvm644 -t "${pkgdir}/usr/include"  32bit/luise.h
    ;;
    'x86_64')
      install -Dvm755 "64bit/libluise_64.so.${pkgver}" "${pkgdir}/usr/lib/libluise.so.${pkgver}"
      ln -svr "${pkgdir}/usr/lib/libluise.so.${pkgver}"     "${pkgdir}/usr/lib/libluise.so"
      install -Dvm644 -t "${pkgdir}/usr/include"  64bit/luise.h
    ;;
    *)
      error "Architecture '${CARCH}' not supported."
      return 11
    ;;
  esac

  patchelf --set-soname "libluise.so.${pkgver}" "${pkgdir}/usr/lib/libluise.so.${pkgver}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"                     doc/{docu_luise011_Linux.pdf,readme} "${srcdir}/description.txt"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/samples/luise-test"  samples/luise-test/*
}
