# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

_kernelver=$(pacman -Q linux | cut -f2 -d ' ')
_linuxver=${_kernelver%-*}

_basename=dahdi
pkgname=dahdi-linux
_releasename="${_basename}-linux-complete"
pkgver=3.3.0
pkgrel=1
pkgdesc='DAHDI drivers for Asterisk (Digium, OpenVox, Allo and Yeastar cards)'
arch=(x86_64)
url=http://www.asterisk.org
license=(GPL2)
makedepends=(
  libusb
  linux
  linux-headers
)
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}" zaptel)
install="${pkgname}.install"
_tarname="${_releasename}-${pkgver}.${pkgver}"
_srcdirname="${_releasename}-${pkgver}+${pkgver}"
source=("https://downloads.asterisk.org/pub/telephony/${_releasename}/releases/${_tarname}.tar.gz"
        "${pkgname}.service")
sha256sums=('c38d21ae60144d95c63819617e654e47b5bb758e5a9970f3c3337e81e6cb5ad2'
            '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f')

build() {
  cd "${_srcdirname}"
  make DESTDIR="${pkgdir}" all
}

package() {
  depends=(
    libusb
    "linux=${_linuxver//-/.}"
    perl
  )

  cd "${_srcdirname}"
  make DESTDIR="${pkgdir}" install-firmware
  make DESTDIR="${pkgdir}" install-include
  make DESTDIR="${pkgdir}" install-xpp-firm
  rm "${pkgdir}/usr/lib/firmware/".d*
  rm -r "${pkgdir}/usr/lib/hotplug/firmware"
  cd drivers
  find . -name "*.ko" \
    -exec gzip "{}" \; \
    -exec install -Dm0644 "{}.gz" "${pkgdir}/usr/lib/modules/${_kernelver}/extramodules/{}.gz" \;
}
